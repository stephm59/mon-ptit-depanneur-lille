
BEGIN;

-- Cible: service "plombier" + ville "vieux-lille"
WITH s AS (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
     c AS (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1)
DELETE FROM service_city_faqs
WHERE service_id = (SELECT id FROM s)
  AND city_id = (SELECT id FROM c);

-- Insert des 8 nouvelles FAQ locales
INSERT INTO service_city_faqs (service_id, city_id, position, published, question, answer)
VALUES
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  1, true,
  $$Pouvez-vous intervenir rapidement dans les rues étroites et piétonnes du Vieux-Lille ?$$,
  $$Oui. Le quartier impose des contraintes de circulation et de stationnement, mais nous avons des créneaux “centre historique” avec véhicules légers et matériel compact. Selon l’urgence (fuite active, WC inutilisable), nous priorisons une mise en sécurité le jour même, puis planifions la réparation si des pièces spécifiques sont nécessaires. Nous coordonnons aussi l’accès avec gardien/syndic quand l’immeuble le requiert. Notre objectif : limiter les allers-retours, travailler proprement dans des communs souvent étroits, et réduire la gêne pour les voisins comme pour les commerces de rue.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  2, true,
  $$Comment protégez-vous les intérieurs anciens (parquets, moulures) pendant l’intervention ?$$,
  $$Les appartements du Vieux-Lille ont des finitions précieuses : parquets anciens, moulures, menuiseries. Nous posons des bâches de protection, des tapis absorbants dans les zones de passage et utilisons des sur-chaussures. Le perçage est limité et réalisé avec micro-outillage ; l'aspiration est simultanée pour éviter les poussières. En cas d'ouverture de cloison, nous montons un confinement léger (film + ruban) afin de contenir les poussières. Avant de commencer, nous validons avec vous le cheminement, les protections souhaitées et la remise en état prévue pour laisser les lieux propres et sains.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  3, true,
  $$Remplacer un ballon d'eau chaude sans ascenseur : est-ce faisable ?$$,
  $$Oui, mais cela se prépare. Dans les immeubles anciens aux cages étroites, nous privilégions des ballons compacts ou des positions alternatives (horizontal/vertical selon volume). Nous sécurisons la dépose, vidangeons l'ancien appareil, protégeons les parties communes, et organisons l'évacuation jusqu'au véhicule sans salir ni endommager. Si l'accès est très contraint, on peut proposer un modèle de capacité optimisée (ex. 150–200 L bien régulé) avec résistance stéatite, pour garder du confort sans sacrifier l'espace. Le devis précise la logistique, les délais et la mise en conformité électrique/hydraulique.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  4, true,
  $$Vos interventions sur canalisations plomb/cuivre anciennes sont-elles durables ?$$,
  $$Nous commençons par un diagnostic : état des soudures, zones fragilisées, sections encastrées. Lorsque la réparation ponctuelle est risquée (plomb fatigué, cuivre piqué), nous proposons un remplacement ciblé par multicouche/cuivre avec brasures soignées et raccords adaptés, afin d'éviter les récidives. Dans les cuisines/salles d'eau, on en profite souvent pour remettre des robinets d'arrêt accessibles. Si la colonne collective est concernée, nous coordonnons avec le syndic l'arrêt d'eau et les créneaux pour limiter l'impact sur la copropriété. L'objectif : une solution pérenne, conforme et propre.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  5, true,
  $$Petites salles de bains du centre historique : quelles solutions concrètes ?$$,
  $$Nous travaillons beaucoup sur des surfaces compactes. Les leviers : douche à l'italienne faible hauteur (siphon extra-plat), parois sur mesure, meubles suspendus, WC gain de place, rangements verticaux, mitigeurs thermostatiques économes. Côté plomberie, on rationalise les réseaux pour gagner des centimètres (passages optimisés, robinets d'arrêt accessibles). On traite aussi la ventilation (VMC/entrée d'air) pour limiter condensation et moisissures, fréquentes dans les immeubles anciens. Avant devis, on valide un plan d'implantation précis avec contraintes d'évacuation et d'alimentation pour éviter les mauvaises surprises en chantier.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  6, true,
  $$Débouchage en immeuble ancien : y a-t-il des risques pour les canalisations ?$$,
  $$Le but est d'être non destructif. On commence par des techniques mécaniques (furet, pompe), puis on passe à l'hydrocurage basse/haute pression si nécessaire. Quand l'accès le permet, une inspection caméra aide à localiser coude, affaissement ou dépôt calcaire. Dans les copropriétés, on vérifie si le bouchon est privatif ou collectif (descente d'eaux usées/gras), afin de prévenir le syndic si l'origine est commune. Après l'intervention, on donne des conseils d'entretien (siphons, crépines, gestes à éviter) pour limiter les récidives, très courantes sur réseaux anciens.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  7, true,
  $$Comment fonctionnent vos devis et tarifs dans le Vieux-Lille ?$$,
  $$La transparence est clé. Pour un débouchage simple, le tarif est forfaitisé et communiqué avant déplacement. Si un diagnostic s'impose (réseaux encastrés, ballon inaccessible), nous réalisons une estimation sur place puis un devis détaillé (pièces, main-d'œuvre, protections, évacuation). En urgence, on effectue la mise en sécurité et on chiffre la réparation définitive ensuite. Nous proposons des plages horaires compatibles avec la vie de quartier (commerces, voisins) et, si besoin, des interventions matin tôt/fin de journée pour minimiser la gêne.$$
),
(
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1),
  (SELECT id FROM cities WHERE slug = 'vieux-lille' LIMIT 1),
  8, true,
  $$Travaillez-vous avec les syndics et bailleurs du Vieux-Lille ?$$,
  $$Oui, régulièrement. Nous savons gérer les autorisations d'intervention, l'affichage pour coupure d'eau, et les créneaux coordonnés avec gardiens/concierges. Pour les dossiers de sinistre, nous fournissons photos, devis, facture et un compte-rendu synthétique. Sur colonnes montantes ou réseaux communs, nous planifions en amont (accès aux caves, toitures techniques, locaux compteur) pour ne pas bloquer l'immeuble. Cette habitude du travail en copropriété dans l'hyper-centre nous permet d'être efficaces, polis avec le voisinage et respectueux des parties communes.$$
);

COMMIT;
