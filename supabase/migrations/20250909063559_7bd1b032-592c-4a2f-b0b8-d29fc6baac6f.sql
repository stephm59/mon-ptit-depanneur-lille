-- Create the service city page for Chauffagiste Saint-André-lez-Lille
INSERT INTO service_city_pages (
  service_id, 
  city_id, 
  meta_title, 
  meta_description, 
  h1,
  h2_intro,
  intro_description,
  cta_title,
  cta_subtitle,
  zones_text,
  published
) VALUES (
  (SELECT id FROM services WHERE slug = 'chauffagiste'),
  (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'),
  'Chauffagiste Saint-André-lez-Lille (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur',
  'Chauffagiste à Saint-André-lez-Lille : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides centre-ville, Sainte-Hélène, bords de Deûle. Devis gratuit, agréé assurances.',
  'Chauffagiste Saint-André-lez-Lille (installation, dépannage, entretien chaudière)',
  'Chauffagistes de proximité pour le centre, Sainte-Hélène et les bords de Deûle.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur intervient à Saint-André-lez-Lille pour l''entretien, le dépannage et l''installation de chaudières. Nous connaissons les maisons mitoyennes du centre, les résidences de Sainte-Hélène et les habitations proches de la Deûle. Chaudières gaz/fioul, modèles à condensation, équilibrage et désembouage : nous adaptons nos solutions à votre logement, avec délais courts et chantier soigné. Agréés par de nombreuses assurances, nous facilitons vos démarches en cas de sinistre.',
  'Besoin d''un chauffagiste à Saint-André-lez-Lille ?',
  'Intervention rapide, devis gratuit et travaux garantis.',
  'Saint-André-lez-Lille : centre-ville, Sainte-Hélène, secteurs longeant la Deûle, proche gare, limites avec La Madeleine, Lambersart et Marquette-lez-Lille. Interventions rapides grâce à notre organisation par secteurs.',
  true
);

-- Create offers for Saint-André-lez-Lille
INSERT INTO service_city_offers (page_id, title, description, position) VALUES
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')), 'Dépannage chaudière gaz/fioul à Saint-André', 'Diagnostic rapide, mise en sécurité et remise en route si possible.', 1),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')), 'Entretien annuel obligatoire', 'Nettoyage brûleur/corps de chauffe, contrôles sécurité/combustion, attestation remise.', 2),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')), 'Installation chaudière à condensation (compacte et performante)', 'Dimensionnement adapté aux maisons mitoyennes et appartements.', 3),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')), 'Remplacement d''ancienne chaudière', 'Dépose/évacuation de l''ancien appareil, pose conforme, mise en service.', 4),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')), 'Équilibrage & désembouage de circuit', 'Radiateurs homogènes, montée en température plus rapide, conso optimisée.', 5),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')), 'Conseils économies d''énergie', 'Programmation, thermostat, vannes thermostatiques, bonnes pratiques d''hiver.', 6);

-- Create testimonials for Saint-André-lez-Lille
INSERT INTO testimonials (service_id, city_id, author_name, location, content, rating, published) VALUES
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Coralie', 'centre-ville', 'Panne soudaine un lundi matin. Le technicien a sécurisé l''installation et relancé la chaudière. Intervention rapide et rassurante.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Vincent', 'Sainte-Hélène', 'Désembouage + équilibrage : radiateurs enfin réguliers, maison plus confortable et facture en baisse.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Amandine', 'bord de Deûle', 'Remplacement par une chaudière à condensation compacte. Pose propre, conseils clairs pour la programmation.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Jules', 'proche gare', 'Entretien annuel soigné avec attestation. Le chauffagiste a optimisé mon thermostat.', 4, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Nadia', 'secteur canal', 'Urgence un samedi : dépannage provisoire, puis réparation définitive le lundi. Communication nickel.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Thierry', 'limite La Madeleine', 'Devis précis, délais tenus, chantier propre. Je recommande pour le sérieux.', 5, true);