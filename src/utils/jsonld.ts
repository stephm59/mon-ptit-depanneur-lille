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

export const generateServiceCityJsonLd = (
  page: ServiceCityPageData, 
  offers: ServiceCityOffer[] = [],
  faqs: ServiceCityFaq[] = [],
  parentService?: { name: string; slug: string; cityName: string },
  baseUrl: string = "https://www.monptitdepanneur.fr"
) => {
  const pageUrl = `${baseUrl}/${page.services.slug}-${page.cities.slug}/`;
  const serviceName = page.services.name;
  const cityName = page.cities.name;

  // Generate offers from data
  const offersList = offers.map(offer => ({
    "@type": "Offer",
    "name": offer.title,
    "description": offer.description,
    "provider": {
      "@type": "Organization",
      "name": "Mon P'tit Dépanneur"
    }
  }));

  // Generate breadcrumb list - support 2 or 3 levels
  const breadcrumbItems = [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Accueil",
      "item": `${baseUrl}/`
    }
  ];

  if (parentService) {
    // 3-level breadcrumb
    breadcrumbItems.push({
      "@type": "ListItem", 
      "position": 2,
      "name": `${parentService.name} ${parentService.cityName}`,
      "item": `${baseUrl}/${parentService.slug}/`
    });
    breadcrumbItems.push({
      "@type": "ListItem",
      "position": 3,
      "name": `${serviceName} ${cityName}`,
      "item": pageUrl
    });
  } else {
    // 2-level breadcrumb
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
          "url": "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755088306/logo-mon-ptit-depanneur-contour-blanc_la7i2t.webp"
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
        ...(offersList.length > 0 && {
          "hasOfferCatalog": {
            "@type": "OfferCatalog",
            "name": `Services ${serviceName} à ${cityName}`,
            "itemListElement": offersList
          }
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
          "url": "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755088306/logo-mon-ptit-depanneur-contour-blanc_la7i2t.webp"
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
          "url": "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755088306/logo-mon-ptit-depanneur-contour-blanc_la7i2t.webp"
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