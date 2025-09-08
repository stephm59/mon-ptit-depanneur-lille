
WITH s AS (
  SELECT id FROM public.services WHERE slug = 'plombier' LIMIT 1
),
c AS (
  SELECT id FROM public.cities WHERE slug = 'lambersart' LIMIT 1
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
     'Intervenez-vous dans les maisons bourgeoises de Canteleu ?',
     'Oui, nous avons l’habitude d’intervenir dans ces habitations spacieuses aux installations parfois anciennes. Les réseaux d’eau y sont souvent en cuivre ou en plomb, avec des canalisations encastrées. Nous adaptons nos méthodes pour préserver les finitions haut de gamme (parquets, boiseries, carrelages anciens). Lors de nos interventions, nous posons des protections et travaillons avec précision pour limiter les nuisances, tout en proposant des solutions durables.'
    ),
    (2,
     'Vos méthodes de débouchage sont-elles adaptées aux pavillons des années 70 de Pacot-Vandracq ?',
     'Oui, ces pavillons ont des réseaux qui peuvent être sensibles et parfois mal ventilés. Nous privilégions des techniques mécaniques (furet électrique, pompe) avant de passer à l’hydrocurage, qui permet un nettoyage en profondeur des conduites. Si nous détectons une faiblesse ou un affaissement, nous conseillons une réparation ciblée pour éviter les récidives. Une inspection caméra peut être proposée pour vérifier l’état des canalisations.'
    ),
    (3,
     'Quel est le délai moyen pour remplacer un ballon d’eau chaude à Lambersart ?',
     'En général, nous intervenons sous 24 heures pour un remplacement. Nous proposons des modèles électriques de différentes capacités, adaptés aux familles comme aux couples. La prestation inclut la dépose de l’ancien ballon, son évacuation vers une filière de recyclage et la pose du nouveau modèle avec mise en service immédiate. Nous fournissons également un certificat d’installation conforme aux normes actuelles.'
    ),
    (4,
     'L’eau est-elle calcaire à Lambersart ? Faut-il un adoucisseur ?',
     'Oui, l’eau est dure dans toute la métropole. Le tartre use prématurément les chauffe-eaux, encrasse la robinetterie et réduit l’efficacité des appareils électroménagers. L’installation d’un adoucisseur permet de prolonger la durée de vie des équipements et d’améliorer le confort quotidien. Nous proposons des modèles adaptés aux besoins des familles lambersartoises, avec installation et entretien annuel inclus.'
    ),
    (5,
     'Faites-vous des rénovations complètes de salles de bains à Lambersart ?',
     'Oui, nous intervenons aussi bien dans les grandes maisons bourgeoises que dans les pavillons modernes. Nos services incluent la refonte des réseaux, l’installation de douches à l’italienne, de baignoires et de meubles modernes. Nous coordonnons aussi les carreleurs, peintres et électriciens pour livrer un chantier clé en main. Le devis est gratuit et détaillé, avec accompagnement personnalisé pour optimiser l’espace et respecter votre budget.'
    ),
    (6,
     'Êtes-vous disponibles le samedi pour des interventions à Lambersart ?',
     'Oui, nous assurons des interventions de garde le samedi, en particulier pour les urgences : fuites, engorgements ou ballon en panne. Nos clients apprécient cette flexibilité, notamment ceux qui travaillent en semaine. Les tarifs spécifiques sont communiqués à l’avance afin d’assurer une totale transparence.'
    ),
    (7,
     'Travaillez-vous avec les assurances en cas de dégât des eaux à Lambersart ?',
     'Oui, nous sommes agréés par de nombreuses compagnies (Maaf, Groupama, Gan, Macif). Nous fournissons devis, photos et facture pour constituer votre dossier. Nous échangeons aussi avec les experts mandatés, afin de faciliter la prise en charge et d’accélérer votre remboursement.'
    ),
    (8,
     'Quelles zones de Lambersart couvrez-vous ?',
     'Nous intervenons dans tous les quartiers : Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg, Lompret. Nous couvrons aussi les zones limitrophes avec Lille et Saint-André. Cette implantation locale nous permet d’assurer des interventions rapides, qu’il s’agisse d’une urgence ou d’un projet programmé.'
    )
) AS v(position, question, answer);
