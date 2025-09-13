-- Créer les offres pour toutes les pages chauffagiste
INSERT INTO service_city_offers (page_id, title, description, emoji, position)
SELECT 
  scp.id,
  CASE 
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 1 THEN 'Installation de chaudière'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 2 THEN 'Entretien annuel obligatoire'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 3 THEN 'Dépannage chaudière d''urgence'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 4 THEN 'Réparation de radiateurs'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 5 THEN 'Installation de thermostat'
    ELSE 'Diagnostic thermique'
  END as title,
  CASE 
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 1 THEN 'Chaudière gaz, fioul, électrique : conseil, dimensionnement, pose et mise en service.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 2 THEN 'Entretien réglementaire, nettoyage, réglage et certificat de conformité.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 3 THEN 'Intervention rapide 7j/7 pour panne, fuite ou problème de chauffage.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 4 THEN 'Purge, équilibrage, remplacement de robinets thermostatiques.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 5 THEN 'Thermostat d''ambiance programmable pour optimiser votre confort.'
    ELSE 'Audit énergétique et conseils pour améliorer vos performances.'
  END as description,
  CASE 
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 1 THEN '🔥'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 2 THEN '🔧'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 3 THEN '🚨'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 4 THEN '🌡️'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 5 THEN '📱'
    ELSE '📊'
  END as emoji,
  ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) as position
FROM service_city_pages scp
JOIN services s ON scp.service_id = s.id
CROSS JOIN (
  SELECT 1 as pos UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
) offer_data
WHERE s.slug = 'chauffagiste';

-- Créer les offres pour toutes les pages vitrier
INSERT INTO service_city_offers (page_id, title, description, emoji, position)
SELECT 
  scp.id,
  CASE 
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 1 THEN 'Remplacement vitre cassée'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 2 THEN 'Installation double vitrage'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 3 THEN 'Pose de miroirs sur mesure'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 4 THEN 'Réparation de fenêtre'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 5 THEN 'Sécurisation de vitrine'
    ELSE 'Dépannage d''urgence'
  END as title,
  CASE 
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 1 THEN 'Intervention rapide pour vitre brisée, prise en charge assurance directe.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 2 THEN 'Amélioration isolation thermique et phonique, économies d''énergie.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 3 THEN 'Miroir salle de bain, dressing : découpe et pose professionnelles.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 4 THEN 'Réparation mécanisme, joint d''étanchéité, remplacement de carreau.'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 5 THEN 'Vitrage feuilleté, film sécurité pour commerces et bureaux.'
    ELSE 'Service d''urgence 7j/7 pour mise en sécurité immédiate.'
  END as description,
  CASE 
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 1 THEN '🔨'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 2 THEN '🏠'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 3 THEN '🪟'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 4 THEN '🔧'
    WHEN ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) = 5 THEN '🛡️'
    ELSE '🚨'
  END as emoji,
  ROW_NUMBER() OVER (PARTITION BY scp.id ORDER BY offer_data.pos) as position
FROM service_city_pages scp
JOIN services s ON scp.service_id = s.id
CROSS JOIN (
  SELECT 1 as pos UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
) offer_data
WHERE s.slug = 'vitrier';