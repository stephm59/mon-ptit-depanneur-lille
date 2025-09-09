-- Insert vitrier service
INSERT INTO services (name, description, slug, published) 
VALUES (
  'Vitrier',
  'Services de vitrerie : remplacement de vitres, double vitrage, miroirs, baies vitrées, vitrage sécurisé',
  'vitrier',
  true
);

-- Insert service city pages for vitrier
WITH service_data AS (
  SELECT id as service_id FROM services WHERE slug = 'vitrier'
),
city_data AS (
  SELECT id, slug FROM cities WHERE slug IN (
    'lille', 'vieux-lille', 'villeneuve-d-ascq', 'marcq-en-baroeul', 
    'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme'
  )
)
INSERT INTO service_city_pages (
  service_id, city_id, published, meta_title, meta_description, h1, h2_intro, 
  intro_description, zones_text, cta_title, published_at
)
SELECT 
  s.service_id,
  c.id,
  true,
  CASE c.slug
    WHEN 'lille' THEN 'Vitrier Lille - Dépannage & Remplacement de Vitres 24h/7j'
    WHEN 'vieux-lille' THEN 'Vitrier Vieux-Lille - Remplacement Vitres & Double Vitrage'
    WHEN 'villeneuve-d-ascq' THEN 'Vitrier Villeneuve-d''Ascq - Vitrerie & Miroiterie'
    WHEN 'marcq-en-baroeul' THEN 'Vitrier Marcq-en-Barœul - Dépannage Vitres & Baies Vitrées'
    WHEN 'bondues' THEN 'Vitrier Bondues - Vitrage Sécurisé & Double Vitrage Premium'
    WHEN 'la-madeleine' THEN 'Vitrier La Madeleine - Remplacement Vitres & Miroirs'
    WHEN 'lambersart' THEN 'Vitrier Lambersart - Baies Vitrées & Vitrage Sécurisé'
    WHEN 'saint-andre-lez-lille' THEN 'Vitrier Saint-André-lez-Lille - Vitrerie & Miroiterie'
    WHEN 'lomme' THEN 'Vitrier Lomme - Dépannage Vitres & Double Vitrage'
  END,
  CASE c.slug
    WHEN 'lille' THEN 'Vitrier à Lille ✓ Dépannage 24h/7j ✓ Remplacement vitres ✓ Double vitrage ✓ Miroirs ✓ Devis gratuit ✓ Intervention rapide'
    WHEN 'vieux-lille' THEN 'Vitrier Vieux-Lille ✓ Respect patrimoine ✓ Vitres anciennes ✓ Double vitrage acoustique ✓ Miroirs décoratifs ✓ Devis gratuit'
    WHEN 'villeneuve-d-ascq' THEN 'Vitrier Villeneuve-d''Ascq ✓ Campus & résidences ✓ Baies vitrées ✓ Double vitrage ✓ Miroiterie ✓ Intervention rapide'
    WHEN 'marcq-en-baroeul' THEN 'Vitrier Marcq-en-Barœul ✓ Vitrines commerce ✓ Baies vitrées ✓ Vitrage sécurisé ✓ Miroirs ✓ Devis gratuit'
    WHEN 'bondues' THEN 'Vitrier Bondues ✓ Vitrage premium ✓ Sécurité renforcée ✓ Baies grand format ✓ Miroiterie haut de gamme ✓ Devis gratuit'
    WHEN 'la-madeleine' THEN 'Vitrier La Madeleine ✓ Copropriétés ✓ Double vitrage acoustique ✓ Vitrines ✓ Miroirs ✓ Intervention rapide'
    WHEN 'lambersart' THEN 'Vitrier Lambersart ✓ Baies vitrées ✓ Double vitrage premium ✓ Vitrage sécurisé ✓ Miroiterie ✓ Devis gratuit'
    WHEN 'saint-andre-lez-lille' THEN 'Vitrier Saint-André-lez-Lille ✓ Vitrerie ✓ Double vitrage ✓ Vitrines ✓ Miroiterie ✓ Intervention rapide'
    WHEN 'lomme' THEN 'Vitrier Lomme ✓ Double vitrage phonique ✓ Baies vitrées ✓ Vitrage sécurisé ✓ Miroiterie ✓ Devis gratuit'
  END,
  CASE c.slug
    WHEN 'lille' THEN 'Vitrier à Lille : dépannage et remplacement de vitres'
    WHEN 'vieux-lille' THEN 'Vitrier au Vieux-Lille : expertise patrimoine et vitres anciennes'
    WHEN 'villeneuve-d-ascq' THEN 'Vitrier à Villeneuve-d''Ascq : campus, résidences et pavillons'
    WHEN 'marcq-en-baroeul' THEN 'Vitrier à Marcq-en-Barœul : vitrines et baies vitrées'
    WHEN 'bondues' THEN 'Vitrier à Bondues : vitrage premium et sécurisé'
    WHEN 'la-madeleine' THEN 'Vitrier à La Madeleine : copropriétés et commerce'
    WHEN 'lambersart' THEN 'Vitrier à Lambersart : baies vitrées et vitrage sécurisé'
    WHEN 'saint-andre-lez-lille' THEN 'Vitrier à Saint-André-lez-Lille : vitrerie complète'
    WHEN 'lomme' THEN 'Vitrier à Lomme : double vitrage et miroiterie'
  END,
  'Nos services de vitrerie',
  CASE c.slug
    WHEN 'lille' THEN 'Intervention rapide pour tous vos besoins de vitrerie à Lille : remplacement de vitres cassées, pose de double vitrage, installation de baies vitrées, miroirs sur mesure et vitrage sécurisé. Service 24h/7j avec mise en sécurité immédiate.'
    WHEN 'vieux-lille' THEN 'Spécialistes de la vitrerie dans le Vieux-Lille avec respect du patrimoine architectural. Remplacement discret de vitres anciennes, double vitrage acoustique et miroirs décoratifs adaptés au style patrimonial.'
    WHEN 'villeneuve-d-ascq' THEN 'Service de vitrerie adapté aux résidences étudiantes, campus et pavillons de Villeneuve-d''Ascq. Dépannage rapide, baies vitrées, double vitrage et miroiterie sur mesure pour tous types d''habitats.'
    WHEN 'marcq-en-baroeul' THEN 'Vitrier professionnel à Marcq-en-Barœul pour particuliers et commerces. Installation de vitrines sécurisées, baies vitrées sur mesure, double vitrage et vitrage anti-effraction avec finitions soignées.'
    WHEN 'bondues' THEN 'Service de vitrerie haut de gamme à Bondues : vitrage premium, sécurité renforcée, baies vitrées grand format et miroiterie décorative. Interventions discrètes adaptées aux propriétés de prestige.'
    WHEN 'la-madeleine' THEN 'Vitrier spécialisé copropriétés et commerces à La Madeleine. Double vitrage acoustique, vitrines sécurisées, miroirs sur mesure et coordination avec syndics pour interventions en parties communes.'
    WHEN 'lambersart' THEN 'Service complet de vitrerie à Lambersart : baies vitrées sur mesure, double vitrage premium, vitrage sécurisé et miroiterie décorative. Interventions soignées adaptées aux maisons bourgeoises.'
    WHEN 'saint-andre-lez-lille' THEN 'Vitrier professionnel à Saint-André-lez-Lille pour tous travaux de vitrerie : remplacement de vitres, double vitrage isolant, vitrines commerce et miroiterie décorative avec finitions de qualité.'
    WHEN 'lomme' THEN 'Service de vitrerie complet à Lomme : double vitrage phonique, baies vitrées, vitrage sécurisé et miroiterie sur mesure. Interventions rapides avec mise en sécurité immédiate en cas d''effraction.'
  END,
  CASE c.slug
    WHEN 'lille' THEN 'Secteurs d''intervention : Vieux-Lille, Wazemmes, Vauban-Esquermes, Bois-Blancs, Fives, Saint-Maurice-Pellevoisin, Hellemmes, République, Liberté et tous quartiers lillois.'
    WHEN 'vieux-lille' THEN 'Zones couvertes : rue de Gand, rue Basse, rue Esquermoise, rue Royale, place du Concert, rue Saint-Sébastien et tout le secteur sauvegardé du Vieux-Lille.'
    WHEN 'villeneuve-d-ascq' THEN 'Secteurs couverts : Annappes, Brigode, Flers-Bourg, Triolo, Hôtel de Ville, campus Pont-de-Bois, résidences étudiantes et zones pavillonnaires.'
    WHEN 'marcq-en-baroeul' THEN 'Zones d''intervention : Croisé-Laroche, Bourg, Plouich, Hippodrome, Pont, Rouges-Barres et tous quartiers de Marcq-en-Barœul.'
    WHEN 'bondues' THEN 'Secteurs couverts : Montjoie, Ravennes-les-Francs, Vertu-Couture, centre-ville, secteur golf, campagne et toutes propriétés de Bondues.'
    WHEN 'la-madeleine' THEN 'Zones d''intervention : Saint-Maur, Botanique, Berkem, Romarin, centre-ville et toutes copropriétés de La Madeleine.'
    WHEN 'lambersart' THEN 'Secteurs couverts : Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg, avenue de Dunkerque et tous quartiers de Lambersart.'
    WHEN 'saint-andre-lez-lille' THEN 'Zones d''intervention : centre-ville, Sainte-Hélène, bords de Deûle, proche gare, secteur canal et tous quartiers de Saint-André-lez-Lille.'
    WHEN 'lomme' THEN 'Secteurs couverts : Délivrance, Bourg, Mitterie, Mont-à-Camp, Lomme-Campus et tous quartiers de Lomme.'
  END,
  CASE c.slug
    WHEN 'lille' THEN 'Vitrier d''urgence à Lille'
    WHEN 'vieux-lille' THEN 'Vitrier patrimoine Vieux-Lille'
    WHEN 'villeneuve-d-ascq' THEN 'Vitrier campus Villeneuve-d''Ascq'
    WHEN 'marcq-en-baroeul' THEN 'Vitrier commerce Marcq-en-Barœul'
    WHEN 'bondues' THEN 'Vitrier premium Bondues'
    WHEN 'la-madeleine' THEN 'Vitrier copropriété La Madeleine'
    WHEN 'lambersart' THEN 'Vitrier Lambersart'
    WHEN 'saint-andre-lez-lille' THEN 'Vitrier Saint-André-lez-Lille'
    WHEN 'lomme' THEN 'Vitrier Lomme'
  END,
  now()
FROM service_data s
CROSS JOIN city_data c;