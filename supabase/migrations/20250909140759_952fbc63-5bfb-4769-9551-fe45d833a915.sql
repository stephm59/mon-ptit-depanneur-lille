-- Insert last service city FAQs for vitrier
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('saint-andre-lez-lille', 'lomme')
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
  -- Saint-André-lez-Lille FAQs
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 1 ELSE NULL END, 'Intervenez-vous sur vitres cassées à Saint-André ?', 'Oui, mise en sécurité rapide, remplacement sous 24–72 h.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 2 ELSE NULL END, 'Posez-vous du double vitrage isolant ?', 'Oui, idéal pour maisons Sainte-Hélène, bords de Deûle.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 3 ELSE NULL END, 'Faites-vous des vitrines pour commerces ?', 'Oui, vitrines sécurisées adaptées commerces de proximité.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 4 ELSE NULL END, 'Proposez-vous de la miroiterie ?', 'Oui, miroirs sur mesure, crédences, vitrages décoratifs.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 5 ELSE NULL END, 'Pouvez-vous intervenir après effraction ?', 'Oui, sécurisation immédiate et devis assurance.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 6 ELSE NULL END, 'Travaillez-vous avec assurances ?', 'Oui, documents fournis pour remboursement.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers ?', 'Oui, centre, Sainte-Hélène, bords de Deûle, gare.'),
  (CASE WHEN sd.slug = 'saint-andre-lez-lille' THEN 8 ELSE NULL END, 'Vos travaux sont-ils garantis ?', 'Oui, biennale et décennale selon nature travaux.'),

  -- Lomme FAQs
  (CASE WHEN sd.slug = 'lomme' THEN 1 ELSE NULL END, 'Quels délais pour remplacer une vitre à Lomme ?', 'Mise en sécurité immédiate, remplacement définitif sous 72 h.'),
  (CASE WHEN sd.slug = 'lomme' THEN 2 ELSE NULL END, 'Posez-vous du double vitrage phonique ?', 'Oui, idéal pour Délivrance, Bourg, Mitterie, proches axes routiers.'),
  (CASE WHEN sd.slug = 'lomme' THEN 3 ELSE NULL END, 'Faites-vous des baies vitrées ?', 'Oui, coulissantes, fixes ou oscillo-battantes, adaptées maisons/appartements.'),
  (CASE WHEN sd.slug = 'lomme' THEN 4 ELSE NULL END, 'Proposez-vous de la miroiterie décorative ?', 'Oui, miroirs, crédences, vitres laquées sur mesure.'),
  (CASE WHEN sd.slug = 'lomme' THEN 5 ELSE NULL END, 'Pouvez-vous intervenir après effraction ?', 'Oui, mise en sécurité immédiate, devis assurance.'),
  (CASE WHEN sd.slug = 'lomme' THEN 6 ELSE NULL END, 'Installez-vous des verres sécurité ?', 'Oui, feuilletés, trempés, anti-effraction.'),
  (CASE WHEN sd.slug = 'lomme' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers ?', 'Oui, Délivrance, Bourg, Mitterie, Mont-à-Camp, Campus.'),
  (CASE WHEN sd.slug = 'lomme' THEN 8 ELSE NULL END, 'Vos interventions sont-elles garanties ?', 'Oui, garantie biennale/décennale selon travaux.')
) AS faq_data(position, question, answer)
WHERE faq_data.position IS NOT NULL;