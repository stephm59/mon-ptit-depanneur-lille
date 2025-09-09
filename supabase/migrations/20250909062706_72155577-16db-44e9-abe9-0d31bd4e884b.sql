-- Create Lambersart city
INSERT INTO cities (name, slug) VALUES ('Lambersart', 'lambersart');

-- Create the service city page for Chauffagiste Lambersart
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
  (SELECT id FROM cities WHERE slug = 'lambersart'),
  'Chauffagiste Lambersart (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur',
  'Chauffagiste à Lambersart : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides à Canteleu, Pacot-Vandracq, Champ-de-Courses et Bourg. Devis gratuit, agréé assurances.',
  'Chauffagiste Lambersart (installation, dépannage, entretien chaudière)',
  'Chauffagistes attentifs aux maisons bourgeoises et pavillons de Lambersart.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur entretient, dépanne et installe des chaudières à Lambersart. Nous intervenons dans les maisons bourgeoises de Canteleu, les pavillons de Pacot-Vandracq, les résidences du Champ-de-Courses et le Bourg. Chaudières gaz/fioul, modèles à condensation, équilibrage et désembouage : nous adaptons nos solutions à l''architecture locale, avec des délais courts et un chantier soigné. Agréés par de nombreuses assurances, nous simplifions vos démarches après sinistre.',
  'Besoin d''un chauffagiste à Lambersart ?',
  'Intervention rapide, devis gratuit et travaux garantis.',
  'Lambersart : Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg, secteurs proches de Saint-André-lez-Lille et Lille (avenue de Dunkerque). Interventions également à La Madeleine et Lompret.',
  true
);

-- Create offers for Lambersart
INSERT INTO service_city_offers (page_id, title, description, position) VALUES
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lambersart')), 'Dépannage chaudière gaz/fioul à Lambersart', 'Diagnostic rapide, mise en sécurité et remise en route lorsque c''est possible.', 1),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lambersart')), 'Entretien annuel obligatoire', 'Nettoyage brûleur/corps de chauffe, contrôles sécurité/combustion, attestation remise.', 2),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lambersart')), 'Installation chaudière à condensation (compacte et performante)', 'Intégration propre en cuisine/cellier, dimensionnement adapté au logement.', 3),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lambersart')), 'Remplacement d''ancienne chaudière', 'Dépose/évacuation, pose conforme, mise en service et conseils de réglage.', 4),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lambersart')), 'Équilibrage & désembouage de circuit', 'Radiateurs homogènes, montée en température plus rapide, conso optimisée.', 5),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') AND city_id = (SELECT id FROM cities WHERE slug = 'lambersart')), 'Conseils économies d''énergie', 'Programmation, thermostat, vannes thermostatiques, bonnes pratiques d''hiver.', 6);