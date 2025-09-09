-- Insert testimonials for vitrier service - Part 3 (final)
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('lambersart', 'saint-andre-lez-lille', 'lomme')
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
  -- Lambersart testimonials
  (CASE WHEN sd.slug = 'lambersart' THEN 'Sophie – Canteleu' ELSE NULL END, 'Baie vitrée installée avec soin. Très belle finition.', 'Canteleu'),
  (CASE WHEN sd.slug = 'lambersart' THEN 'Olivier – Pacot-Vandracq' ELSE NULL END, 'Pose double vitrage premium. Confort thermique retrouvé.', 'Pacot-Vandracq'),
  (CASE WHEN sd.slug = 'lambersart' THEN 'Hélène – Champ-de-Courses' ELSE NULL END, 'Vitre cassée remplacée rapidement. Merci pour la réactivité.', 'Champ-de-Courses'),
  (CASE WHEN sd.slug = 'lambersart' THEN 'Nicolas – Bourg' ELSE NULL END, 'Miroir décoratif installé. Pose impeccable.', 'Bourg'),
  (CASE WHEN sd.slug = 'lambersart' THEN 'Amélie – Avenue de Dunkerque' ELSE NULL END, 'Verre sécurité posé en rez-de-chaussée. Très rassurant.', 'Avenue de Dunkerque'),
  (CASE WHEN sd.slug = 'lambersart' THEN 'Clara – Limite Saint-André' ELSE NULL END, 'Intervention après effraction, mise en sécurité immédiate.', 'Limite Saint-André'),

  -- Saint-André-lez-Lille testimonials
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 'Lucas – Centre' ELSE NULL END, 'Vitre remplacée après bris de glace. Délais respectés.', 'Centre'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 'Chloé – Sainte-Hélène' ELSE NULL END, 'Double vitrage phonique installé. Très efficace.', 'Sainte-Hélène'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 'Marc – Bords de Deûle' ELSE NULL END, 'Vitrine de commerce posée rapidement. Pose soignée.', 'Bords de Deûle'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 'Nadia – Proche gare' ELSE NULL END, 'Miroir sur mesure livré et posé. Parfait.', 'Proche gare'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 'Adrien – Secteur canal' ELSE NULL END, 'Verre sécurité feuilleté installé. Travail impeccable.', 'Secteur canal'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 'Camille – Limite Lambersart' ELSE NULL END, 'Intervention rapide pour vitre cassée. Devis clair.', 'Limite Lambersart'),

  -- Lomme testimonials
  (CASE WHEN sd.slug = 'lomme' THEN 'Hugo – Délivrance' ELSE NULL END, 'Vitre cassée remplacée sous 24 h. Service rapide.', 'Délivrance'),
  (CASE WHEN sd.slug = 'lomme' THEN 'Sébastien – Bourg' ELSE NULL END, 'Double vitrage installé. Isolation thermique au top.', 'Bourg'),
  (CASE WHEN sd.slug = 'lomme' THEN 'Aurore – Mitterie' ELSE NULL END, 'Miroir décoratif posé. Très beau rendu.', 'Mitterie'),
  (CASE WHEN sd.slug = 'lomme' THEN 'Pauline – Mont-à-Camp' ELSE NULL END, 'Baie vitrée coulissante installée. Travail soigné.', 'Mont-à-Camp'),
  (CASE WHEN sd.slug = 'lomme' THEN 'Mathieu – Campus' ELSE NULL END, 'Verre sécurité posé en résidence étudiante. Très efficace.', 'Lomme-Campus'),
  (CASE WHEN sd.slug = 'lomme' THEN 'Élodie – Limite Loos' ELSE NULL END, 'Remplacement express après effraction. Mise en sécurité assurée.', 'Limite Loos')
) AS testimonial_data(author_name, content, location)
WHERE testimonial_data.author_name IS NOT NULL;