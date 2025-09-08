
BEGIN;

-- Lille
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'lille')
UPDATE service_city_pages p
SET h2_intro = '« Vos urgences plomberie prises en charge partout à Lille. »',
    intro_description = '« Créée par David Vanmarcke il y a 20 ans, Mon p’tit Dépanneur emploie aujourd’hui 12 plombiers expérimentés. Nous intervenons dans tous les quartiers de Lille (Centre, Vieux-Lille, Wazemmes, Fives, Vauban) pour des réparations rapides, l’installation d’équipements et des rénovations soignées. Agréés par de nombreuses compagnies d’assurances, nous facilitons aussi vos démarches en cas de sinistre. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Vieux-Lille
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'vieux-lille')
UPDATE service_city_pages p
SET h2_intro = '« Interventions soignées au cœur du Vieux-Lille. »',
    intro_description = '« Mon p’tit Dépanneur accompagne les habitants du Vieux-Lille depuis plus de 20 ans. Nous intervenons dans les immeubles anciens et les appartements du centre historique, en respectant le charme et les finitions des lieux. Qu’il s’agisse d’une fuite, d’un ballon à remplacer ou d’une salle de bains à rénover, nos artisans travaillent avec soin et sérieux. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Villeneuve-d'Ascq
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq')
UPDATE service_city_pages p
SET h2_intro = '« Plombiers réactifs pour familles et étudiants ascquois. »',
    intro_description = '« Nos équipes interviennent à Villeneuve-d’Ascq dans tous les quartiers : résidences étudiantes à Pont-de-Bois, maisons familiales à Annappes ou Brigode. Nous réalisons dépannages, entretiens et rénovations, toujours avec la même réactivité. Agréés par les assurances, nous vous accompagnons aussi lors de sinistres. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Marcq-en-Barœul
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul')
UPDATE service_city_pages p
SET h2_intro = '« Dépannages rapides au Croisé-Laroche et alentours. »',
    intro_description = '« Basée à Lille, notre société intervient chaque jour à Marcq-en-Barœul : Bourg, Croisé-Laroche, Plouich ou Pont. Fuites, débouchages, ballons d’eau chaude ou rénovations de salles de bains, nos plombiers assurent des interventions fiables et rapides. Nous travaillons en lien direct avec vos assurances pour simplifier vos démarches. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Bondues
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'bondues')
UPDATE service_city_pages p
SET h2_intro = '« Des solutions adaptées aux grandes maisons de Bondues. »',
    intro_description = '« À Bondues, nos plombiers interviennent dans les quartiers résidentiels comme Montjoie ou Ravennes-les-Francs. Nous réalisons la recherche de fuites, le remplacement de ballons, l’installation d’adoucisseurs et la rénovation de salles de bains familiales. Notre agrément avec les assurances facilite aussi vos déclarations de sinistres. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- La Madeleine
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'la-madeleine')
UPDATE service_city_pages p
SET h2_intro = '« Service de proximité pour Madeleinois exigeants. »',
    intro_description = '« Située aux portes de Lille, La Madeleine bénéficie de la proximité de nos équipes. Habitués aux appartements de Saint-Maur, aux maisons du Botanique et aux copropriétés du centre, nous intervenons pour vos urgences comme pour vos projets de rénovation. Entreprise agréée assurances, nous fournissons tous les justificatifs nécessaires en cas de sinistre. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Lambersart
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'lambersart')
UPDATE service_city_pages p
SET h2_intro = '« Votre plomberie entretenue avec soin à Lambersart. »',
    intro_description = '« Mon p’tit Dépanneur intervient à Lambersart depuis plus de 20 ans, du Bourg aux quartiers de Canteleu et Pacot-Vandracq. Nos artisans prennent en charge dépannages, ballons d’eau chaude, adoucisseurs et rénovations de salles de bains. Habitués aux maisons bourgeoises comme aux pavillons récents, nous adaptons nos interventions à chaque besoin. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Saint-André-lez-Lille
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille')
UPDATE service_city_pages p
SET h2_intro = '« Des plombiers disponibles à deux pas de Lille. »',
    intro_description = '« À Saint-André, nos plombiers interviennent aussi bien dans le centre que dans les quartiers proches de la Deûle ou de Sainte-Hélène. Nous réalisons dépannages, installations et rénovations avec la même exigence de qualité. Agréés assurances, nous accompagnons aussi vos démarches après un dégât des eaux. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

-- Lomme
WITH s AS (SELECT id FROM services WHERE slug = 'plombier'),
     c AS (SELECT id FROM cities WHERE slug = 'lomme')
UPDATE service_city_pages p
SET h2_intro = '« Interventions rapides dans tous les quartiers de Lomme. »',
    intro_description = '« Nos plombiers connaissent bien Lomme et ses quartiers : Bourg, Délivrance, Mitterie, Mont-à-Camp. Nous assurons des dépannages express, l’installation de ballons d’eau chaude et la rénovation clé en main de salles de bains. Habitués aux maisons mitoyennes comme aux pavillons familiaux, nous travaillons vite et bien, avec un suivi reconnu par les assurances. »',
    updated_at = now()
FROM s, c
WHERE p.service_id = s.id AND p.city_id = c.id;

COMMIT;
