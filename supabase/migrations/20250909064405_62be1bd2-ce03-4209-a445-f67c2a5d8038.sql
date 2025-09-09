-- Create Lomme city
INSERT INTO cities (name, slug) VALUES ('Lomme', 'lomme');

-- Create the service city page for Chauffagiste Lomme
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
  (SELECT id FROM cities WHERE slug = 'lomme'),
  'Chauffagiste Lomme (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur',
  'Chauffagiste à Lomme : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides à Délivrance, Bourg, Mitterie, Mont-à-Camp. Devis gratuit, agréé assurances.',
  'Chauffagiste Lomme (installation, dépannage, entretien chaudière)',
  'Chauffagistes pour pavillons et maisons mitoyennes de Lomme.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur entretient, dépanne et installe des chaudières à Lomme. Nous connaissons les pavillons de la Délivrance, les maisons du Bourg, les quartiers Mitterie et Mont-à-Camp. Chaudières gaz/fioul, modèles à condensation, équilibrage et désembouage : nous adaptons nos solutions à votre logement, avec des délais courts et un chantier soigné. Agréés par de nombreuses assurances, nous simplifions vos démarches en cas de sinistre.',
  'Besoin d''un chauffagiste à Lomme ?',
  'Intervention rapide, devis gratuit et travaux garantis.',
  'Lomme : Délivrance, Bourg, Mitterie, Mont-à-Camp, proximité Loos, Lambersart et Lille. Interventions rapides grâce à notre organisation par secteurs.',
  true
);

-- Create offers for Lomme
INSERT INTO service_city_offers (page_id, title, description, position) VALUES
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lomme')), 'Dépannage chaudière gaz/fioul à Lomme', 'Diagnostic rapide, mise en sécurité et remise en route si possible.', 1),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lomme')), 'Entretien annuel obligatoire', 'Nettoyage brûleur/corps de chauffe, contrôles sécurité/combustion, attestation remise.', 2),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lomme')), 'Installation chaudière à condensation (compacte et performante)', 'Intégration propre en cuisine/cellier, dimensionnement adapté au logement.', 3),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lomme')), 'Remplacement d''ancienne chaudière', 'Dépose/évacuation, pose conforme, mise en service et conseils de réglage.', 4),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lomme')), 'Équilibrage & désembouage de circuit', 'Radiateurs homogènes, montée en température plus rapide, conso optimisée.', 5),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lomme')), 'Conseils économies d''énergie', 'Programmation, thermostat, vannes thermostatiques, bonnes pratiques d''hiver.', 6);