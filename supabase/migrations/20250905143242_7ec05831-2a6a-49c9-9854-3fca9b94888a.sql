-- Import services
INSERT INTO services (slug, name, description, published) VALUES 
('plombier', 'Plombier', 'Dépannage, installation et rénovation plomberie (fuites, débouchage, ballon d''eau chaude, adoucisseur, salle de bains).', true)
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  published = EXCLUDED.published,
  updated_at = now();

-- Import cities
INSERT INTO cities (slug, name, department, region, published) VALUES 
('lille', 'Lille', '59', 'Hauts-de-France', true),
('vieux-lille', 'Vieux-Lille', '59', 'Hauts-de-France', true),
('villeneuve-d-ascq', 'Villeneuve-d''Ascq', '59', 'Hauts-de-France', true),
('marcq-en-baroeul', 'Marcq-en-Barœul', '59', 'Hauts-de-France', true),
('bondues', 'Bondues', '59', 'Hauts-de-France', true),
('la-madeleine', 'La Madeleine', '59', 'Hauts-de-France', true),
('lambersart', 'Lambersart', '59', 'Hauts-de-France', true),
('saint-andre-lez-lille', 'Saint-André-lez-Lille', '59', 'Hauts-de-France', true),
('lomme', 'Lomme', '59', 'Hauts-de-France', true)
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  department = EXCLUDED.department,
  region = EXCLUDED.region,
  published = EXCLUDED.published,
  updated_at = now();

-- Import service_city_pages with proper foreign key mapping
INSERT INTO service_city_pages (service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description, cta_title, cta_subtitle, zones_text)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  pages.meta_title,
  pages.meta_description,
  pages.h1,
  pages.h2_intro,
  pages.intro_description,
  pages.cta_title,
  pages.cta_subtitle,
  pages.zones_text
FROM (VALUES 
  ('plombier', 'lille', 'Plombier à Lille (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Lille : réparation fuite d''eau, débouchage canalisation, remplacement ballon d''eau chaude, rénovation salle de bains. Intervention rapide, devis clair, agréé assurances.', 'Plombier à Lille (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Lille !', 'Créée par David Vanmarcke il y a 20 ans, la société Mon p''tit Dépanneur emploie aujourd''hui 12 personnes et intervient en chauffage, serrurerie, plomberie et vitrerie. Basée à Lille, Mon p''tit Dépanneur est agréée par une vingtaine d''assurances (Macif, Maaf, Gan, Groupama…). Les équipes se déplacent chez vous, sur simple demande ou sur rendez-vous.', 'Besoin d''un plombier à Lille ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Nous intervenons dans tous les quartiers de Lille : Vieux-Lille, Centre-Ville, Wazemmes, Vauban-Esquermes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Moulins, Hellemmes… ainsi que dans les communes voisines : La Madeleine, Lambersart, Mons-en-Barœul, Saint-André-lez-Lille, Villeneuve-d''Ascq, Marcq-en-Barœul, Lomme, Loos.'),
  ('plombier', 'vieux-lille', 'Plombier Vieux-Lille (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier Vieux-Lille : fuites, débouchage, ballon d''eau chaude, rénovation salle de bains. Devis clair, intervention soignée dans le centre historique.', 'Plombier Vieux-Lille (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout dans le Vieux-Lille !', 'Créée il y a 20 ans, Mon p''tit Dépanneur intervient dans tout le Vieux-Lille et ses alentours (centre, îlot Comtesse, Esplanade). Entreprise agréée assurances, interventions propres dans les intérieurs soignés du quartier historique.', 'Besoin d''un plombier dans le Vieux-Lille ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Couverture : Vieux-Lille et centre de Lille, Esplanade, citadelle, secteurs proches (Centre-Ville, Vauban-Esquermes, La Madeleine).'),
  ('plombier', 'villeneuve-d-ascq', 'Plombier Villeneuve-d''Ascq (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Villeneuve-d''Ascq : fuites, débouchage, ballon d''eau chaude, adoucisseur, salle de bains. Devis clair, intervention rapide.', 'Plombier Villeneuve-d''Ascq (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Villeneuve-d''Ascq !', 'Mon p''tit Dépanneur intervient à Villeneuve-d''Ascq (Hôtel-de-Ville, Triolo, Pont-de-Bois, Annappes, Ascq) et zones pavillonnaires/étudiantes. Entreprise agréée assurances, planning réactif pour urgences et chantiers programmés.', 'Besoin d''un plombier à Villeneuve-d''Ascq ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Quartiers couverts : Hôtel-de-Ville, Triolo, Pont-de-Bois, Annappes, Ascq… Communes voisines : Mons-en-Barœul, Hellemmes, Wasquehal, Croix, Lezennes, Lille.'),
  ('plombier', 'marcq-en-baroeul', 'Plombier Marcq-en-Barœul (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Marcq-en-Barœul : fuites, débouchage, ballon d''eau chaude, rénovation salle de bains. Intervention rapide, devis clair, agréé assurances.', 'Plombier Marcq-en-Barœul (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Marcq-en-Barœul !', 'Mon p''tit Dépanneur intervient à Marcq (Bourg, Croisé-Laroche, Plouich, Pont, Rouges-Barres) avec des interventions propres et soignées. Entreprise agréée assurances, délais courts sur RDV ou urgence.', 'Besoin d''un plombier à Marcq-en-Barœul ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Quartiers : Bourg, Croisé-Laroche, Plouich, Pont, Rouges-Barres… Voisins : Wasquehal, La Madeleine, Lille, Mons-en-Barœul, Marquette-lez-Lille.'),
  ('plombier', 'bondues', 'Plombier Bondues (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Bondues : fuites, débouchage, ballon d''eau chaude, adoucisseur. Devis clair, interventions soignées.', 'Plombier Bondues (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Bondues !', 'Interventions sur tout Bondues (centres et zones résidentielles). Entreprise agréée assurances, service adapté aux maisons familiales.', 'Besoin d''un plombier à Bondues ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Couverture : Bondues et secteurs proches (Mouvaux, Marcq-en-Barœul, Roncq, Wambrechies).'),
  ('plombier', 'la-madeleine', 'Plombier La Madeleine (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à La Madeleine : fuites, débouchage, ballon, salle de bains. Devis clair, proximité Lille.', 'Plombier La Madeleine (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à La Madeleine !', 'Mon p''tit Dépanneur intervient dans les immeubles et maisons madeleinoises (Saint-Maur, Botanique, centre). Entreprise agréée assurances.', 'Besoin d''un plombier à La Madeleine ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Quartiers : Saint-Maur, Botanique, centre… Voisins : Lille, Marcq-en-Barœul, Saint-André-lez-Lille.'),
  ('plombier', 'lambersart', 'Plombier Lambersart (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Lambersart : fuites, débouchage, ballon d''eau chaude, adoucisseur. Devis clair, interventions propres.', 'Plombier Lambersart (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Lambersart !', 'Interventions à Lambersart (Canteleu, Le Pacot-Vandracq, Bourg). Entreprise agréée assurances.', 'Besoin d''un plombier à Lambersart ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Quartiers : Canteleu, Le Pacot-Vandracq, Bourg… Voisins : Lille, Saint-André-lez-Lille, Lomme, Lompret.'),
  ('plombier', 'saint-andre-lez-lille', 'Plombier Saint-André-lez-Lille (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Saint-André-lez-Lille : fuites, débouchage, ballon, rénovation. Devis clair, proximité Lille.', 'Plombier Saint-André-lez-Lille (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Saint-André !', 'Mon p''tit Dépanneur intervient à Saint-André et secteurs limitrophes. Entreprise agréée assurances.', 'Besoin d''un plombier à Saint-André-lez-Lille ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Couverture : Saint-André-lez-Lille et abords. Voisins : La Madeleine, Lambersart, Marquette-lez-Lille, Lille.'),
  ('plombier', 'lomme', 'Plombier Lomme (réparation fuite d''eau, dépannage, installation) | Mon p''tit Dépanneur', 'Plombier à Lomme : fuites, débouchage, ballon, salle de bains. Devis clair, intervention rapide.', 'Plombier Lomme (réparation fuite d''eau, dépannage, installation)', 'Dépannage, réparation, installation. On s''occupe de tout à Lomme !', 'Interventions à Lomme (Bourg, Délivrance, zones pavillonnaires). Entreprise agréée assurances.', 'Besoin d''un plombier à Lomme ?', 'Intervention rapide, devis gratuit et travaux garantis', 'Quartiers : Bourg, Délivrance… Voisins : Lille, Lambersart, Loos, Capinghem.')
) AS pages(service_slug, city_slug, meta_title, meta_description, h1, h2_intro, intro_description, cta_title, cta_subtitle, zones_text)
JOIN services s ON s.slug = pages.service_slug
JOIN cities c ON c.slug = pages.city_slug
ON CONFLICT (service_id, city_id) DO UPDATE SET 
  published = EXCLUDED.published,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description,
  h1 = EXCLUDED.h1,
  h2_intro = EXCLUDED.h2_intro,
  intro_description = EXCLUDED.intro_description,
  cta_title = EXCLUDED.cta_title,
  cta_subtitle = EXCLUDED.cta_subtitle,
  zones_text = EXCLUDED.zones_text,
  updated_at = now();