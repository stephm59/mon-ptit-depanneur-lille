import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const SUPABASE_URL = "https://bpwqdkznbmqwvvxpthhl.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJwd3Fka3puYm1xd3Z2eHB0aGhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcwODA1OTAsImV4cCI6MjA3MjY1NjU5MH0.K4yFyinsjcneqLSGXTMbVCcNow9HroVuIYlyi3rD2yk";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

async function generateServiceCityPage(serviceSlug, citySlug) {
  console.log(`🔧 Génération de la page ${serviceSlug}-${citySlug}...`);

  // Fetch page data
  const { data: page, error: pageError } = await supabase
    .from('service_city_pages')
    .select(`
      *,
      service:services(*),
      city:cities(*)
    `)
    .eq('service.slug', serviceSlug)
    .eq('city.slug', citySlug)
    .eq('published', true)
    .single();

  if (pageError || !page) {
    console.error(`❌ Erreur: page non trouvée`, pageError);
    return;
  }

  // Fetch offers
  const { data: offers } = await supabase
    .from('service_city_offers')
    .select('*')
    .eq('page_id', page.id)
    .order('position');

  // Fetch FAQs (local + generic)
  const { data: localFaqs } = await supabase
    .from('service_city_faqs')
    .select('*')
    .eq('service_id', page.service_id)
    .eq('city_id', page.city_id)
    .eq('published', true)
    .order('position');

  const { data: genericFaqs } = await supabase
    .from('service_faqs_generic')
    .select('*')
    .eq('service_id', page.service_id)
    .eq('published', true)
    .order('position');

  const faqs = [...(localFaqs || []), ...(genericFaqs || [])].slice(0, 8);

  // Fetch testimonials
  const { data: testimonials } = await supabase
    .from('testimonials')
    .select(`
      *,
      service:services(name),
      city:cities(name)
    `)
    .eq('published', true)
    .or(`service_id.eq.${page.service_id},city_id.eq.${page.city_id}`)
    .order('created_at', { ascending: false })
    .limit(6);

  // Generate JSON-LD
  const baseUrl = 'https://www.monptitdepanneur.fr';
  const jsonLd = generateJsonLd(page, offers, faqs, testimonials, baseUrl);

  // Generate HTML
  const { generateTemplate } = await import('./templates/service-city-template.js');
  const html = generateTemplate({
    page,
    service: page.service,
    city: page.city,
    offers: offers || [],
    faqs: faqs || [],
    testimonials: testimonials || [],
    jsonLd,
    baseUrl
  });

  // Write HTML file
  const outputPath = path.join(__dirname, '..', 'public', `${serviceSlug}-${citySlug}.html`);
  fs.writeFileSync(outputPath, html, 'utf-8');
  console.log(`✅ Page générée: ${outputPath}`);
}

function generateJsonLd(page, offers, faqs, testimonials, baseUrl) {
  const url = `${baseUrl}/${page.service.slug}-${page.city.slug}`;
  
  const jsonLd = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "WebPage",
        "@id": `${url}#webpage`,
        "url": url,
        "name": page.meta_title || page.h1,
        "description": page.meta_description,
        "isPartOf": { "@id": `${baseUrl}/#website` },
        "breadcrumb": { "@id": `${url}#breadcrumb` }
      },
      {
        "@type": "BreadcrumbList",
        "@id": `${url}#breadcrumb`,
        "itemListElement": [
          {
            "@type": "ListItem",
            "position": 1,
            "name": "Accueil",
            "item": baseUrl
          },
          {
            "@type": "ListItem",
            "position": 2,
            "name": page.h1,
            "item": url
          }
        ]
      },
      {
        "@type": "LocalBusiness",
        "@id": `${baseUrl}/#organization`,
        "name": "Mon p'tit Dépanneur",
        "telephone": "03 28 53 48 68",
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "12 Rue de la République",
          "addressLocality": "Lille",
          "postalCode": "59000",
          "addressCountry": "FR"
        },
        "geo": {
          "@type": "GeoCoordinates",
          "latitude": "50.6292",
          "longitude": "3.0573"
        },
        "areaServed": {
          "@type": "City",
          "name": page.city.name
        },
        "priceRange": "€€",
        "openingHours": "Mo-Su 00:00-23:59"
      }
    ]
  };

  // Add FAQPage if FAQs exist
  if (faqs && faqs.length > 0) {
    jsonLd["@graph"].push({
      "@type": "FAQPage",
      "@id": `${url}#faq`,
      "mainEntity": faqs.map(faq => ({
        "@type": "Question",
        "name": faq.question,
        "acceptedAnswer": {
          "@type": "Answer",
          "text": faq.answer
        }
      }))
    });
  }

  // Add reviews
  if (testimonials && testimonials.length > 0) {
    const reviews = testimonials.map(t => ({
      "@type": "Review",
      "author": { "@type": "Person", "name": t.author_name },
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": t.rating,
        "bestRating": 5
      },
      "reviewBody": t.content
    }));
    
    jsonLd["@graph"][2].review = reviews;
  }

  return JSON.stringify(jsonLd);
}

// Generate pages
async function main() {
  console.log('🚀 Génération des pages HTML statiques...\n');
  
  // Generate plombier-lille first
  await generateServiceCityPage('plombier', 'lille');
  
  console.log('\n✨ Génération terminée!');
}

main().catch(console.error);
