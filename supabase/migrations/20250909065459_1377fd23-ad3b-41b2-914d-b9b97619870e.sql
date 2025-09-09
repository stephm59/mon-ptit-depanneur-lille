-- Create the heat pump service
INSERT INTO services (name, slug, description) VALUES 
('Pompe à chaleur', 'pompe-a-chaleur', 'Installation, entretien et dépannage de pompes à chaleur air/eau et air/air');

-- Create the service city page for Pompe à chaleur Lille
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
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'lille'),
  'Pompe à chaleur Lille (installation, entretien, dépannage) | Mon p''tit Dépanneur',
  'Installateur de pompes à chaleur à Lille : étude, dimensionnement, pose, mise en service, entretien et dépannage. PAC air/eau et air/air. Aide aux dossiers MaPrimeRénov'' & CEE.',
  'Pompe à chaleur Lille (installation, entretien, dépannage)',
  'Des pompes à chaleur adaptées au climat lillois, posées clés en main.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur accompagne les Lillois dans la transition énergétique : étude thermique, dimensionnement, installation et entretien de pompes à chaleur air/eau (chauffage + ECS) et air/air (chauffage seul). Nous connaissons les contraintes des logements du Vieux-Lille, de Wazemmes, Vauban, Fives ou Hellemmes : volumes variés, copropriétés, cours intérieures, bruit réglementé. Nos équipes gèrent la pose, la mise en service, l''optimisation hydraulique et l''aide administrative pour vos aides financières (accompagnement au dossier).',
  'Besoin d''un installateur de pompe à chaleur à Lille ?',
  'Étude gratuite, installation soignée et entretien garanti.',
  'Lille : Centre, Vieux-Lille, Wazemmes, Vauban-Esquermes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Moulins, Hellemmes, et communes proches : La Madeleine, Lambersart, Marcq-en-Barœul, Saint-André-lez-Lille, Villeneuve-d''Ascq, Lomme, Loos.',
  true
);

-- Create offers for Pompe à chaleur Lille
INSERT INTO service_city_offers (page_id, title, description, position) VALUES
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'lille')), 'Étude & dimensionnement PAC à Lille', 'Bilan des déperditions, choix du type (air/eau, air/air), puissance et loi d''eau adaptées au bâti lillois.', 1),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'lille')), 'Installation PAC air/eau + ballon ECS', 'Pose, raccordements hydrauliques, régulation, mise en service et paramétrage hiver/mi-saison.', 2),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'lille')), 'Remplacement chaudière par PAC', 'Conversion gaz → PAC, vérification radiateurs/plan cher, vanne 3 voies, éventuel système bivalent (PAC + appoint).', 3),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'lille')), 'Optimisation circuit (équilibrage & désembouage)', 'Débits rééquilibrés, eau propre, rendement et confort accrus à basse température.', 4),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'lille')), 'Entretien & dépannage', 'Contrat annuel, contrôle étanchéité, courbe de chauffe, diagnostic bruit/givre, pièces et fluides.', 5),
  ((SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'lille')), 'Aides & conformité', 'Accompagnement MaPrimeRénov''/CEE (éligibilité, devis détaillé, attestations), dossier copropriété et contraintes acoustiques locales.', 6);