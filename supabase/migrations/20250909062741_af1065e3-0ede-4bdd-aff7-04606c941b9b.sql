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

-- Create testimonials for Lambersart
INSERT INTO testimonials (service_id, city_id, author_name, location, content, rating, published) VALUES
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Aurélie', 'Canteleu', 'Panne totale un soir de froid. Le technicien est arrivé vite, a sécurisé l''installation et relancé la chaudière. Très pro.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Bastien', 'Pacot-Vandracq', 'Désembouage + équilibrage : radiateurs enfin réguliers, maison plus confortable et facture en baisse.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Léa', 'Champ-de-Courses', 'Remplacement par une chaudière à condensation compacte. Pose propre, explications claires sur la programmation.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Samuel', 'Bourg', 'Entretien annuel sérieux, attestation fournie et réglages du thermostat optimisés.', 4, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Nora', 'limite Saint-André', 'Intervention un samedi pour fuite sur le circuit. Dépannage provisoire puis réparation définitive le lundi.', 5, true),
  ((SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Cyril', 'secteur avenue de Dunkerque', 'Devis précis, délais respectés, chantier nickel. Je recommande pour le sérieux et la réactivité.', 5, true);