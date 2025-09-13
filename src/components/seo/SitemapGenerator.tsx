import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

// Pages statiques du site
const STATIC_PAGES = [
  "/",
  "/contact", 
  "/entreprise",
  "/avis",
  "/mentions-legales",
  "/carnet"
];

interface SitemapData {
  staticPages: string[];
  serviceCityPages: string[];
  blogPosts: Array<{
    slug: string;
    updated_at: string;
  }>;
}

const useSitemapData = () => {
  return useQuery({
    queryKey: ["sitemap-data"],
    queryFn: async (): Promise<SitemapData> => {
      // Récupérer les pages service-ville
      const { data: serviceCityPages, error: serviceCityError } = await supabase
        .from("service_city_pages")
        .select(`
          service:services(slug),
          city:cities(slug)
        `)
        .eq("published", true);

      if (serviceCityError) {
        console.error("Erreur pages service-ville:", serviceCityError);
      }

      // Récupérer les articles de blog
      const { data: blogPosts, error: blogError } = await supabase
        .from("blog_posts")
        .select("slug, updated_at")
        .eq("published", true)
        .order("updated_at", { ascending: false });

      if (blogError) {
        console.error("Erreur articles blog:", blogError);
      }

      // Formater les URLs des pages service-ville
      const serviceCityUrls = serviceCityPages?.map(page => {
        const serviceSlug = page.service?.slug;
        const citySlug = page.city?.slug;
        return `/${serviceSlug}-${citySlug}`;
      }) || [];

      return {
        staticPages: STATIC_PAGES,
        serviceCityPages: serviceCityUrls,
        blogPosts: blogPosts?.map(post => ({
          slug: `/carnet/${post.slug}`,
          updated_at: post.updated_at
        })) || []
      };
    },
    staleTime: 1000 * 60 * 5, // 5 minutes
  });
};

export const generateSitemapXml = (data: SitemapData, baseUrl: string = "https://www.monptitdepanneur.com"): string => {
  const currentDate = new Date().toISOString();
  
  let sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">`;

  // Pages statiques
  data.staticPages.forEach(page => {
    const priority = page === "/" ? "1.0" : "0.8";
    sitemap += `
  <url>
    <loc>${baseUrl}${page}</loc>
    <lastmod>${currentDate}</lastmod>
    <changefreq>weekly</changefreq>
    <priority>${priority}</priority>
  </url>`;
  });

  // Pages service-ville
  data.serviceCityPages.forEach(page => {
    sitemap += `
  <url>
    <loc>${baseUrl}${page}</loc>
    <lastmod>${currentDate}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>`;
  });

  // Articles de blog
  data.blogPosts.forEach(post => {
    const lastmod = new Date(post.updated_at).toISOString();
    sitemap += `
  <url>
    <loc>${baseUrl}${post.slug}</loc>
    <lastmod>${lastmod}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>`;
  });

  sitemap += `
</urlset>`;

  return sitemap;
};

export const SitemapGenerator = () => {
  const { data, isLoading, error } = useSitemapData();
  
  if (isLoading) return <div>Génération du sitemap...</div>;
  if (error) return <div>Erreur lors de la génération du sitemap</div>;
  if (!data) return null;

  return null; // Ce composant ne rend rien, il est utilisé pour les données
};

export { useSitemapData };