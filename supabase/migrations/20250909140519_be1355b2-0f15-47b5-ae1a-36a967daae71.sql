-- Insert service city FAQs for vitrier
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, c.slug
  FROM services s
  CROSS JOIN cities c
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('lille', 'vieux-lille', 'villeneuve-d-ascq', 'marcq-en-baroeul', 'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme')
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
  -- Lille FAQs
  (CASE WHEN sd.slug = 'lille' THEN 1 ELSE NULL END, 'Quels délais pour remplacer une vitre cassée à Lille ?', 'Mise en sécurité immédiate, remplacement définitif sous 24–72 h selon type et dimensions.'),
  (CASE WHEN sd.slug = 'lille' THEN 2 ELSE NULL END, 'Proposez-vous du double vitrage acoustique pour les quartiers bruyants ?', 'Oui, idéal pour République, Liberté, Vauban. Isolation sonore jusqu''à –35 dB.'),
  (CASE WHEN sd.slug = 'lille' THEN 3 ELSE NULL END, 'Travaillez-vous avec les assurances habitation ?', 'Oui, devis, facture et photos conformes fournis pour prise en charge bris de glace.'),
  (CASE WHEN sd.slug = 'lille' THEN 4 ELSE NULL END, 'Pouvez-vous intervenir pour des vitrines de commerce ?', 'Oui, sécurisation provisoire (panneaux bois) puis remplacement par vitrage sécurisé.'),
  (CASE WHEN sd.slug = 'lille' THEN 5 ELSE NULL END, 'Installez-vous des verres de sécurité ?', 'Oui, feuilletés, trempés ou retardateurs d''effraction, adaptés aux rez-de-chaussée.'),
  (CASE WHEN sd.slug = 'lille' THEN 6 ELSE NULL END, 'Faites-vous des miroirs sur mesure ?', 'Oui, miroirs biseautés, teintés ou imprimés, découpés et posés sur mesure.'),
  (CASE WHEN sd.slug = 'lille' THEN 7 ELSE NULL END, 'Couvrez-vous tous les quartiers de Lille ?', 'Oui, Vieux-Lille, Wazemmes, Vauban, Bois-Blancs, Fives, Saint-Maurice, Hellemmes, Lomme.'),
  (CASE WHEN sd.slug = 'lille' THEN 8 ELSE NULL END, 'Vos travaux sont-ils garantis ?', 'Oui, garantie biennale sur les poses simples et décennale sur ouvrages lourds.'),

  -- Vieux-Lille FAQs
  (CASE WHEN sd.slug = 'vieux-lille' THEN 1 ELSE NULL END, 'Pouvez-vous remplacer une vitre dans un immeuble ancien du Vieux-Lille ?', 'Oui, nos vitriers interviennent avec précaution pour respecter huisseries et menuiseries anciennes.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 2 ELSE NULL END, 'Proposez-vous du double vitrage acoustique dans ce quartier animé ?', 'Oui, recommandé pour rues de Gand, Basse, Esquermoise. Réduction sonore importante.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 3 ELSE NULL END, 'Pouvez-vous poser des vitrines pour commerces ?', 'Oui, vitrines sécurisées avec verre feuilleté et mise en sécurité provisoire si besoin.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 4 ELSE NULL END, 'Faites-vous des miroirs décoratifs adaptés aux appartements anciens ?', 'Oui, miroirs sur mesure (biseautés, teintés) adaptés au style patrimonial.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 5 ELSE NULL END, 'Quels délais pour une mise en sécurité ?', 'Nous intervenons sous 1 h avec fermeture provisoire si nécessaire.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 6 ELSE NULL END, 'Vos interventions sont-elles couvertes par assurances ?', 'Oui, devis/facture conformes pour remboursement assurance habitation.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 7 ELSE NULL END, 'Faites-vous des vitrages de sécurité au Vieux-Lille ?', 'Oui, verres anti-effraction adaptés rez-de-chaussée et commerces.'),
  (CASE WHEN sd.slug = 'vieux-lille' THEN 8 ELSE NULL END, 'Offrez-vous une garantie sur vos interventions ?', 'Oui, garantie biennale sur la pose et décennale sur ouvrages lourds.')
) AS faq_data(position, question, answer)
WHERE faq_data.position IS NOT NULL;