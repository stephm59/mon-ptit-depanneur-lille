-- Insert final service city FAQs for vitrier (last cities)
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme')
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
  -- Bondues FAQs
  (CASE WHEN sd.slug = 'bondues' THEN 1 ELSE NULL END, 'Intervenez-vous sur les grandes maisons de Bondues ?', 'Oui, remplacement de vitres, double vitrage premium, vitrages anti-effraction.'),
  (CASE WHEN sd.slug = 'bondues' THEN 2 ELSE NULL END, 'Proposez-vous des vitres sécurité haut de gamme ?', 'Oui, feuilletés, trempés, anti-balle si besoin, intégrés discrètement.'),
  (CASE WHEN sd.slug = 'bondues' THEN 3 ELSE NULL END, 'Faites-vous des baies vitrées grand format ?', 'Oui, sur mesure avec vitrages isolants et sécurisés.'),
  (CASE WHEN sd.slug = 'bondues' THEN 4 ELSE NULL END, 'Faites-vous de la miroiterie décorative ?', 'Oui, miroirs muraux, crédences, vitrages décoratifs premium.'),
  (CASE WHEN sd.slug = 'bondues' THEN 5 ELSE NULL END, 'Pouvez-vous intervenir après bris de glace ?', 'Oui, mise en sécurité sous 1 h, remplacement rapide.'),
  (CASE WHEN sd.slug = 'bondues' THEN 6 ELSE NULL END, 'Travaillez-vous avec assurances ?', 'Oui, devis/facture agréés pour remboursement.'),
  (CASE WHEN sd.slug = 'bondues' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers de Bondues ?', 'Oui, Montjoie, Ravennes-les-Francs, Vertu-Couture, centre, campagne.'),
  (CASE WHEN sd.slug = 'bondues' THEN 8 ELSE NULL END, 'Vos prestations sont-elles garanties ?', 'Oui, garantie biennale et décennale.'),

  -- La Madeleine FAQs
  (CASE WHEN sd.slug = 'la-madeleine' THEN 1 ELSE NULL END, 'Pouvez-vous intervenir en copropriétés à La Madeleine ?', 'Oui, coordination avec syndics, respect parties communes.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 2 ELSE NULL END, 'Faites-vous du double vitrage acoustique ?', 'Oui, idéal pour rues passantes Saint-Maur, Botanique.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 3 ELSE NULL END, 'Posez-vous des vitrines pour commerces ?', 'Oui, vitrines sécurisées et esthétiques, pose rapide.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 4 ELSE NULL END, 'Faites-vous des miroirs sur mesure ?', 'Oui, miroirs biseautés, teintés, imprimés pour studios et appartements.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 5 ELSE NULL END, 'Quels délais après effraction ?', 'Mise en sécurité immédiate, remplacement définitif sous 24–72 h.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 6 ELSE NULL END, 'Proposez-vous du verre sécurité ?', 'Oui, feuilleté, trempé, anti-effraction pour rez-de-chaussée et commerces.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers ?', 'Oui, Saint-Maur, Botanique, Berkem, Romarin, centre-ville.'),
  (CASE WHEN sd.slug = 'la-madeleine' THEN 8 ELSE NULL END, 'Vos interventions sont-elles garanties ?', 'Oui, garantie biennale/décennale selon travaux.'),

  -- Lambersart FAQs
  (CASE WHEN sd.slug = 'lambersart' THEN 1 ELSE NULL END, 'Faites-vous des baies vitrées à Lambersart ?', 'Oui, baies coulissantes ou fixes adaptées maisons bourgeoises.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 2 ELSE NULL END, 'Posez-vous du double vitrage premium ?', 'Oui, isolation renforcée pour maisons Canteleu, Pacot-Vandracq.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 3 ELSE NULL END, 'Proposez-vous des vitrages de sécurité ?', 'Oui, feuilletés/trempés avec finitions haut de gamme.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 4 ELSE NULL END, 'Faites-vous de la miroiterie décorative ?', 'Oui, miroirs muraux, crédences, tablettes en verre.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 5 ELSE NULL END, 'Pouvez-vous intervenir après cambriolage ?', 'Oui, mise en sécurité immédiate, devis assurance fourni.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 6 ELSE NULL END, 'Travaillez-vous avec assurances ?', 'Oui, devis/facture compatibles remboursement.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers ?', 'Oui, Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg.'),
  (CASE WHEN sd.slug = 'lambersart' THEN 8 ELSE NULL END, 'Offrez-vous une garantie ?', 'Oui, garantie biennale et décennale.')
) AS faq_data(position, question, answer)
WHERE faq_data.position IS NOT NULL;