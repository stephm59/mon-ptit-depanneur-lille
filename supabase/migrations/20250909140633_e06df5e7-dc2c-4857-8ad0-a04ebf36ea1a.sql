-- Insert more service city FAQs for vitrier (remaining cities)
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('villeneuve-d-ascq', 'marcq-en-baroeul', 'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme')
)
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT 
  sd.service_id,
  sd.city_id,
  faq_data.position,
  faq_data.question,
  faq_data.answer,
  true
FROM service_data sd
CROSS JOIN LATERAL (
  VALUES
  -- Villeneuve-d'Ascq FAQs
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 1 ELSE NULL END, 'Intervenez-vous dans les résidences étudiantes de Villeneuve-d''Ascq ?', 'Oui, dépannage rapide campus Pont-de-Bois, Triolo, Hôtel de Ville.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 2 ELSE NULL END, 'Posez-vous du double vitrage pour maisons ?', 'Oui, isolation thermique et phonique idéale pour Brigode, Flers-Bourg.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 3 ELSE NULL END, 'Faites-vous des baies vitrées dans pavillons ascquois ?', 'Oui, baies coulissantes, fixes ou oscillo-battantes adaptées.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 4 ELSE NULL END, 'Vos services incluent-ils la miroiterie ?', 'Oui, miroirs sur mesure, crédences en verre laqué, tablettes décoratives.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 5 ELSE NULL END, 'Pouvez-vous intervenir après un bris de glace ?', 'Oui, mise en sécurité immédiate et remplacement sous 24–72 h.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 6 ELSE NULL END, 'Vos prestations sont-elles garanties ?', 'Oui, garantie biennale et décennale selon les ouvrages.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 7 ELSE NULL END, 'Proposez-vous des verres de sécurité ?', 'Oui, feuilletés, trempés, retardateurs d''effraction.'),
  (CASE WHEN sd.slug = 'villeneuve-d-ascq' THEN 8 ELSE NULL END, 'Couvrez-vous tous les quartiers de la ville ?', 'Oui, Annappes, Brigode, Flers-Bourg, Triolo, Hôtel de Ville et résidences étudiantes.'),

  -- Marcq-en-Barœul FAQs  
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 1 ELSE NULL END, 'Faites-vous du double vitrage à Marcq-en-Barœul ?', 'Oui, pour améliorer confort et réduire nuisances au Croisé-Laroche, Bourg, Plouich.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 2 ELSE NULL END, 'Proposez-vous des vitrines pour commerces ?', 'Oui, vitrines sécurisées adaptées aux commerces du Croisé-Laroche.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 3 ELSE NULL END, 'Installez-vous des baies vitrées ?', 'Oui, baies coulissantes, fixes ou oscillo-battantes avec pose soignée.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 4 ELSE NULL END, 'Vos vitres sécurité sont-elles certifiées ?', 'Oui, verres conformes normes européennes, agréés assurances.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 5 ELSE NULL END, 'Vos délais sont-ils rapides après effraction ?', 'Oui, mise en sécurité immédiate, pose provisoire, remplacement sous 72 h.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 6 ELSE NULL END, 'Faites-vous des miroirs décoratifs ?', 'Oui, miroirs sur mesure pour intérieurs modernes ou classiques.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers ?', 'Oui, Croisé-Laroche, Bourg, Plouich, Hippodrome, Pont, Rouges-Barres.'),
  (CASE WHEN sd.slug = 'marcq-en-baroeul' THEN 8 ELSE NULL END, 'Offrez-vous une garantie sur vos travaux ?', 'Oui, garantie biennale et décennale.')
) AS faq_data(position, question, answer)
WHERE faq_data.position IS NOT NULL;