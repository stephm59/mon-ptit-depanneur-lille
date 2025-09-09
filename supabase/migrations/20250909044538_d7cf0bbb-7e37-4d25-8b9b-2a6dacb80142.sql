-- Create the service_city_page for Chauffagiste Vieux-Lille
INSERT INTO service_city_pages (
  service_id, 
  city_id, 
  published, 
  meta_title, 
  meta_description, 
  h1, 
  h2_intro, 
  intro_description, 
  cta_title, 
  cta_subtitle,
  zones_text
) VALUES (
  'fec63f1b-094d-4a13-8e44-8dfe7732368f', -- chauffagiste service_id
  '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', -- vieux-lille city_id
  true,
  'Chauffagiste Vieux-Lille (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur',
  'Chauffagiste à Vieux-Lille : installation, entretien et dépannage de chaudières gaz et fioul. Interventions rapides dans les immeubles anciens du centre historique. Devis gratuit, agréé assurances.',
  'Chauffagiste Vieux-Lille (installation, dépannage, entretien chaudière)',
  'Chauffagistes experts du centre historique du Vieux-Lille.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur accompagne les habitants du Vieux-Lille pour l''entretien, le dépannage et l''installation de chaudières. Nos artisans connaissent parfaitement les contraintes des immeubles anciens et des logements exigus. Chaudières gaz, fioul ou condensation : nous proposons des solutions adaptées et efficaces. Agréés par de nombreuses compagnies d''assurances, nous facilitons aussi vos démarches après un sinistre.',
  'Besoin d''un chauffagiste dans le Vieux-Lille ?',
  'Intervention rapide, devis gratuit et travaux garantis',
  'Nos chauffagistes interviennent dans l''ensemble du Vieux-Lille : rues piétonnes, Esquermoise, rue de Gand, place du Concert, rue Royale, rue Basse. Nous couvrons aussi les zones limitrophes : Centre-ville de Lille, Saint-Maurice Pellevoisin, Vauban et Wazemmes.'
);

-- Get the page_id for creating offers
WITH new_page AS (
  SELECT id as page_id FROM service_city_pages 
  WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f' 
  AND city_id = '7d96f406-7c7a-4673-b88b-c975cdcdcbd5'
)
-- Create the 6 service offers
INSERT INTO service_city_offers (page_id, position, emoji, title, description) 
SELECT 
  new_page.page_id,
  position,
  emoji,
  title,
  description
FROM new_page,
(VALUES 
  (1, '🔥', 'Dépannage chaudière gaz et fioul dans le Vieux-Lille', 'Intervention rapide dans les appartements et maisons de ville du quartier historique.'),
  (2, '🛠', 'Entretien annuel obligatoire', 'Nettoyage complet, contrôle sécurité et attestation conforme pour votre assurance habitation.'),
  (3, '🌡', 'Installation de chaudière compacte', 'Modèles à condensation optimisés pour les espaces réduits des logements anciens.'),
  (4, '♻️', 'Remplacement de chaudière vétuste', 'Transition vers des appareils modernes, performants et conformes aux normes actuelles.'),
  (5, '💧', 'Désembouage et purge de radiateurs', 'Améliore le rendement et prolonge la durée de vie de votre installation.'),
  (6, '🌍', 'Conseils économies d''énergie', 'Solutions adaptées aux particularités des bâtiments du centre historique.')
) AS offers(position, emoji, title, description);

-- Create the 8 local FAQs
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer) VALUES 
('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 1, 
 'Vos délais pour un dépannage chaudière dans le Vieux-Lille ?',
 'Nous intervenons en moyenne sous 2 heures dans le quartier. Nos équipes connaissent bien les contraintes d''accès des rues piétonnes et des immeubles anciens. Nous effectuons une mise en sécurité immédiate, puis réparons ou remplaçons les pièces nécessaires.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 2,
 'Quel est le tarif d''un entretien de chaudière dans un appartement ancien du Vieux-Lille ?',
 'Le prix varie entre 120 et 160 € TTC selon le type de chaudière (gaz, fioul, condensation). L''entretien inclut le nettoyage du brûleur, le contrôle de sécurité et l''émission d''une attestation obligatoire pour l''assurance.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 3,
 'Pouvez-vous intervenir dans les immeubles historiques aux accès étroits ?',
 'Oui, nous sommes équipés pour travailler dans des conditions complexes : escaliers étroits, chaufferies en sous-sol, conduits vétustes. Nos chauffagistes utilisent du matériel compact et prévoient des solutions adaptées pour préserver les lieux tout en respectant les normes.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 4,
 'Installez-vous des chaudières adaptées aux petits logements du Vieux-Lille ?',
 'Oui, nous proposons des chaudières gaz à condensation compactes, idéales pour les appartements exigus. Ces modèles offrent un rendement élevé et permettent de réduire la consommation d''énergie tout en s''intégrant dans les espaces réduits.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 5,
 'Êtes-vous disponibles le week-end pour les pannes de chauffage ?',
 'Oui, nous avons une permanence le samedi et le dimanche pour les urgences. En cas de panne soudaine, nous intervenons rapidement pour sécuriser l''installation et, si besoin, assurons un dépannage provisoire avant réparation définitive.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 6,
 'Travaillez-vous avec les syndics pour les chaudières collectives du Vieux-Lille ?',
 'Oui, nous collaborons régulièrement avec les syndics de copropriété. Nous assurons l''entretien des chaudières collectives, la vérification des colonnes montantes et la coordination avec gardiens et résidents pour limiter les coupures d''eau chaude.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 7,
 'Puis-je bénéficier d''aides pour remplacer ma vieille chaudière ?',
 'Oui, vous pouvez prétendre à certaines aides comme MaPrimeRénov'' ou les primes énergie, sous conditions. Nous accompagnons nos clients dans la constitution du dossier et conseillons sur le choix du modèle éligible.'),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 8,
 'Quelles zones du Vieux-Lille couvrez-vous ?',
 'Nous intervenons dans toutes les rues du Vieux-Lille : Esquermoise, Gand, Royale, Basse, place du Concert, ainsi que les secteurs limitrophes comme Saint-Maurice et le centre-ville de Lille.');

-- Create the 6 testimonials
INSERT INTO testimonials (service_id, city_id, author_name, location, content, rating) VALUES 
('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Élodie', 'rue de Gand', 'Panne de chaudière en plein hiver. Le chauffagiste est arrivé en 1h30 et a remis le chauffage en marche. Service rapide et efficace.', 5),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Paul', 'place du Concert', 'Remplacement de mon ancienne chaudière gaz par un modèle à condensation compact. Installation propre, délais respectés.', 5),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Nathalie', 'rue Esquermoise', 'Entretien annuel réalisé avec sérieux. Le technicien m''a donné des conseils utiles pour réduire ma consommation.', 5),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Hugo', 'rue Saint-André', 'Chaudière en panne un dimanche matin. Intervention en urgence, problème réglé dans la journée. Très rassurant.', 5),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Camille', 'rue Royale', 'Travail soigné et explications claires pour l''utilisation de ma nouvelle chaudière. Je recommande vivement.', 5),

('fec63f1b-094d-4a13-8e44-8dfe7732368f', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Karim', 'rue Basse', 'Purge des radiateurs et désembouage du circuit. Depuis, ma maison chauffe beaucoup plus vite et de façon homogène.', 5);