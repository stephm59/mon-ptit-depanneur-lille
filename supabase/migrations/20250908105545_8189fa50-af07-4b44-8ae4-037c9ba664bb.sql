
BEGIN;

-- Écraser les FAQ locales pour Plombier (service_id) x Lille (city_id)
DELETE FROM public.service_city_faqs
WHERE service_id = 'cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f'
  AND city_id   = '41e4c37b-0b72-4728-84be-71a7de25f678';

INSERT INTO public.service_city_faqs (service_id, city_id, position, question, answer, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',1,
$$Quel est le délai moyen pour l’intervention d’un plombier à Lille centre ou Wazemmes ?$$,
$$En cas d’urgence, nous pouvons intervenir à Lille en moins de deux heures dans la majorité des cas. Nos équipes sont organisées par secteurs, ce qui nous permet de couvrir efficacement le Centre, le Vieux-Lille, Wazemmes, Fives, Vauban et même Hellemmes. Lorsqu’il s’agit d’une fuite d’eau importante ou d’un dégât des eaux, nous donnons la priorité absolue à la mise en sécurité. Pour les interventions programmées (remplacement de ballon, rénovation de salle de bains), nous proposons généralement un rendez-vous sous 48 h.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',2,
$$Réparez-vous les installations anciennes dans les maisons de Moulins ou Vauban ?$$,
$$Oui, nous avons l’habitude de travailler dans des maisons anciennes, souvent équipées de réseaux en plomb ou en cuivre vieillissant. Dans les quartiers de Moulins ou Vauban, il n’est pas rare de rencontrer des tuyauteries encastrées ou des canalisations fragiles. Nous réalisons un diagnostic précis pour éviter tout dommage supplémentaire, puis proposons une réparation durable ou un remplacement partiel du réseau. Nous intervenons toujours en respectant le style et les matériaux d’origine lorsque c’est possible.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',3,
$$Quels sont vos tarifs pour un débouchage de canalisation à Lille ?$$,
$$Le prix d’un débouchage dépend du type de canalisation et de la méthode utilisée. Pour un simple évier ou lavabo bouché, comptez généralement entre 120 et 180 € TTC. Pour un WC ou une canalisation principale nécessitant un furet électrique ou une pompe haute pression, le tarif peut aller de 180 à 250 € TTC. Dans tous les cas, nous fournissons un devis clair avant l’intervention. Nous privilégions toujours une méthode non destructive, afin de préserver vos installations et d’éviter des travaux inutiles.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',4,
$$Intervenez-vous dans les résidences étudiantes de Hellemmes et Fives ?$$,
$$Oui, nous intervenons très régulièrement dans les logements étudiants et résidences universitaires de Lille, notamment à Hellemmes et Fives. Les problèmes les plus fréquents sont les fuites sur la robinetterie, les ballons d’eau chaude défectueux et les canalisations bouchées. Nous adaptons nos prestations à ces logements souvent compacts, avec des solutions rapides et économiques. Notre équipe sait aussi se coordonner avec les gardiens et services techniques pour limiter la gêne pour les autres occupants de l’immeuble.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',5,
$$Remplacez-vous les ballons d’eau chaude dans les immeubles collectifs du Vieux-Lille ?$$,
$$Oui, nous remplaçons les ballons dans tous types de logements, y compris dans les immeubles anciens du Vieux-Lille. Nous tenons compte des contraintes spécifiques : cages d’escalier étroites, espaces réduits, locaux techniques partagés. Nous proposons des modèles compacts ou adaptés aux copropriétés, et nous assurons la dépose et l’évacuation de l’ancien appareil. L’installation est réalisée dans le respect des normes de sécurité, avec un certificat de conformité si nécessaire.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',6,
$$Faites-vous l’entretien des colonnes montantes d’eau à Lille ?$$,
$$Oui, nous intervenons pour les syndics de copropriété et les bailleurs sociaux sur l’entretien et la rénovation des colonnes montantes. Ces réseaux collectifs, parfois très anciens, demandent une expertise particulière. Nous effectuons le diagnostic, la mise aux normes et les réparations nécessaires, tout en limitant l’interruption d’eau pour les habitants. Notre objectif est de sécuriser les installations et d’améliorer le confort des résidents, tout en garantissant la conformité aux réglementations en vigueur.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',7,
$$Aidez-vous pour les démarches auprès des assurances après un dégât des eaux à Lille ?$$,
$$Oui, nous vous accompagnons dans vos démarches auprès de votre assurance habitation. Nous fournissons un devis détaillé, des photos des dommages et une facture conforme pour accélérer le remboursement. Étant agréés par de nombreuses compagnies (Maaf, Gan, Groupama, Macif…), nos interventions sont reconnues et facilitent la prise en charge. Nous conseillons aussi nos clients sur les étapes à suivre pour déclarer le sinistre dans les délais et limiter les conséquences financières.$$,
true),

('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678',8,
$$Dans quelles zones de Lille intervenez-vous ?$$,
$$Nos équipes couvrent l’ensemble de Lille : Centre-Ville, Vieux-Lille, Wazemmes, Vauban, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Hellemmes, Moulins. Nous intervenons aussi dans les communes limitrophes : La Madeleine, Marcq-en-Barœul, Lambersart, Lomme et Loos. Cette proximité nous permet d’organiser des interventions rapides, qu’il s’agisse d’une urgence ou d’un chantier programmé. Grâce à notre connaissance du terrain et de ses spécificités, nous garantissons réactivité et efficacité.$$,
true);

COMMIT;
