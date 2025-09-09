-- Créer le service chauffagiste
INSERT INTO services (name, slug, description, published)
VALUES (
  'Chauffagiste',
  'chauffagiste',
  'Installation, entretien et dépannage de systèmes de chauffage et chaudières',
  true
);

-- Récupérer les IDs pour les relations
-- Service chauffagiste
WITH service_data AS (
  SELECT id as service_id FROM services WHERE slug = 'chauffagiste'
),
city_data AS (
  SELECT id as city_id FROM cities WHERE slug = 'lille'
)

-- Créer la page service + ville
INSERT INTO service_city_pages (
  service_id,
  city_id,
  meta_title,
  meta_description,
  h1,
  h2_intro,
  intro_description,
  cta_title,
  cta_subtitle,
  zones_text,
  published
)
SELECT 
  s.service_id,
  c.city_id,
  'Chauffagiste à Lille (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur',
  'Chauffagiste à Lille : installation, entretien et dépannage de chaudières gaz et fioul. Intervention rapide, devis gratuit, agréé assurances.',
  'Chauffagiste à Lille (installation, dépannage, entretien chaudière)',
  'Une équipe de chauffagistes réactifs pour tous vos besoins à Lille.',
  'Créée par David Vanmarcke il y a 20 ans, Mon p''tit Dépanneur emploie aujourd''hui 12 artisans spécialisés. Basés à Lille, nous intervenons dans tous les quartiers (Centre, Vieux-Lille, Wazemmes, Vauban, Fives) pour l''installation, l''entretien et le dépannage de vos systèmes de chauffage. Chaudières gaz, fioul ou équipements modernes : nos chauffagistes assurent des interventions rapides, soignées et garanties. Agréés par de nombreuses compagnies d''assurances, nous simplifions aussi vos démarches après un sinistre.',
  'Besoin d''un chauffagiste à Lille ?',
  'Intervention rapide, devis gratuit et travaux garantis',
  'Nous intervenons dans tous les quartiers de Lille : Centre, Vieux-Lille, Wazemmes, Vauban-Esquermes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Hellemmes et Moulins. Nos chauffagistes couvrent aussi les communes voisines : La Madeleine, Lambersart, Marcq-en-Barœul, Saint-André-lez-Lille, Villeneuve-d''Ascq, Lomme et Loos.',
  true
FROM service_data s, city_data c;

-- Ajouter les offres spécifiques au chauffage
WITH page_data AS (
  SELECT scp.id as page_id 
  FROM service_city_pages scp
  JOIN services s ON s.id = scp.service_id
  JOIN cities c ON c.id = scp.city_id
  WHERE s.slug = 'chauffagiste' AND c.slug = 'lille'
)
INSERT INTO service_city_offers (page_id, title, description, emoji, position)
SELECT 
  p.page_id,
  'Dépannage chaudière gaz et fioul à Lille',
  'Intervention rapide en cas de panne, remise en route, réglage et remplacement de pièces défectueuses.',
  '🔥',
  1
FROM page_data p
UNION ALL
SELECT 
  p.page_id,
  'Entretien annuel obligatoire',
  'Contrôle sécurité, nettoyage brûleur, vérification du rendement. Attestation conforme remise à l''issue.',
  '🛠',
  2
FROM page_data p
UNION ALL
SELECT 
  p.page_id,
  'Installation de chaudière à Lille',
  'Pose de chaudières gaz à condensation ou basse température. Conseil sur le modèle adapté à votre logement.',
  '🌡',
  3
FROM page_data p
UNION ALL
SELECT 
  p.page_id,
  'Remplacement de chaudière ancienne',
  'Substitution de chaudières vétustes par des modèles récents, plus performants et économes en énergie.',
  '♻️',
  4
FROM page_data p
UNION ALL
SELECT 
  p.page_id,
  'Entretien de circuit de chauffage',
  'Purge des radiateurs, désembouage des canalisations, optimisation du rendement global.',
  '💧',
  5
FROM page_data p
UNION ALL
SELECT 
  p.page_id,
  'Conseil économies d''énergie',
  'Audit rapide et recommandations pour réduire vos consommations de chauffage à Lille.',
  '🌍',
  6
FROM page_data p;

-- Ajouter les FAQs spécifiques chauffagiste + lille
WITH service_city_data AS (
  SELECT s.id as service_id, c.id as city_id
  FROM services s, cities c
  WHERE s.slug = 'chauffagiste' AND c.slug = 'lille'
)
INSERT INTO service_city_faqs (service_id, city_id, question, answer, position)
SELECT 
  sc.service_id,
  sc.city_id,
  'Quels sont vos délais pour un dépannage chaudière à Lille ?',
  'En cas de panne, nous pouvons intervenir en moins de deux heures dans Lille intramuros (Centre, Wazemmes, Vauban, Fives). Nos chauffagistes sont équipés pour diagnostiquer rapidement l''origine du problème (allumage, brûleur, circulation d''eau). Nous effectuons une mise en sécurité immédiate, puis la réparation ou le remplacement des pièces défectueuses.',
  1
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Quel est le prix moyen d''un entretien annuel de chaudière à Lille ?',
  'Le tarif d''un entretien varie entre 120 et 160 € TTC, selon le type de chaudière (gaz, fioul, condensation). La prestation inclut le nettoyage du brûleur, le contrôle des émissions, la vérification des organes de sécurité et l''édition de l''attestation obligatoire. Cet entretien est indispensable pour garantir la sécurité, prolonger la durée de vie de l''appareil et rester couvert par l''assurance habitation.',
  2
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Intervenez-vous sur les chaudières anciennes des maisons de Moulins ou Vauban ?',
  'Oui, nous travaillons régulièrement dans des habitations anciennes aux installations parfois vétustes. Nos chauffagistes connaissent les réseaux encastrés et les chaudières fioul ou gaz d''ancienne génération. Lorsque la réparation devient trop coûteuse, nous proposons un remplacement par une chaudière plus performante, en veillant à adapter le modèle aux contraintes de l''habitation.',
  3
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Proposez-vous des contrats d''entretien pour les logements collectifs de Lille ?',
  'Oui, nous proposons des contrats annuels pour les particuliers, mais aussi pour les bailleurs et syndics de copropriété. Ces contrats incluent une visite d''entretien, la vérification complète de l''appareil, et une assistance prioritaire en cas de panne. Les résidents d''immeubles étudiants ou collectifs (Fives, Wazemmes, Hellemmes) apprécient cette tranquillité.',
  4
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Installez-vous des chaudières gaz à condensation dans les appartements du Vieux-Lille ?',
  'Oui, nous posons des chaudières gaz à condensation, y compris dans les logements anciens du centre historique. Nous sélectionnons des modèles compacts pour les cuisines ou celliers exigus. Leur rendement élevé permet de réduire la consommation d''énergie et de respecter les normes environnementales actuelles. Nous assurons la mise en conformité des conduits d''évacuation.',
  5
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Êtes-vous disponibles le week-end pour les urgences chauffage à Lille ?',
  'Oui, nous avons des équipes de garde le samedi et le dimanche. Les urgences les plus fréquentes sont les chaudières qui s''arrêtent brusquement en hiver. Nous effectuons une mise en sécurité, un dépannage provisoire si nécessaire, puis programmons une réparation définitive. Les frais de week-end sont communiqués à l''avance, sans surprise.',
  6
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Travaillez-vous avec les assurances en cas de sinistre lié au chauffage ?',
  'Oui, nous sommes agréés par de nombreuses compagnies (Maaf, Groupama, Gan, Macif). En cas de sinistre (dégât des eaux lié au chauffage, panne provoquant un gel des canalisations), nous fournissons devis, photos et facture détaillée. Nous pouvons aussi échanger avec l''expert missionné pour accélérer la prise en charge et limiter vos démarches administratives.',
  7
FROM service_city_data sc
UNION ALL
SELECT 
  sc.service_id,
  sc.city_id,
  'Quelles zones de Lille couvrez-vous pour vos interventions de chauffage ?',
  'Nous intervenons dans tous les quartiers : Centre, Vieux-Lille, Wazemmes, Vauban-Esquermes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Hellemmes, Moulins. Nos chauffagistes se déplacent également dans les communes voisines : La Madeleine, Marcq-en-Barœul, Lambersart, Saint-André-lez-Lille, Villeneuve-d''Ascq, Lomme, Loos.',
  8
FROM service_city_data sc;

-- Ajouter un témoignage spécifique chauffagiste + lille
WITH service_city_data AS (
  SELECT s.id as service_id, c.id as city_id
  FROM services s, cities c
  WHERE s.slug = 'chauffagiste' AND c.slug = 'lille'
)
INSERT INTO testimonials (service_id, city_id, content, author_name, location, rating)
SELECT 
  sc.service_id,
  sc.city_id,
  'Chaudière tombée en panne en plein mois de janvier à Vauban. Le chauffagiste est arrivé en 1h30, a remplacé la pièce défectueuse et m''a donné des conseils pour mieux régler mon installation. Service sérieux et efficace.',
  'Antoine',
  'Lille',
  5
FROM service_city_data sc;

-- Ajouter des articles de blog pour le chauffage
WITH service_data AS (
  SELECT id as service_id FROM services WHERE slug = 'chauffagiste'
)
INSERT INTO blog_posts (service_id, title, slug, excerpt, content, published)
SELECT 
  s.service_id,
  'Comment réduire sa facture de chauffage à Lille en hiver ?',
  'reduire-facture-chauffage-lille-hiver',
  'Découvrez nos conseils pratiques pour diminuer votre consommation de chauffage et faire des économies durant la saison froide.',
  'Guide complet pour optimiser votre chauffage et réduire vos factures énergétiques à Lille...',
  true
FROM service_data s
UNION ALL
SELECT 
  s.service_id,
  'Chaudière gaz à condensation : avantages et économies possibles',
  'chaudiere-gaz-condensation-avantages-economies',
  'Les chaudières à condensation offrent un excellent rendement énergétique. Découvrez leurs avantages et le retour sur investissement.',
  'Tout savoir sur les chaudières gaz à condensation, leur fonctionnement et leurs bénéfices...',
  true
FROM service_data s
UNION ALL
SELECT 
  s.service_id,
  'Quand faut-il remplacer une chaudière ancienne à Lille ?',
  'remplacer-chaudiere-ancienne-lille',
  'Signes d''usure, consommation excessive, pannes fréquentes : apprenez à identifier quand changer votre chaudière.',
  'Guide pour savoir quand remplacer sa chaudière et choisir le bon modèle...',
  true
FROM service_data s
UNION ALL
SELECT 
  s.service_id,
  'Entretien annuel de chaudière : ce que dit la loi en France',
  'entretien-annuel-chaudiere-loi-france',
  'L''entretien annuel de chaudière est obligatoire. Découvrez la réglementation et les sanctions en cas de non-respect.',
  'Obligations légales concernant l''entretien des chaudières en France...',
  true
FROM service_data s
UNION ALL
SELECT 
  s.service_id,
  'Radiateurs qui chauffent mal : causes fréquentes et solutions',
  'radiateurs-chauffent-mal-causes-solutions',
  'Radiateurs froids ou tièdes ? Identifiez les causes possibles et les solutions pour retrouver un chauffage efficace.',
  'Diagnostic et solutions pour des radiateurs qui ne chauffent pas correctement...',
  true
FROM service_data s
UNION ALL
SELECT 
  s.service_id,
  'Désembouage des circuits : pourquoi c''est indispensable tous les 5 ans',
  'desembouage-circuits-chauffage-indispensable',
  'Le désembouage permet d''optimiser les performances de votre installation de chauffage. Découvrez pourquoi et quand le réaliser.',
  'L''importance du désembouage pour maintenir l''efficacité de votre système de chauffage...',
  true
FROM service_data s;