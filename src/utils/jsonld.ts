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
  const isHeatPumpService = page.services.slug === 'pompe-a-chaleur';
  const isVieuxLille = page.cities.slug === 'vieux-lille';
  
  // Service-specific data
  const serviceTypeMap = {
    chauffagiste: "Chauffage – chaudières gaz (installation, entretien, dépannage)",
    'pompe-a-chaleur': "Pompes à chaleur air/eau et air/air (installation, entretien, dépannage)",
    plombier: "Plomberie (dépannage, installation, entretien)",
    serrurier: "Serrurerie (dépannage, installation, sécurité)",
    vitrier: "Vitrerie (remplacement, réparation, sécurisation)"
  };

  const serviceType = serviceTypeMap[page.services.slug as keyof typeof serviceTypeMap] || "Services de dépannage";

  // Vieux-Lille specific heating offers
  const vieuxLilleHeatingOffers = [
    { name: "Dépannage chaudière gaz et fioul", area: "Vieux-Lille" },
    { name: "Entretien annuel (attestation)", area: "Vieux-Lille" },
    { name: "Installation chaudière gaz à condensation (compacte)", area: "Vieux-Lille" },
    { name: "Remplacement de chaudière vétuste", area: "Vieux-Lille" },
    { name: "Entretien circuits (purge, désembouage radiateurs)", area: "Vieux-Lille" },
    { name: "Conseils économies d'énergie pour logements anciens", area: "Vieux-Lille" }
  ];

  // Villeneuve-d'Ascq specific heating offers
  const villeneuveAscqHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "Villeneuve-d'Ascq" },
    { name: "Entretien annuel (attestation)", area: "Villeneuve-d'Ascq" },
    { name: "Installation chaudière à condensation (compacte)", area: "Villeneuve-d'Ascq" },
    { name: "Remplacement d'ancienne chaudière", area: "Villeneuve-d'Ascq" },
    { name: "Purge et désembouage de circuit", area: "Villeneuve-d'Ascq" },
    { name: "Conseils économies d'énergie", area: "Villeneuve-d'Ascq" }
  ];

  // Marcq-en-Barœul specific heating offers
  const marcqBaroeulHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "Marcq-en-Barœul" },
    { name: "Entretien annuel (attestation)", area: "Marcq-en-Barœul" },
    { name: "Installation chaudière à condensation (compacte)", area: "Marcq-en-Barœul" },
    { name: "Remplacement d'ancienne chaudière", area: "Marcq-en-Barœul" },
    { name: "Équilibrage, purge et désembouage", area: "Marcq-en-Barœul" },
    { name: "Conseils économies d'énergie", area: "Marcq-en-Barœul" }
  ];

  // Bondues specific heating offers
  const bonduesHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "Bondues" },
    { name: "Entretien annuel (attestation)", area: "Bondues" },
    { name: "Installation chaudière à condensation", area: "Bondues" },
    { name: "Remplacement d'ancienne chaudière", area: "Bondues" },
    { name: "Équilibrage & désembouage de circuit", area: "Bondues" },
    { name: "Conseils économies d'énergie", area: "Bondues" }
  ];

  // La Madeleine specific heating offers
  const laMadeleineHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "La Madeleine" },
    { name: "Entretien annuel (attestation)", area: "La Madeleine" },
    { name: "Installation chaudière à condensation (compacte)", area: "La Madeleine" },
    { name: "Remplacement d'ancienne chaudière", area: "La Madeleine" },
    { name: "Équilibrage & désembouage de circuit", area: "La Madeleine" },
    { name: "Conseils économies d'énergie", area: "La Madeleine" }
  ];

  // Lambersart specific heating offers
  const lambersartHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "Lambersart" },
    { name: "Entretien annuel (attestation)", area: "Lambersart" },
    { name: "Installation chaudière à condensation (compacte et performante)", area: "Lambersart" },
    { name: "Remplacement d'ancienne chaudière", area: "Lambersart" },
    { name: "Équilibrage & désembouage de circuit", area: "Lambersart" },
    { name: "Conseils économies d'énergie", area: "Lambersart" }
  ];

  // Saint-André-lez-Lille specific heating offers
  const saintAndreHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "Saint-André-lez-Lille" },
    { name: "Entretien annuel (attestation)", area: "Saint-André-lez-Lille" },
    { name: "Installation chaudière à condensation (compacte et performante)", area: "Saint-André-lez-Lille" },
    { name: "Remplacement d'ancienne chaudière", area: "Saint-André-lez-Lille" },
    { name: "Équilibrage & désembouage de circuit", area: "Saint-André-lez-Lille" },
    { name: "Conseils économies d'énergie", area: "Saint-André-lez-Lille" }
  ];

  // Lomme specific heating offers
  const lommeHeatingOffers = [
    { name: "Dépannage chaudière gaz/fioul", area: "Lomme" },
    { name: "Entretien annuel (attestation)", area: "Lomme" },
    { name: "Installation chaudière à condensation (compacte et performante)", area: "Lomme" },
    { name: "Remplacement d'ancienne chaudière", area: "Lomme" },
    { name: "Équilibrage & désembouage de circuit", area: "Lomme" },
    { name: "Conseils économies d'énergie", area: "Lomme" }
  ];

  // Heat pump specific offers for Lille
  const heatPumpLilleOffers = [
    { name: "Étude & dimensionnement PAC", area: "Lille" },
    { name: "Installation PAC air/eau + ballon ECS", area: "Lille" },
    { name: "Remplacement chaudière par PAC", area: "Lille" },
    { name: "Optimisation circuit (équilibrage & désembouage)", area: "Lille" },
    { name: "Entretien & dépannage PAC", area: "Lille" },
    { name: "Aides & conformité (MaPrimeRénov', CEE)", area: "Lille" }
  ];

  // Vieux-Lille specific heat pump offers
  const vieuxLilleHeatPumpOffers = [
    { name: "Étude & dimensionnement PAC au Vieux-Lille", area: "Vieux-Lille" },
    { name: "Installation PAC air/eau + ballon ECS", area: "Vieux-Lille" },
    { name: "Remplacement de chaudière par PAC", area: "Vieux-Lille" },
    { name: "Optimisation circuit (équilibrage & désembouage)", area: "Vieux-Lille" },
    { name: "Entretien & dépannage PAC", area: "Vieux-Lille" },
    { name: "Aides & conformité copro (MaPrimeRénov', CEE)", area: "Vieux-Lille" }
  ];

  // Default heating offers
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

  // Vieux-Lille specific FAQ
  const vieuxLilleFAQ = [
    {
      question: "Vos délais pour un dépannage chaudière dans le Vieux-Lille ?",
      answer: "Intervention moyenne sous 2 heures dans le Vieux-Lille. Nous connaissons les contraintes d'accès (rues piétonnes, escaliers étroits). Mise en sécurité immédiate puis réparation ou remplacement des pièces nécessaires."
    },
    {
      question: "Quel est le tarif d'un entretien de chaudière dans un appartement ancien du Vieux-Lille ?",
      answer: "Entre 120 et 160 € TTC selon l'appareil (gaz, fioul, condensation). Comprend nettoyage du brûleur, contrôle sécurité, réglages et attestation obligatoire pour l'assurance."
    },
    {
      question: "Pouvez-vous intervenir dans les immeubles historiques aux accès étroits ?",
      answer: "Oui. Matériel compact, protections des parties communes, respect des conduits existants et des normes en vigueur. Nous adaptons la logistique (sous-sols, cages d'escalier) pour préserver les lieux."
    },
    {
      question: "Installez-vous des chaudières adaptées aux petits logements du Vieux-Lille ?",
      answer: "Oui. Modèles gaz à condensation compacts, intégrables en cuisine/cellier exigu, avec haut rendement pour réduire la consommation énergétique sans sacrifier l'espace."
    },
    {
      question: "Êtes-vous disponibles le week-end pour les pannes de chauffage ?",
      answer: "Oui. Permanence le samedi et le dimanche pour les urgences. Tarifs de week-end annoncés à l'avance ; sécurisation immédiate et réparation définitive programmée si besoin."
    },
    {
      question: "Travaillez-vous avec les syndics pour les chaudières collectives du Vieux-Lille ?",
      answer: "Oui. Entretien des chaudières collectives, vérification des colonnes montantes et coordination avec gardiens et copropriétés pour limiter les coupures d'eau chaude."
    },
    {
      question: "Puis-je bénéficier d'aides pour remplacer ma vieille chaudière ?",
      answer: "Oui. Aides possibles (ex. MaPrimeRénov', primes énergie) sous conditions. Nous conseillons le modèle éligible et aidons à constituer un dossier complet."
    },
    {
      question: "Quelles zones du Vieux-Lille couvrez-vous ?",
      answer: "Toutes les rues du Vieux-Lille : Esquermoise, Gand, Royale, Basse, place du Concert, ainsi que les secteurs limitrophes (Centre, Saint-Maurice, Vauban)."
    }
  ];

  const isVilleneuveAscq = page.cities.slug === 'villeneuve-d-ascq';
  const isMarcqBaroeul = page.cities.slug === 'marcq-en-baroeul';
  const isBondues = page.cities.slug === 'bondues';
  const isLaMadeleine = page.cities.slug === 'la-madeleine';
  const isLambersart = page.cities.slug === 'lambersart';
  const isSaintAndre = page.cities.slug === 'saint-andre-lez-lille';
  const isLomme = page.cities.slug === 'lomme';
  const offers = isHeatingService 
    ? (isVieuxLille ? vieuxLilleHeatingOffers : isVilleneuveAscq ? villeneuveAscqHeatingOffers : isMarcqBaroeul ? marcqBaroeulHeatingOffers : isBondues ? bonduesHeatingOffers : isLaMadeleine ? laMadeleineHeatingOffers : isLambersart ? lambersartHeatingOffers : isSaintAndre ? saintAndreHeatingOffers : isLomme ? lommeHeatingOffers : heatingOffers) 
    : isHeatPumpService 
    ? (isVieuxLille ? vieuxLilleHeatPumpOffers : heatPumpLilleOffers)
    : plumbingOffers;

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

  // Heat pump FAQ
  const heatPumpFAQ = [
    {
      question: `PAC air/eau ou air/air : laquelle choisir à ${cityName} ?`,
      answer: "La PAC air/eau alimente radiateurs/plan cher et peut produire l'ECS : idéale en remplacement d'une chaudière. La PAC air/air chauffe via unités intérieures (pas d'ECS) et convient bien aux logements compacts ou en appoint."
    },
    {
      question: `Une PAC fonctionne-t-elle bien l'hiver à ${cityName} ?`,
      answer: "Oui si le dimensionnement et la loi d'eau sont bien réglés. On vise la basse température avec émetteurs adaptés. En pointe de froid, un appoint (électrique ou chaudière existante) peut prendre le relais."
    },
    {
      question: `Ma copropriété impose des règles de bruit : est-ce compatible ?`,
      answer: "Oui. Unités extérieures silencieuses, plots antivibratiles, cloisons acoustiques et respect des distances réglementaires. Dossier copropriété fourni avec fiches acoustiques si nécessaire."
    },
    {
      question: `Puis-je garder mes radiateurs en fonte à ${cityName} ?`,
      answer: "Souvent oui. Nous vérifions la température de départ requise, réalisons un désembouage et rééquilibrons les débits. Remplacement ponctuel par des émetteurs basse température si besoin."
    },
    {
      question: `Quelles économies espérer avec une PAC ?`,
      answer: "Selon isolation, émetteurs et usage. Objectif : SCOP élevé via dimensionnement précis et réglages fins, ce qui réduit la consommation par rapport au gaz/fioul. Nous fournissons une projection chiffrée après étude."
    }
  ];

  const faqData = isHeatingService ? (isVieuxLille ? vieuxLilleFAQ : heatingFAQ) : isHeatPumpService ? heatPumpFAQ : plumbingFAQ;

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
        "itemListElement": isHeatPumpService && isVieuxLille ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Pompe à chaleur Lille", "item": `${baseUrl}/pompe-a-chaleur-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Pompe à chaleur Vieux-Lille", "item": pageUrl }
        ] : isHeatPumpService ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Pompe à chaleur Lille", "item": pageUrl }
        ] : isVieuxLille ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Vieux-Lille", "item": pageUrl }
        ] : isVilleneuveAscq ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Villeneuve-d'Ascq", "item": pageUrl }
        ] : isMarcqBaroeul ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Marcq-en-Barœul", "item": pageUrl }
        ] : isBondues ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Bondues", "item": pageUrl }
        ] : isLaMadeleine ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste La Madeleine", "item": pageUrl }
        ] : isLambersart ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Lambersart", "item": pageUrl }
        ] : isSaintAndre ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Saint-André-lez-Lille", "item": pageUrl }
        ] : isLomme ? [
          { "@type": "ListItem", "position": 1, "name": "Accueil", "item": `${baseUrl}/` },
          { "@type": "ListItem", "position": 2, "name": "Chauffagiste Lille", "item": `${baseUrl}/chauffagiste-lille/` },
          { "@type": "ListItem", "position": 3, "name": "Chauffagiste Lomme", "item": pageUrl }
        ] : [
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
        "areaServed": { "@type": "City", "name": isVieuxLille ? "Lille - Vieux-Lille" : cityName },
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
        "aggregateRating": { "@type": "AggregateRating", "ratingValue": (isVieuxLille || isVilleneuveAscq || isMarcqBaroeul || isBondues || isLaMadeleine || isLambersart || isSaintAndre || isLomme || isHeatPumpService) ? "4.6" : "4.5", "bestRating": "5", "ratingCount": (isVieuxLille || isVilleneuveAscq || isMarcqBaroeul || isBondues || isLaMadeleine || isLambersart || isSaintAndre || isLomme || isHeatPumpService) ? "320" : "600" },
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