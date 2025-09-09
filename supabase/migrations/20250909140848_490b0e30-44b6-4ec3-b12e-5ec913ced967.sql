-- Insert testimonials for vitrier service - Part 1
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('lille', 'vieux-lille', 'villeneuve-d-ascq')
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
  -- Lille testimonials
  (CASE WHEN sd.slug = 'lille' THEN 'Sophie – Centre' ELSE NULL END, 'Remplacement rapide d''une vitre cassée après effraction. Mise en sécurité immédiate.', 'Centre'),
  (CASE WHEN sd.slug = 'lille' THEN 'Karim – Wazemmes' ELSE NULL END, 'Pose de double vitrage phonique. Résultat impeccable, plus de bruit.', 'Wazemmes'),
  (CASE WHEN sd.slug = 'lille' THEN 'Amélie – Vieux-Lille' ELSE NULL END, 'Miroir sur mesure livré et posé. Très belle finition.', 'Vieux-Lille'),
  (CASE WHEN sd.slug = 'lille' THEN 'Marc – Fives' ELSE NULL END, 'Dépannage un soir après bris de glace. Intervention en 40 minutes.', 'Fives'),
  (CASE WHEN sd.slug = 'lille' THEN 'Claire – Vauban' ELSE NULL END, 'Installation de baie vitrée coulissante. Travail précis et soigné.', 'Vauban-Esquermes'),
  (CASE WHEN sd.slug = 'lille' THEN 'Nicolas – Hellemmes' ELSE NULL END, 'Pose de verre feuilleté sécurité en rez-de-chaussée. Très rassurant.', 'Hellemmes'),

  -- Vieux-Lille testimonials
  (CASE WHEN sd.slug = 'vieux-lille' THEN 'Élodie – Rue Basse' ELSE NULL END, 'Remplacement discret d''une vitre ancienne, respect des huisseries.', 'Rue Basse'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 'Damien – Rue Royale' ELSE NULL END, 'Double vitrage acoustique posé, réduction nette du bruit.', 'Rue Royale'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 'Sarah – Rue Esquermoise' ELSE NULL END, 'Miroir décoratif sur mesure, finition impeccable.', 'Rue Esquermoise'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 'Paul – Rue de Gand' ELSE NULL END, 'Vitrine de commerce remplacée en urgence. Mise en sécurité efficace.', 'Rue de Gand'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 'Nadia – Place du Concert' ELSE NULL END, 'Vitrier intervenu en moins d''une heure, travail soigné.', 'Place du Concert'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 'Benoît – Rue Saint-Sébastien' ELSE NULL END, 'Pose de verre sécurité après tentative d''effraction. Très pro.', 'Rue Saint-Sébastien'),

  -- Villeneuve-d'Ascq testimonials
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 'Amandine – Flers-Bourg' ELSE NULL END, 'Vitre cassée remplacée rapidement, devis clair.', 'Flers-Bourg'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 'Hugo – Triolo' ELSE NULL END, 'Double vitrage phonique installé, parfait pour mon studio.', 'Triolo'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 'Karine – Brigode' ELSE NULL END, 'Baie vitrée posée avec soin. Chantier propre et rapide.', 'Brigode'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 'Antoine – Annappes' ELSE NULL END, 'Miroir sur mesure livré et installé, très satisfait.', 'Annappes'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 'Lucie – Hôtel de Ville' ELSE NULL END, 'Intervention rapide après bris de glace, mise en sécurité efficace.', 'Hôtel de Ville'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 'David – Campus' ELSE NULL END, 'Pose de verre feuilleté sécurité dans mon studio. Service impeccable.', 'Campus')
) AS testimonial_data(author_name, content, location)
WHERE testimonial_data.author_name IS NOT NULL;