-- Supprimer les FAQs existantes pour chauffagiste et vitrier (pour éviter les conflits)
DELETE FROM service_city_faqs 
WHERE service_id IN (
  SELECT id FROM services WHERE slug IN ('chauffagiste', 'vitrier')
);

-- Recréer les FAQs pour chauffagiste
INSERT INTO service_city_faqs (service_id, city_id, question, answer, position, published)
SELECT 
  s.id as service_id,
  c.id as city_id,
  CASE 
    WHEN faq_data.pos = 1 THEN CONCAT('Quel est le prix d''un entretien de chaudière à ', c.name, ' ?')
    WHEN faq_data.pos = 2 THEN CONCAT('Intervenez-vous en urgence pour une panne de chauffage à ', c.name, ' ?')
    WHEN faq_data.pos = 3 THEN CONCAT('Quels types de chaudières installez-vous à ', c.name, ' ?')
    WHEN faq_data.pos = 4 THEN CONCAT('Proposez-vous un contrat d''entretien annuel à ', c.name, ' ?')
    WHEN faq_data.pos = 5 THEN CONCAT('Combien coûte le remplacement d''une chaudière à ', c.name, ' ?')
    ELSE CONCAT('Effectuez-vous la réparation de radiateurs à ', c.name, ' ?')
  END as question,
  CASE 
    WHEN faq_data.pos = 1 THEN CONCAT('L''entretien annuel obligatoire d''une chaudière à ', c.name, ' coûte généralement entre 120€ et 180€ TTC selon le type d''appareil (gaz, fioul, électrique). Cette prestation comprend le nettoyage, les réglages, les contrôles de sécurité et la remise du certificat de conformité. Nous proposons également des contrats d''entretien annuels avec tarifs préférentiels.')
    WHEN faq_data.pos = 2 THEN CONCAT('Oui, nous assurons un service de dépannage 7j/7 à ', c.name, ' pour toute urgence chauffage : panne de chaudière, fuite, problème d''eau chaude. Nos techniciens interviennent en priorité pour remettre votre installation en fonctionnement rapidement. Le délai d''intervention moyen est de 2h en cas d''urgence avérée.')
    WHEN faq_data.pos = 3 THEN CONCAT('Nous installons tous types de chaudières à ', c.name, ' : chaudières gaz (murale ou au sol), chaudières fioul, électriques et chaudières à condensation. Nous vous conseillons sur le modèle le plus adapté à votre logement, réalisons l''étude de dimensionnement et assurons la pose avec mise en service complète selon les normes en vigueur.')
    WHEN faq_data.pos = 4 THEN CONCAT('Oui, nous proposons des contrats d''entretien annuel à ', c.name, ' avec intervention programmée, tarifs préférentiels sur les dépannages, et priorité sur les urgences. Le contrat inclut l''entretien réglementaire, les petites réparations et un diagnostic complet de votre installation. C''est la garantie d''un chauffage fiable toute l''année.')
    WHEN faq_data.pos = 5 THEN CONCAT('Le coût de remplacement d''une chaudière à ', c.name, ' varie selon le type choisi : entre 2500€ et 4500€ TTC pour une chaudière gaz classique, jusqu''à 6000€ pour une chaudière à condensation. Ce prix comprend la dépose de l''ancien appareil, la pose du nouveau, les raccordements et la mise en service. Nous vous accompagnons pour les aides financières disponibles.')
    ELSE CONCAT('Oui, nous effectuons tous types de réparations sur radiateurs à ', c.name, ' : purge du circuit, équilibrage hydraulique, remplacement de robinets thermostatiques, réparation de fuites. Nos techniciens diagnostiquent rapidement l''origine du problème et proposent des solutions durables pour optimiser le confort et les performances de votre installation de chauffage.')
  END as answer,
  faq_data.pos as position,
  true as published
FROM services s, cities c
CROSS JOIN (
  SELECT 1 as pos UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
) faq_data
WHERE s.slug = 'chauffagiste' AND c.published = true;

-- Créer les FAQs pour vitrier
INSERT INTO service_city_faqs (service_id, city_id, question, answer, position, published)
SELECT 
  s.id as service_id,
  c.id as city_id,
  CASE 
    WHEN faq_data.pos = 1 THEN CONCAT('Combien coûte le remplacement d''une vitre cassée à ', c.name, ' ?')
    WHEN faq_data.pos = 2 THEN CONCAT('Intervenez-vous en urgence pour une vitre brisée à ', c.name, ' ?')
    WHEN faq_data.pos = 3 THEN CONCAT('Installez-vous du double vitrage à ', c.name, ' ?')
    WHEN faq_data.pos = 4 THEN CONCAT('Travaillez-vous avec les assurances à ', c.name, ' ?')
    WHEN faq_data.pos = 5 THEN CONCAT('Posez-vous des miroirs sur mesure à ', c.name, ' ?')
    ELSE CONCAT('Effectuez-vous la sécurisation de vitrines à ', c.name, ' ?')
  END as question,
  CASE 
    WHEN faq_data.pos = 1 THEN CONCAT('Le coût de remplacement d''une vitre à ', c.name, ' dépend des dimensions et du type de verre : comptez entre 80€ et 200€ TTC pour une vitre simple, jusqu''à 400€ pour du double vitrage. Ce prix inclut la découpe sur mesure, le déplacement et la pose. Nous établissons systématiquement un devis gratuit avant intervention.')
    WHEN faq_data.pos = 2 THEN CONCAT('Oui, nous assurons un service d''urgence 7j/7 à ', c.name, ' pour toute vitre brisée nécessitant une mise en sécurité immédiate. Nous intervenons rapidement pour poser un film de protection temporaire ou remplacer la vitre selon la situation. Notre délai d''intervention moyen en urgence est de 1h30.')
    WHEN faq_data.pos = 3 THEN CONCAT('Oui, nous installons du double vitrage à ', c.name, ' pour améliorer l''isolation thermique et phonique de votre habitat. Nous proposons différents types de double vitrage selon vos besoins : classique, renforcé, à contrôle solaire. L''installation comprend la prise de mesures, la fabrication sur mesure et la pose professionnelle.')
    WHEN faq_data.pos = 4 THEN CONCAT('Oui, nous travaillons régulièrement avec les compagnies d''assurances à ', c.name, ' et facilitons vos démarches en cas de sinistre. Nous établissons les devis conformes aux exigences des assureurs et pouvons être mandatés pour les réparations. La prise en charge directe est possible selon votre contrat d''assurance.')
    WHEN faq_data.pos = 5 THEN CONCAT('Oui, nous réalisons la découpe et la pose de miroirs sur mesure à ', c.name, ' : miroirs de salle de bains, dressing, decoration. Nous travaillons avec des verres de qualité et proposons différentes finitions (bords polis, biseautés). La pose est réalisée avec fixations invisibles ou cadres selon vos préférences.')
    ELSE CONCAT('Oui, nous sécurisons les vitrines et locaux commerciaux à ', c.name, ' avec du vitrage feuilleté, des films de sécurité ou du verre trempé. Ces solutions renforcent la protection contre l''effraction et limitent les risques de blessures en cas de bris. Nous conseillons la solution la plus adaptée à votre activité.')
  END as answer,
  faq_data.pos as position,
  true as published
FROM services s, cities c
CROSS JOIN (
  SELECT 1 as pos UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
) faq_data
WHERE s.slug = 'vitrier' AND c.published = true;