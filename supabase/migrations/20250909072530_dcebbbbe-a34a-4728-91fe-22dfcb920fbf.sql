-- Créer les 6 articles de blog pour Pompe à chaleur 
INSERT INTO blog_posts (
  title,
  slug,
  excerpt,
  content,
  service_id,
  published,
  published_at
) VALUES
(
  'PAC air/eau vs air/air : quelle solution pour un appartement lillois ?',
  'pac-air-eau-vs-air-air-appartement-lille',
  'Comparatif détaillé entre PAC air/eau et air/air pour choisir la solution idéale selon votre logement lillois.',
  'Dans le choix d''une pompe à chaleur pour votre appartement lillois, deux technologies principales s''offrent à vous : la PAC air/eau et la PAC air/air. Chacune présente des avantages spécifiques selon votre configuration...',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  true,
  NOW()
),
(
  'Bien régler la loi d''eau de sa PAC pour l''hiver à Lille',
  'regler-loi-eau-pac-hiver-lille',
  'Guide pratique pour optimiser les réglages de votre pompe à chaleur et maximiser son efficacité durant l''hiver lillois.',
  'La loi d''eau est un paramètre crucial pour le bon fonctionnement de votre PAC durant l''hiver lillois. Un réglage optimal permet de concilier confort thermique et économies d''énergie...',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  true,
  NOW() - INTERVAL '7 days'
),
(
  'Remplacer sa chaudière par une PAC : étapes, délais, points de vigilance',
  'remplacement-chaudiere-pac-etapes-delais',
  'Tout savoir sur le remplacement de votre chaudière par une pompe à chaleur : planning, contraintes techniques et bonnes pratiques.',
  'Le remplacement d''une chaudière par une pompe à chaleur nécessite une préparation minutieuse. De l''étude thermique à la mise en service, découvrez les étapes clés de votre projet...',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  true,
  NOW() - INTERVAL '14 days'
),
(
  'Bruit d''une unité extérieure : bonnes pratiques en copropriété',
  'bruit-unite-exterieure-copropriete-bonnes-pratiques',
  'Comment installer une PAC en respectant la réglementation acoustique et préserver de bonnes relations avec vos voisins.',
  'L''installation d''une PAC en copropriété soulève souvent des questions de nuisances sonores. Découvrez les solutions techniques et réglementaires pour un projet serein...',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  true,
  NOW() - INTERVAL '21 days'
),
(
  'Désembouage et PAC : pourquoi c''est crucial pour le rendement',
  'desembouage-pac-crucial-rendement-efficacite',
  'L''importance du désembouage lors de l''installation d''une PAC : impact sur les performances, la durabilité et les économies.',
  'Un circuit de chauffage encrassé peut réduire considérablement l''efficacité de votre nouvelle PAC. Le désembouage préalable est une étape indispensable pour optimiser votre installation...',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  true,
  NOW() - INTERVAL '28 days'
),
(
  'Entretien d''une PAC : check-list annuelle indispensable',
  'entretien-pac-checklist-annuelle-indispensable',
  'Guide complet de l''entretien annuel de votre pompe à chaleur : points de contrôle, fréquence et obligations réglementaires.',
  'Un entretien régulier garantit les performances et la longévité de votre PAC. Découvrez la check-list complète des points à vérifier chaque année pour maintenir votre installation...',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  true,
  NOW() - INTERVAL '35 days'
);