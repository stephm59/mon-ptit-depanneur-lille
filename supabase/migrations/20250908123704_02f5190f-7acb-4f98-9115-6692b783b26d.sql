
WITH s AS (
  SELECT id FROM public.services WHERE slug = 'plombier' LIMIT 1
),
c AS (
  SELECT id FROM public.cities WHERE slug = 'saint-andre-lez-lille' LIMIT 1
),
pair AS (
  SELECT s.id AS service_id, c.id AS city_id FROM s CROSS JOIN c
),
deleted AS (
  DELETE FROM public.service_city_faqs f
  WHERE (f.service_id, f.city_id) IN (SELECT service_id, city_id FROM pair)
  RETURNING 1
)
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published)
SELECT 
  pair.service_id, 
  pair.city_id, 
  v.question, 
  v.answer, 
  v.position, 
  true
FROM pair
CROSS JOIN (
  VALUES
    (1,
     'Pouvez-vous intervenir rapidement dans le centre de Saint-André et le long de la Deûle ?',
     'Oui, nous intervenons très régulièrement dans le centre-ville et dans les maisons proches de la Deûle. Grâce à notre proximité avec Lille, nous pouvons dépêcher un plombier sous deux heures pour les urgences. Pour les interventions programmées, comme le remplacement d’un ballon ou une rénovation de salle de bains, nous fixons généralement un rendez-vous sous 48 h. Notre connaissance du secteur nous permet d’adapter nos interventions aux contraintes locales (stationnement, accès en maison mitoyenne, circulation).'
    ),
    (2,
     'Prenez-vous en charge le débouchage de colonnes collectives dans les immeubles ?',
     'Oui, nous travaillons régulièrement avec les syndics de Saint-André pour l’entretien et le débouchage des colonnes montantes et collectives. Nous utilisons des techniques adaptées : inspection caméra pour localiser le bouchon, hydrocurage haute pression pour un nettoyage en profondeur, et réparation ciblée si une faiblesse est détectée. Notre objectif est de rétablir rapidement l’écoulement, tout en limitant les nuisances pour l’ensemble des résidents.'
    ),
    (3,
     'Quel est le prix moyen pour remplacer un ballon d’eau chaude à Saint-André ?',
     'Le tarif varie selon la capacité (100, 200, 300 L) et le type d’appareil (électrique ou thermodynamique). Pour une famille de 4 personnes, le coût se situe entre 250 et 500 € TTC, pose comprise. La prestation inclut la dépose, l’évacuation de l’ancien ballon et l’installation du nouveau avec mise en service. Nous fournissons également un certificat attestant de la conformité aux normes en vigueur.'
    ),
    (4,
     'L’eau de Saint-André est-elle dure ? Faut-il installer un adoucisseur ?',
     'Oui, l’eau est calcaire dans cette partie de la métropole. Cela entraîne du tartre dans les canalisations, use prématurément les chauffe-eaux et laisse des traces sur la robinetterie. L’installation d’un adoucisseur est donc fortement recommandée. Nous proposons des modèles adaptés aux besoins des familles comme des couples, avec installation complète et contrat d’entretien annuel pour assurer un fonctionnement optimal.'
    ),
    (5,
     'Réalisez-vous des rénovations de salles de bains dans les maisons anciennes de Saint-André ?',
     'Oui, nous intervenons régulièrement dans des maisons anciennes où les réseaux nécessitent une mise aux normes. Nous assurons la refonte des arrivées et évacuations d’eau, la pose de sanitaires modernes, et la coordination avec carreleurs, peintres et électriciens. Que vous souhaitiez installer une douche à l’italienne, remplacer une baignoire ou optimiser l’espace, nous proposons un devis détaillé et des solutions adaptées à vos contraintes.'
    ),
    (6,
     'Êtes-vous disponibles le week-end pour les urgences à Saint-André ?',
     'Oui, nous assurons des gardes le samedi et parfois le dimanche pour les urgences : fuites importantes, canalisations bouchées ou ballon en panne. Nous privilégions toujours la mise en sécurité immédiate, puis planifions la réparation définitive si des pièces spécifiques sont nécessaires. Les tarifs de week-end sont clairement indiqués avant l’intervention.'
    ),
    (7,
     'Travaillez-vous avec les assurances en cas de dégât des eaux à Saint-André ?',
     'Oui, nous sommes agréés par une vingtaine de compagnies (Maaf, Macif, Gan, Groupama, etc.). Nous fournissons devis, photos et factures pour constituer un dossier complet. Nous sommes aussi en mesure d’échanger directement avec l’expert missionné par l’assurance pour accélérer la prise en charge et réduire vos démarches.'
    ),
    (8,
     'Quelles zones de Saint-André-lez-Lille couvrez-vous ?',
     'Nous intervenons dans tout Saint-André : centre-ville, quartier Sainte-Hélène, zones pavillonnaires proches de la Deûle, ainsi que dans les quartiers limitrophes de Lambersart, La Madeleine et Marquette-lez-Lille. Cette implantation nous permet d’assurer un service rapide et adapté à chaque type de logement, du pavillon familial à l’appartement en copropriété.'
    )
) AS v(position, question, answer);
