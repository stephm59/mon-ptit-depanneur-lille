-- Insert new blog post for pompe à chaleur advantages/disadvantages
INSERT INTO blog_posts (
  service_slug,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  meta_title,
  meta_description,
  jsonld_data
) VALUES (
  'pompe-a-chaleur',
  'Avantages et inconvénients d''une pompe à chaleur : le guide complet',
  'avantages-inconvenients-pompe-chaleur',
  'Découvrez les avantages et inconvénients des pompes à chaleur : économies, confort, écologie, mais aussi limites et contraintes. Guide complet Mon p''tit Dépanneur.',
  'Vous cherchez une solution pour chauffer (et même rafraîchir) votre maison ? La pompe à chaleur, souvent appelée PAC, séduit de plus en plus de foyers en France. Économique, écologique et polyvalente, elle n''est pas exempte de défauts.
👉 Dans cet article, Mon p''tit Dépanneur vous explique ce qu''est une pompe à chaleur, ses avantages, ses inconvénients et les différents modèles existants.

## Qu''est-ce qu''une pompe à chaleur (PAC) ?

La pompe à chaleur est un système de chauffage et de climatisation qui puise de l''énergie dans la nature (air, eau ou sol) pour la restituer dans votre logement.

**En hiver :** elle chauffe vos pièces et peut même produire de l''eau chaude sanitaire.

**En été :** elle fonctionne à l''inverse et rafraîchit l''air intérieur.

Le principe est simple : la pompe à chaleur déplace plus d''énergie qu''elle n''en consomme en électricité, ce qui en fait un système particulièrement efficace.

## Les avantages d''une pompe à chaleur

✅ **Confort toute l''année**
Maintient une température agréable et améliore la qualité de l''air grâce à ses filtres intégrés.

✅ **Efficacité énergétique**
Une PAC aérothermique peut produire 4 kWh de chaleur avec seulement 1 kWh d''électricité, le reste étant puisé gratuitement dans l''air extérieur.

✅ **Durable & écologique**
Moins d''émissions de CO₂ qu''une chaudière à gaz ou au fioul.

✅ **Entretien réduit**
Peu de maintenance nécessaire, pas de recharge périodique comme avec une chaudière fioul ou gaz.

✅ **Polyvalence**
Un seul appareil peut assurer chauffage, climatisation et eau chaude sanitaire.

✅ **Aides financières**
Éligible à des dispositifs comme MaPrimeRénov'' si l''installation est réalisée par un artisan certifié RGE.

## Les inconvénients d''une pompe à chaleur

⚠️ **Dépendance à l''électricité**
Votre facture d''électricité augmente, même si la consommation reste raisonnable.

⚠️ **Unité extérieure visible**
Nécessite de l''espace et peut gêner esthétiquement ou au niveau sonore.

⚠️ **Moins efficace par grand froid**
Les PAC aérothermiques perdent en rendement sous -7°C à -10°C.

⚠️ **Chaleur peu durable**
La chaleur diffusée disparaît vite lorsque l''appareil s''arrête.

## Les différents types de pompes à chaleur

**PAC air-air :** chauffe ou rafraîchit directement l''air ambiant (climatisation réversible).

**PAC air-eau :** chauffe l''eau pour alimenter radiateurs, planchers chauffants ou ballon d''eau chaude.

**PAC eau-eau :** puise l''énergie dans une nappe phréatique ou un circuit d''eau.

**PAC géothermique :** capte la chaleur dans le sol via des capteurs enterrés.

**PAC aérothermique :** hybride, elle peut chauffer, rafraîchir et produire de l''eau chaude.

## Conclusion

La pompe à chaleur est une solution moderne, économique et écologique pour chauffer et rafraîchir son logement.
👉 Si vous hésitez encore, l''équipe de Mon p''tit Dépanneur peut vous conseiller et installer le modèle le mieux adapté à votre maison.
📞 Contactez-nous au 03 28 53 48 68 pour une étude gratuite de votre projet.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pompe-chaleur-avantages.webp',
  true,
  'Avantages et inconvénients d''une pompe à chaleur : guide complet 2024',
  'Découvrez les avantages et inconvénients des pompes à chaleur (PAC) : confort, économies, écologie, mais aussi limites et contraintes. Conseils Mon p''tit Dépanneur.',
  '{
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Avantages et inconvénients de la pompe à chaleur",
    "description": "Découvrez les avantages et inconvénients des pompes à chaleur (PAC) : confort, économies, écologie, mais aussi limites et contraintes. Explications simples, types de PAC et conseils Mon p''tit Dépanneur.",
    "url": "https://monptitdepanneur.fr/carnet/avantages-inconvenients-pompe-chaleur",
    "breadcrumb": {
      "@type": "BreadcrumbList",
      "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Accueil", "item": "https://monptitdepanneur.fr/" },
        { "@type": "ListItem", "position": 2, "name": "Carnet conseils", "item": "https://monptitdepanneur.fr/carnet/" },
        { "@type": "ListItem", "position": 3, "name": "Avantages et inconvénients de la pompe à chaleur" }
      ]
    },
    "mainEntity": {
      "@type": "Service",
      "serviceType": "Installation pompe à chaleur",
      "provider": {
        "@type": "LocalBusiness",
        "name": "Mon p''tit Dépanneur",
        "telephone": "03 28 53 48 68",
        "areaServed": "Hauts-de-France",
        "url": "https://monptitdepanneur.fr",
        "image": "https://res.cloudinary.com/dit7nfyiy/image/upload/logo-mon-ptit-depanneur.webp"
      },
      "offers": {
        "@type": "Offer",
        "url": "https://monptitdepanneur.fr/contact",
        "priceCurrency": "EUR",
        "eligibleRegion": "FR",
        "availability": "https://schema.org/InStock"
      }
    },
    "faq": {
      "@type": "FAQPage",
      "mainEntity": [
        { "@type": "Question", "name": "La pompe à chaleur est-elle rentable ?", "acceptedAnswer": { "@type": "Answer", "text": "Oui, sur le long terme. Les économies d''énergie réduisent vos factures de 30 à 60 %." } },
        { "@type": "Question", "name": "Quelle est la durée de vie d''une pompe à chaleur ?", "acceptedAnswer": { "@type": "Answer", "text": "En moyenne 15 à 20 ans avec un entretien régulier." } },
        { "@type": "Question", "name": "Une pompe à chaleur fait-elle du bruit ?", "acceptedAnswer": { "@type": "Answer", "text": "Les unités extérieures émettent un léger bruit, mais les modèles récents sont très silencieux." } },
        { "@type": "Question", "name": "Peut-on installer une pompe à chaleur dans une maison ancienne ?", "acceptedAnswer": { "@type": "Answer", "text": "Oui, mais une bonne isolation est nécessaire pour de bonnes performances." } },
        { "@type": "Question", "name": "Quelle différence entre PAC air-air et air-eau ?", "acceptedAnswer": { "@type": "Answer", "text": "Air-air : chauffe l''air directement. Air-eau : chauffe l''eau pour radiateurs ou plancher chauffant." } },
        { "@type": "Question", "name": "Quelles aides financières pour une PAC ?", "acceptedAnswer": { "@type": "Answer", "text": "MaPrimeRénov'', éco-PTZ et CEE, à condition de passer par un artisan RGE." } }
      ]
    }
  }'::jsonb
)
ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  content = EXCLUDED.content,
  cover_image_url = EXCLUDED.cover_image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description,
  jsonld_data = EXCLUDED.jsonld_data,
  updated_at = NOW();

-- Insert FAQs for this blog post
INSERT INTO blog_post_faqs (blog_post_slug, question, answer, display_order) VALUES
('avantages-inconvenients-pompe-chaleur', 'La pompe à chaleur est-elle rentable ?', 'Oui, sur le long terme. Même si l''investissement de départ est élevé, les économies d''énergie peuvent réduire vos factures de chauffage de 30 à 60 %.', 1),
('avantages-inconvenients-pompe-chaleur', 'Quelle est la durée de vie d''une pompe à chaleur ?', 'En moyenne, 15 à 20 ans, à condition d''un entretien régulier.', 2),
('avantages-inconvenients-pompe-chaleur', 'Une pompe à chaleur fait-elle du bruit ?', 'L''unité extérieure peut générer un léger bruit (ventilateur, compresseur), mais les modèles récents sont de plus en plus silencieux.', 3),
('avantages-inconvenients-pompe-chaleur', 'Peut-on installer une pompe à chaleur dans une maison ancienne ?', 'Oui, mais il faut vérifier l''isolation. Une maison mal isolée réduira les performances de la PAC.', 4),
('avantages-inconvenients-pompe-chaleur', 'Quelle différence entre PAC air-air et air-eau ?', 'Air-air : chauffe directement l''air (idéal pour clim réversible). Air-eau : chauffe de l''eau pour radiateurs, plancher chauffant et ballon d''eau chaude.', 5),
('avantages-inconvenients-pompe-chaleur', 'Quelles aides financières pour une PAC ?', 'MaPrimeRénov'', Éco-prêt à taux zéro (éco-PTZ), Certificats d''économie d''énergie (CEE) - À condition de passer par un artisan RGE.', 6)
ON CONFLICT (blog_post_slug, question) DO UPDATE SET
  answer = EXCLUDED.answer,
  display_order = EXCLUDED.display_order;