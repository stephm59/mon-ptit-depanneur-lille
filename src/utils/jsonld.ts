interface ServiceCityPageData {
  id: string;
  services: { name: string; slug: string };
  cities: { name: string; slug: string };
  meta_title?: string | null;
  meta_description?: string | null;
  cta_subtitle: string;
}

export const generateServiceCityJsonLd = (page: ServiceCityPageData, baseUrl: string = "https://www.monptitdepanneur.fr") => {
  const pageUrl = `${baseUrl}/${page.services.slug}-${page.cities.slug}/`;
  const serviceName = page.services.name;
  const cityName = page.cities.name;
  const isHeatingService = page.services.slug === 'chauffagiste';
  
  // Service-specific data
  const serviceTypeMap = {
    chauffagiste: "Chauffage – chaudières gaz (installation, entretien, dépannage)",
    plombier: "Plomberie (dépannage, installation, entretien)",
    serrurier: "Serrurerie (dépannage, installation, sécurité)",
    vitrier: "Vitrerie (remplacement, réparation, sécurisation)"
  };

  const serviceType = serviceTypeMap[page.services.slug as keyof typeof serviceTypeMap] || "Services de dépannage";

  // Heating-specific offers
  const heatingOffers = [
    { name: "Dépannage chaudière gaz et fioul", area: cityName },
    { name: "Entretien annuel (attestation)", area: cityName },
    { name: "Installation chaudière gaz (condensation)", area: cityName },
    { name: "Remplacement de chaudière ancienne", area: cityName },
    { name: "Entretien de circuit (purge, désembouage)", area: cityName },
    { name: "Conseils économies d'énergie", area: cityName }
  ];

  // Plumbing-specific offers
  const plumbingOffers = [
    { name: "Dépannage fuite d'eau", area: cityName },
    { name: "Installation sanitaire", area: cityName },
    { name: "Débouchage canalisation", area: cityName },
    { name: "Remplacement chauffe-eau", area: cityName },
    { name: "Réparation robinetterie", area: cityName },
    { name: "Entretien cumulus", area: cityName }
  ];

  const offers = isHeatingService ? heatingOffers : plumbingOffers;

  // FAQ data - for now using heating-specific FAQs, can be expanded
  const heatingFAQ = [
    {
      question: `Quels sont vos délais pour un dépannage chaudière à ${cityName} ?`,
      answer: `En cas de panne, nous intervenons généralement en moins de deux heures dans ${cityName} intramuros. Mise en sécurité immédiate, diagnostic rapide puis réparation ou remplacement de la pièce en cause.`
    },
    {
      question: `Quel est le prix moyen d'un entretien annuel de chaudière à ${cityName} ?`,
      answer: "Comptez entre 120 et 160 € TTC selon le type de chaudière (gaz, fioul, condensation). Nettoyage brûleur, contrôle sécurité et émission d'une attestation conforme sont inclus."
    },
    {
      question: `Proposez-vous des contrats d'entretien pour les logements collectifs de ${cityName} ?`,
      answer: "Oui, contrats annuels pour particuliers, bailleurs et syndics : une visite d'entretien planifiée et une assistance prioritaire en cas de panne."
    },
    {
      question: `Êtes-vous disponibles le week-end pour les urgences chauffage à ${cityName} ?`,
      answer: "Oui, des équipes de garde interviennent le samedi et le dimanche. Tarifs communiqués à l'avance ; mise en sécurité puis réparation définitive programmée si nécessaire."
    },
    {
      question: "Travaillez-vous avec les assurances en cas de sinistre lié au chauffage ?",
      answer: "Oui, nous sommes agréés (Maaf, Groupama, Gan, Macif…). Nous fournissons devis, photos et facture, et pouvons échanger avec l'expert pour accélérer la prise en charge."
    }
  ];

  const plumbingFAQ = [
    {
      question: `Quels sont vos délais pour un dépannage plomberie à ${cityName} ?`,
      answer: `En cas de fuite ou urgence plomberie, nous intervenons rapidement dans ${cityName}. Intervention en moins de 2 heures pour stopper la fuite et limiter les dégâts.`
    },
    {
      question: `Quel est le tarif d'intervention pour une fuite d'eau à ${cityName} ?`,
      answer: "Le tarif varie selon la complexité : détection de fuite, réparation canalisation ou remplacement. Devis gratuit sur place avant intervention."
    },
    {
      question: `Intervenez-vous pour déboucher les canalisations à ${cityName} ?`,
      answer: "Oui, nous disposons d'équipements professionnels (spirale, haute pression, caméra) pour déboucher tous types de canalisations."
    },
    {
      question: `Remplacez-vous les chauffe-eau dans ${cityName} ?`,
      answer: "Oui, installation et remplacement de cumulus électriques et chauffe-eau gaz. Conseil sur le dimensionnement selon vos besoins."
    }
  ];

  const faqData = isHeatingService ? heatingFAQ : plumbingFAQ;

  return {
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
        "itemListElement": [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": `${serviceName} ${cityName}`, "item": pageUrl }
        ]
      },
      {
        "@type": "Organization",
        "@id": `${baseUrl}/#etablissement`,
        "name": "Mon p'tit Dépanneur",
        "url": `${baseUrl}/`,
        "logo": "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755088306/logo-mon-ptit-depanneur-contour-blanc_la7i2t.webp",
        "contactPoint": {
          "@type": "ContactPoint",
          "telephone": "+33 3 28 53 48 68",
          "email": "contact@monptitdepanneur.fr",
          "contactType": "customer service",
          "availableLanguage": ["fr"]
        },
        "address": {
          "@type": "PostalAddress",
          "streetAddress": "21 Rue Edouard Delesalle",
          "postalCode": "59000",
          "addressLocality": "Lille",
          "addressCountry": "FR"
        }
      },
      {
        "@type": "Service",
        "@id": `${pageUrl}#service`,
        "name": `${serviceName} ${cityName}`,
        "serviceType": serviceType,
        "provider": { "@id": `${baseUrl}/#etablissement` },
        "areaServed": { "@type": "City", "name": cityName },
        "serviceLocation": {
          "@type": "Place",
          "name": `Mon p'tit Dépanneur – ${cityName}`,
          "address": {
            "@type": "PostalAddress",
            "streetAddress": "21 Rue Edouard Delesalle",
            "postalCode": "59000",
            "addressLocality": "Lille",
            "addressCountry": "FR"
          },
          "geo": { "@type": "GeoCoordinates", "latitude": 50.633224715360676, "longitude": 3.066592403542446 }
        },
        "availableChannel": {
          "@type": "ServiceChannel",
          "servicePhone": { "@type": "ContactPoint", "telephone": "+33 3 28 53 48 68", "contactType": "emergency", "availableLanguage": ["fr"] },
          "serviceUrl": pageUrl
        },
        "hoursAvailable": {
          "@type": "OpeningHoursSpecification",
          "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "opens": "08:00",
          "closes": "18:00"
        },
        "aggregateRating": { "@type": "AggregateRating", "ratingValue": "4.5", "bestRating": "5", "ratingCount": "600" },
        "hasOfferCatalog": {
          "@type": "OfferCatalog",
          "name": `Prestations de ${serviceName.toLowerCase()} – ${cityName}`,
          "itemListElement": offers.map(offer => ({
            "@type": "Offer",
            "itemOffered": { "@type": "Service", "name": offer.name, "areaServed": offer.area }
          }))
        }
      },
      {
        "@type": "FAQPage",
        "@id": `${pageUrl}#faq`,
        "mainEntity": faqData.map(faq => ({
          "@type": "Question",
          "name": faq.question,
          "acceptedAnswer": { "@type": "Answer", "text": faq.answer }
        }))
      },
      {
        "@type": "WebSite",
        "@id": `${baseUrl}/#website`,
        "url": `${baseUrl}/`,
        "name": "Mon p'tit Dépanneur",
        "inLanguage": "fr"
      }
    ]
  };
};