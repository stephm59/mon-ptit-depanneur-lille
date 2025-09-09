-- Insert testimonials for vitrier service - Part 2
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('marcq-en-baroeul', 'bondues', 'la-madeleine')
)
INSERT INTO testimonials (service_id, city_id, author_name, content, rating, location, published)
SELECT 
  sd.service_id,
  sd.city_id,
  testimonial_data.author_name,
  testimonial_data.content,
  5,
  testimonial_data.location,
  true
FROM service_data sd
CROSS JOIN LATERAL (
  VALUES
  -- Marcq-en-Barœul testimonials
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 'Clémence – Croisé-Laroche' ELSE NULL END, 'Double vitrage installé, réduction nette des nuisances sonores.', 'Croisé-Laroche'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 'Jérôme – Bourg' ELSE NULL END, 'Vitrine de commerce remplacée rapidement après effraction.', 'Bourg'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 'Inès – Plouich' ELSE NULL END, 'Miroir sur mesure pour ma salle de bains. Pose soignée.', 'Plouich'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 'Martin – Rouges-Barres' ELSE NULL END, 'Pose de baie vitrée coulissante. Résultat moderne et pratique.', 'Rouges-Barres'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 'Camille – Pont' ELSE NULL END, 'Remplacement vitre cassée sous 24 h. Très pro.', 'Pont'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 'Florence – Hippodrome' ELSE NULL END, 'Vitrier ponctuel, explications claires, finitions parfaites.', 'Hippodrome'),

  -- Bondues testimonials
  (CASE WHEN sd.slug = 'bondues' THEN 'Manon – Montjoie' ELSE NULL END, 'Pose de vitrage sécurité anti-effraction. Installation impeccable.', 'Montjoie'),
  (CASE WHEN sd.slug = 'bondues' THEN 'Guillaume – Ravennes-les-Francs' ELSE NULL END, 'Baie vitrée grand format installée avec soin. Parfait.', 'Ravennes-les-Francs'),
  (CASE WHEN sd.slug = 'bondues' THEN 'Isabelle – Vertu-Couture' ELSE NULL END, 'Miroir décoratif sur mesure, finitions soignées.', 'Vertu-Couture'),
  (CASE WHEN sd.slug = 'bondues' THEN 'Jean – Centre' ELSE NULL END, 'Vitrine commerce remplacée rapidement. Merci à l''équipe.', 'Centre'),
  (CASE WHEN sd.slug = 'bondues' THEN 'Laura – Secteur golf' ELSE NULL END, 'Double vitrage premium installé. Résultat top.', 'Secteur golf'),
  (CASE WHEN sd.slug = 'bondues' THEN 'Mathieu – Campagne' ELSE NULL END, 'Verre feuilleté installé dans dépendance. Très satisfait.', 'Secteur campagne'),

  -- La Madeleine testimonials  
  (CASE WHEN sd.slug = 'la-madeleine' THEN 'Mélanie – Saint-Maur' ELSE NULL END, 'Vitre cassée remplacée dans copropriété. Intervention discrète.', 'Saint-Maur'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 'Damien – Botanique' ELSE NULL END, 'Double vitrage phonique installé. Résultat impeccable.', 'Botanique'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 'Claire – Centre' ELSE NULL END, 'Miroir sur mesure posé. Très beau rendu.', 'Centre'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 'Thomas – Berkem' ELSE NULL END, 'Vitrine commerce changée après effraction. Mise en sécurité efficace.', 'Berkem'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 'Émilie – Romarin' ELSE NULL END, 'Pose baie vitrée coulissante. Chantier rapide et propre.', 'Romarin'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 'Julien – Limite Marcq' ELSE NULL END, 'Installation de verre sécurité en rez-de-chaussée. Très rassurant.', 'Limite Marcq')
) AS testimonial_data(author_name, content, location)
WHERE testimonial_data.author_name IS NOT NULL;