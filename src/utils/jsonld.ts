interface ServiceCityPageData {
  id: string;
  services: { name: string; slug: string };
  cities: { name: string; slug: string };
  meta_title?: string | null;
  meta_description?: string | null;
  cta_subtitle: string;
}

interface ServiceCityOffer {
  title: string;
  description: string;
}

interface ServiceCityFaq {
  question: string;
  answer: string;
}

interface ServiceCityTestimonial {
  rating: number;
  content: string;
  author_name: string;
  location?: string | null;
}

// Lille metropolitan area cities for 3-level breadcrumbs
const LILLE_METRO_CITIES = [
  'villeneuve-d-ascq', 'roubaix', 'tourcoing', 'wattrelos', 'hem', 'croix',
  'wasquehal', 'mouvaux', 'lys-lez-lannoy', 'bondues', 'marcq-en-baroeul',
  'saint-andre-lez-lille', 'la-madeleine', 'lambersart', 'lomme', 'loos',
  'haubourdin', 'wattignies', 'faches-thumesnil', 'lesquin', 'lezennes'
];

// Service-specific images
const getServiceImage = (serviceSlug: string): string => {
  const images = {
    'pompe-a-chaleur': 'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp',
    'chauffagiste': 'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp',
    'plombier': 'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp'
  };
  return images[serviceSlug as keyof typeof images] || 'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp';
};

export const generateServiceCityJsonLd = (
  page: ServiceCityPageData, 
  offers: ServiceCityOffer[] = [],
  faqs: ServiceCityFaq[] = [],
  testimonials: ServiceCityTestimonial[] = [],
  baseUrl: string = "https://www.monptitdepanneur.fr"
) => {
  const pageUrl = `${baseUrl}/${page.services.slug}-${page.cities.slug}/`;
  const serviceName = page.services.name;
  const cityName = page.cities.name;
  const serviceSlug = page.services.slug;
  const citySlug = page.cities.slug;

  // Generate offers as Service items
  const servicesList = offers.map((offer, index) => ({
    "@type": "Service",
    "@id": `${pageUrl}#service-${index}`,
    "name": offer.title,
    "description": offer.description,
    "provider": {
      "@type": "Organization",
      "name": "Mon P'tit Dépanneur"
    },
    "areaServed": {
      "@type": "City",
      "name": cityName
    }
  }));

  // Generate offers for catalog (keeping both for compatibility)
  const offersList = offers.map(offer => ({
    "@type": "Offer",
    "name": offer.title,
    "description": offer.description,
    "provider": {
      "@type": "Organization",
      "name": "Mon P'tit Dépanneur"
    }
  }));

  // Calculate aggregate rating from testimonials
  const aggregateRating = testimonials.length > 0 ? {
    "@type": "AggregateRating",
    "ratingValue": (testimonials.reduce((sum, t) => sum + t.rating, 0) / testimonials.length).toFixed(1),
    "reviewCount": testimonials.length,
    "bestRating": 5,
    "worstRating": 1
  } : null;

  // Generate reviews from testimonials
  const reviews = testimonials.slice(0, 5).map((testimonial, index) => ({
    "@type": "Review",
    "@id": `${pageUrl}#review-${index}`,
    "reviewRating": {
      "@type": "Rating",
      "ratingValue": testimonial.rating,
      "bestRating": 5,
      "worstRating": 1
    },
    "reviewBody": testimonial.content,
    "author": {
      "@type": "Person",
      "name": testimonial.author_name,
      ...(testimonial.location && { "address": testimonial.location })
    }
  }));

  // Determine if 3-level breadcrumb should be used (Lille metro cities)
  const isLilleMetro = LILLE_METRO_CITIES.includes(citySlug);
  
  // Generate breadcrumb list - support 2 or 3 levels
  const breadcrumbItems = [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Accueil",
      "item": `${baseUrl}/`
    }
  ];

  if (isLilleMetro) {
    // 3-level breadcrumb for Lille metropolitan cities
    breadcrumbItems.push({
      "@type": "ListItem", 
      "position": 2,
      "name": `${serviceName} Lille`,
      "item": `${baseUrl}/${serviceSlug}-lille/`
    });
    breadcrumbItems.push({
      "@type": "ListItem",
      "position": 3,
      "name": `${serviceName} ${cityName}`,
      "item": pageUrl
    });
  } else {
    // 2-level breadcrumb for other cities
    breadcrumbItems.push({
      "@type": "ListItem",
      "position": 2, 
      "name": `${serviceName} ${cityName}`,
      "item": pageUrl
    });
  }

  // Generate FAQ from data
  const faqPage = faqs.length > 0 ? {
    "@type": "FAQPage",
    "@id": `${pageUrl}#faq`,
    "mainEntity": faqs.map(faq => ({
      "@type": "Question",
      "name": faq.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": faq.answer
      }
    }))
  } : null;

  const jsonLdData: any = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "WebPage",
        "@id": `${pageUrl}#webpage`,
        "url": pageUrl,
        "name": page.meta_title || `${serviceName} à ${cityName} | Mon p'tit Dépanneur`,
        "isPartOf": { "@id": `${baseUrl}/#website` },
        "about": { "@id": `${baseUrl}/#etablissement` },
        "primaryImageOfPage": {
          "@type": "ImageObject",
          "url": getServiceImage(serviceSlug)
        },
        "inLanguage": "fr",
        "description": page.meta_description || `${serviceName} à ${cityName} : ${page.cta_subtitle}`
      },
      {
        "@type": "BreadcrumbList",
        "@id": `${pageUrl}#breadcrumb`,
        "itemListElement": breadcrumbItems
      },
      {
        "@type": "LocalBusiness",
        "@id": `${baseUrl}/#etablissement`,
        "name": "Mon p'tit Dépanneur",
        "alternateName": "Mon petit dépanneur",
        "description": `Dépannage ${serviceName.toLowerCase()} ${cityName}`,
        "url": baseUrl,
        "telephone": "03 66 88 29 38",
        "priceRange": "€€",
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "42 avenue de Flandre",
          "addressLocality": "Lille",
          "postalCode": "59000",
          "addressCountry": "FR"
        },
        "geo": {
          "@type": "GeoCoordinates",
          "latitude": 50.6311,
          "longitude": 3.0628
        },
        "areaServed": [
          {
            "@type": "City",
            "name": cityName
          }
        ],
        "serviceType": serviceName,
        ...(aggregateRating && { "aggregateRating": aggregateRating }),
        ...(reviews.length > 0 && { "review": reviews }),
        ...(offersList.length > 0 && {
          "hasOfferCatalog": {
            "@type": "OfferCatalog",
            "name": `Services ${serviceName} à ${cityName}`,
            "itemListElement": offersList
          }
        }),
        ...(servicesList.length > 0 && {
          "hasService": servicesList
        }),
        "openingHours": [
          "Mo-Fr 08:00-19:00",
          "Sa 09:00-17:00"
        ],
        "sameAs": [
          "https://www.facebook.com/MonPtitDepanneur",
          "https://www.instagram.com/monptitdepanneur"
        ]
      },
      {
        "@type": "Organization",
        "@id": `${baseUrl}/#organization`,
        "name": "Mon p'tit Dépanneur",
        "url": baseUrl,
        "logo": {
          "@type": "ImageObject",
          "url": "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp"
        }
      },
      {
        "@type": "WebSite",
        "@id": `${baseUrl}/#website`,
        "url": baseUrl,
        "name": "Mon p'tit Dépanneur",
        "description": "Dépannage et intervention rapide",
        "publisher": {
          "@id": `${baseUrl}/#organization`
        },
        "inLanguage": "fr"
      }
    ]
  };

  // Add FAQ page if we have FAQs
  if (faqPage) {
    jsonLdData["@graph"].push(faqPage);
  }

  return jsonLdData;
};

export const generateHomeJsonLd = (baseUrl: string = "https://www.monptitdepanneur.fr") => {
  return {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "WebSite",
        "@id": `${baseUrl}/#website`,
        "url": baseUrl,
        "name": "Mon p'tit Dépanneur",
        "description": "Dépannage et intervention rapide sur Lille et sa métropole",
        "publisher": { "@id": `${baseUrl}/#organization` },
        "inLanguage": "fr"
      },
      {
        "@type": "Organization",
        "@id": `${baseUrl}/#organization`,
        "name": "Mon p'tit Dépanneur",
        "url": baseUrl,
        "logo": {
          "@type": "ImageObject",
          "url": "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp"
        }
      },
      {
        "@type": "LocalBusiness",
        "@id": `${baseUrl}/#etablissement`,
        "name": "Mon p'tit Dépanneur",
        "alternateName": "Mon petit dépanneur",
        "description": "Entreprise de dépannage et d'intervention rapide : chauffage, plomberie, pompe à chaleur sur Lille et sa métropole",
        "url": baseUrl,
        "telephone": "03 66 88 29 38",
        "priceRange": "€€",
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "42 avenue de Flandre",
          "addressLocality": "Lille",
          "postalCode": "59000",
          "addressCountry": "FR"
        },
        "geo": {
          "@type": "GeoCoordinates",
          "latitude": 50.6311,
          "longitude": 3.0628
        },
        "areaServed": [
          { "@type": "City", "name": "Lille" },
          { "@type": "City", "name": "Villeneuve-d'Ascq" },
          { "@type": "City", "name": "Roubaix" },
          { "@type": "City", "name": "Tourcoing" }
        ],
        "serviceType": ["Chauffage", "Plomberie", "Pompe à chaleur"],
        "openingHours": [
          "Mo-Fr 08:00-19:00",
          "Sa 09:00-17:00"
        ],
        "sameAs": [
          "https://www.facebook.com/MonPtitDepanneur",
          "https://www.instagram.com/monptitdepanneur"
        ]
      }
    ]
  };
};