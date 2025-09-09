-- Create renovation-salle-de-bain service and add all related data
-- First, create the service
INSERT INTO services (name, slug, description, published)
VALUES ('Rénovation salle de bain', 'renovation-salle-de-bain', 'Rénovation complète de salles de bains, douche italienne, baignoire, carrelage', true)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  published = EXCLUDED.published;

-- Insert service-city pages
INSERT INTO service_city_pages (service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description, zones_text, cta_title, cta_subtitle, published_at)
VALUES
  -- Lille
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    true,
    'Rénovation salle de bain Lille | Douche italienne, baignoire, carrelage',
    'Travaux de rénovation de salle de bains à Lille : conception, douche à l''italienne, baignoire, mobilier sur mesure, carrelage, accessibilité PMR, entretien.',
    'Rénovation salle de bain Lille',
    'Modernisez votre salle de bain à Lille, du sol au plafond.',
    'Étude personnalisée, choix des matériaux, pose soignée : nos artisans plombiers, carreleurs et électriciens transforment votre salle de bains en espace pratique et esthétique. Nous gérons tout : douche italienne, baignoire, carrelage, éclairage, ventilation et normes PMR.',
    'Lille : Vieux-Lille, Centre, Vauban-Esquermes, Wazemmes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Hellemmes, Lomme. Villes voisines : La Madeleine, Lambersart, Mons-en-Barœul, Loos.',
    'Besoin d''une nouvelle salle de bains à Lille ?',
    'Devis gratuit, conception sur mesure et suivi complet du chantier.',
    '2025-09-09T09:00:00Z'
  ),
  -- Vieux-Lille
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'vieux-lille'),
    true,
    'Rénovation salle de bain Vieux-Lille | Pose haut de gamme & finitions soignées',
    'Rénovation de salle de bains au Vieux-Lille : douche italienne compacte, meubles design, carrelage soigné, solutions adaptées aux appartements anciens.',
    'Rénovation salle de bain Vieux-Lille',
    'Un projet adapté aux appartements du Vieux-Lille.',
    'Intégration discrète dans les bâtis anciens : douches compactes, baignoires asymétriques, carrelages modernes mais respectueux du cachet historique. Pose avec percements maîtrisés et gestion des évacuations complexes.',
    'Vieux-Lille : rue Esquermoise, rue Royale, place du Concert, rue Basse, rue de Gand. Interventions également dans les immeubles anciens du secteur.',
    'Envie d''une salle de bains sur mesure au Vieux-Lille ?',
    'Conception design, intégration respectueuse du bâti.',
    '2025-09-09T09:00:00Z'
  ),
  -- Villeneuve-d'Ascq
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'),
    true,
    'Rénovation salle de bain Villeneuve-d''Ascq | Appartements & maisons',
    'Travaux de rénovation de salle de bains à Villeneuve-d''Ascq : douches modernes, baignoires, carrelage, meubles sur mesure, solutions étudiantes et familiales.',
    'Rénovation salle de bain Villeneuve-d''Ascq',
    'Des solutions pour familles et étudiants ascquois.',
    'Salles de bains clé en main dans les quartiers Annappes, Flers-Bourg, Triolo, Brigode. Optimisation des espaces dans les appartements étudiants, solutions confort pour maisons familiales.',
    'Villeneuve-d''Ascq : Annappes, Brigode, Flers-Bourg, Triolo, Hôtel de Ville. Voisines : Wasquehal, Lezennes, Hellemmes.',
    'Besoin d''une salle de bains pratique et moderne ?',
    'Plan 3D, devis gratuit et finitions de qualité.',
    '2025-09-09T09:00:00Z'
  ),
  -- Marcq-en-Barœul
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'),
    true,
    'Rénovation salle de bain Marcq-en-Barœul | Douche italienne & design',
    'Salle de bains sur mesure à Marcq : douche italienne, baignoire, carrelage premium, mobilier suspendu, respect du style local.',
    'Rénovation salle de bain Marcq-en-Barœul',
    'Salles de bains modernes au Croisé-Laroche et alentours.',
    'Interventions à Croisé-Laroche, Bourg, Plouich : douches italiennes spacieuses, baignoires balnéo, carrelages design. Intégration discrète dans maisons bourgeoises ou appartements.',
    'Marcq-en-Barœul : Croisé-Laroche, Bourg, Plouich, Pont, Rouges-Barres, Hippodrome. Proches : Wasquehal, La Madeleine, Lille.',
    'Votre projet salle de bains à Marcq ?',
    'Devis gratuit, conception design et finitions haut de gamme.',
    '2025-09-09T09:00:00Z'
  ),
  -- Bondues
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'bondues'),
    true,
    'Rénovation salle de bain Bondues | Maisons & villas',
    'Rénovation haut de gamme à Bondues : grandes salles de bains, baignoires îlot, douches italiennes, carrelage et mobilier premium.',
    'Rénovation salle de bain Bondues',
    'Confort haut de gamme pour les maisons bonduoises.',
    'Étude complète pour villas et maisons spacieuses. Intégration de douches à l''italienne grand format, baignoires balnéo ou îlot, carrelages premium et mobilier sur mesure.',
    'Bondues : Montjoie, Ravennes-les-Francs, Vertu-Couture, secteurs proches du golf. Villes voisines : Mouvaux, Wambrechies.',
    'Une salle de bains élégante à Bondues ?',
    'Étude personnalisée et matériaux premium.',
    '2025-09-09T09:00:00Z'
  ),
  -- La Madeleine
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'la-madeleine'),
    true,
    'Rénovation salle de bain La Madeleine | Copropriétés & maisons',
    'Salle de bains moderne à La Madeleine : solutions compactes pour copropriétés (Saint-Maur, Botanique), douches italiennes, carrelages élégants, meubles sur mesure.',
    'Rénovation salle de bain La Madeleine',
    'Modernisation adaptée aux appartements madeleinois.',
    'Douches italiennes gain de place, baignoires compactes, optimisation des évacuations dans les copropriétés Saint-Maur et Botanique. Solutions esthétiques pour maisons individuelles.',
    'La Madeleine : Saint-Maur, Botanique, centre, Berkem, Romarin. Proche Euralille, Marcq, Saint-André.',
    'Besoin d''une salle de bains moderne à La Madeleine ?',
    'Respect des contraintes copro, pose soignée.',
    '2025-09-09T09:00:00Z'
  ),
  -- Lambersart
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'lambersart'),
    true,
    'Rénovation salle de bain Lambersart | Maisons bourgeoises & pavillons',
    'Salle de bains sur mesure à Lambersart : douche italienne, baignoire design, carrelage élégant, optimisation des espaces.',
    'Rénovation salle de bain Lambersart',
    'Rénovation élégante et respect du bâti ancien.',
    'Intégration dans maisons bourgeoises (Canteleu, Champ-de-Courses) et pavillons. Pose soignée, respect des boiseries, matériaux premium.',
    'Lambersart : Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg. Proches : Saint-André, La Madeleine, Lille.',
    'Votre salle de bains à Lambersart ?',
    'Conception haut de gamme et finitions soignées.',
    '2025-09-09T09:00:00Z'
  ),
  -- Saint-André-lez-Lille
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'),
    true,
    'Rénovation salle de bain Saint-André-lez-Lille | Appartements & maisons mitoyennes',
    'Salle de bains clé en main à Saint-André : douche italienne, carrelage, baignoire compacte, solutions adaptées aux maisons mitoyennes.',
    'Rénovation salle de bain Saint-André-lez-Lille',
    'Un confort moderne au cœur de Saint-André.',
    'Travaux adaptés aux maisons mitoyennes et appartements en copropriété. Pose discrète, optimisation de l''espace et choix de matériaux adaptés.',
    'Saint-André-lez-Lille : centre, Sainte-Hélène, bords de Deûle, proche gare. Limites : Lambersart, La Madeleine.',
    'Besoin d''une salle de bains à Saint-André ?',
    'Optimisation des espaces, finitions modernes.',
    '2025-09-09T09:00:00Z'
  ),
  -- Lomme
  (
    (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'),
    (SELECT id FROM cities WHERE slug = 'lomme'),
    true,
    'Rénovation salle de bain Lomme | Pavillons & appartements',
    'Salle de bains moderne à Lomme : douche italienne, baignoire, carrelage, mobilier pratique et esthétique.',
    'Rénovation salle de bain Lomme',
    'Des salles de bains pratiques et modernes pour Lomme.',
    'Travaux dans tous les quartiers : Délivrance, Bourg, Mitterie, Mont-à-Camp, Lomme-Campus. Optimisation des petites salles de bains, solutions confort pour familles.',
    'Lomme : Délivrance, Bourg, Mitterie, Mont-à-Camp, Lomme-Campus. Voisines : Loos, Lambersart, Lille.',
    'Votre salle de bains à Lomme ?',
    'Travaux rapides, devis détaillé et finitions durables.',
    '2025-09-09T09:00:00Z'
  )
ON CONFLICT (service_id, city_id) DO UPDATE SET
  published = EXCLUDED.published,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description,
  h1 = EXCLUDED.h1,
  h2_intro = EXCLUDED.h2_intro,
  intro_description = EXCLUDED.intro_description,
  zones_text = EXCLUDED.zones_text,
  cta_title = EXCLUDED.cta_title,
  cta_subtitle = EXCLUDED.cta_subtitle,
  published_at = EXCLUDED.published_at;