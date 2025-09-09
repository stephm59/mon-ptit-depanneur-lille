-- Create La Madeleine city
INSERT INTO cities (name, slug) VALUES ('La Madeleine', 'la-madeleine');

-- Create the service city page for Chauffagiste La Madeleine
INSERT INTO service_city_pages (
  service_id, 
  city_id, 
  meta_title, 
  meta_description, 
  h1_title,
  h2_intro,
  intro_description,
  cta_title,
  cta_subtitle,
  zones_description,
  published
) VALUES (
  (SELECT id FROM services WHERE slug = 'chauffagiste'),
  (SELECT id FROM cities WHERE slug = 'la-madeleine'),
  'Chauffagiste La Madeleine (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur',
  'Chauffagiste à La Madeleine : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides à Saint-Maur, Botanique, Berkem. Devis gratuit, agréé assurances.',
  'Chauffagiste La Madeleine (installation, dépannage, entretien chaudière)',
  'Chauffagistes de proximité pour Saint-Maur, Botanique et tout La Madeleine.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur entretient, dépanne et installe des chaudières à La Madeleine. Nos équipes interviennent dans les copropriétés de Saint-Maur, les maisons du Botanique, et les immeubles du centre et de Berkem. Chaudières gaz/fioul, modèles à condensation, désembouage et équilibrage : nous adaptons nos solutions à chaque logement avec délais courts et finitions soignées. Agréés par de nombreuses assurances, nous simplifions vos démarches en cas de sinistre.',
  'Besoin d''un chauffagiste à La Madeleine ?',
  'Intervention rapide, devis gratuit et travaux garantis.',
  'La Madeleine : Saint-Maur, Botanique, centre-ville, Berkem, secteurs proches de Marcq-en-Barœul et Saint-André-lez-Lille. Interventions également sur Lille (proximité Euralille/Lille-Europe).',
  true
);

-- Create offers for La Madeleine
INSERT INTO service_city_offers (page_id, title, description, position) VALUES
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'la-madeleine')), 'Dépannage chaudière gaz/fioul à La Madeleine', 'Diagnostic rapide, mise en sécurité et remise en route si possible.', 1),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'la-madeleine')), 'Entretien annuel obligatoire', 'Nettoyage brûleur/corps de chauffe, contrôles combustion/sécurité, attestation fournie.', 2),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'la-madeleine')), 'Installation chaudière à condensation (compacte)', 'Intégration propre en cuisine/cellier, modèles performants et silencieux.', 3),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'la-madeleine')), 'Remplacement d''ancienne chaudière', 'Dimensionnement, pose conforme, évacuation de l''ancien appareil.', 4),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'la-madeleine')), 'Équilibrage & désembouage de circuit', 'Radiateurs homogènes en copropriété comme en maison.', 5),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'la-madeleine')), 'Conseils économies d''énergie', 'Programmation, thermostats, vannes thermostatiques, bonnes pratiques hiver.', 6);