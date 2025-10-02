import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.57.2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
    const supabase = createClient(supabaseUrl, supabaseKey);

    const baseUrl = 'https://www.monptitdepanneur.fr';

    // Pages statiques
    const staticPages = [
      { loc: '/', changefreq: 'weekly', priority: '1.0', lastmod: new Date().toISOString() },
      { loc: '/contact', changefreq: 'monthly', priority: '0.8', lastmod: new Date().toISOString() },
      { loc: '/entreprise', changefreq: 'monthly', priority: '0.8', lastmod: new Date().toISOString() },
      { loc: '/avis', changefreq: 'weekly', priority: '0.8', lastmod: new Date().toISOString() },
      { loc: '/carnet', changefreq: 'daily', priority: '0.9', lastmod: new Date().toISOString() },
      { loc: '/sitemap', changefreq: 'monthly', priority: '0.5', lastmod: new Date().toISOString() },
    ];

    // Récupérer les pages service-ville
    const { data: serviceCityPages } = await supabase
      .from('service_city_pages')
      .select(`
        updated_at,
        services!inner(slug),
        cities!inner(slug)
      `)
      .eq('published', true);

    const serviceCityUrls = (serviceCityPages || []).map((page: any) => ({
      loc: `/${page.services.slug}-${page.cities.slug}`,
      changefreq: 'weekly',
      priority: '0.9',
      lastmod: page.updated_at,
    }));

    // Récupérer les articles de blog
    const { data: blogPosts } = await supabase
      .from('blog_posts')
      .select('slug, updated_at')
      .eq('published', true)
      .order('published_at', { ascending: false });

    const blogUrls = (blogPosts || []).map((post: any) => ({
      loc: `/carnet/${post.slug}`,
      changefreq: 'monthly',
      priority: '0.7',
      lastmod: post.updated_at,
    }));

    // Combiner toutes les URLs
    const allUrls = [...staticPages, ...serviceCityUrls, ...blogUrls];

    // Générer le XML
    const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${allUrls
  .map(
    (url) => `  <url>
    <loc>${baseUrl}${url.loc}</loc>
    <lastmod>${url.lastmod.split('T')[0]}</lastmod>
    <changefreq>${url.changefreq}</changefreq>
    <priority>${url.priority}</priority>
  </url>`
  )
  .join('\n')}
</urlset>`;

    console.log(`Generated sitemap with ${allUrls.length} URLs`);

    return new Response(xml, {
      headers: {
        ...corsHeaders,
        'Content-Type': 'application/xml; charset=utf-8',
      },
    });
  } catch (error) {
    console.error('Error generating sitemap:', error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }
});
