
BEGIN;

-- Contexte:
-- service "Plombier" id: cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f
-- villes:
-- Lille: 41e4c37b-0b72-4728-84be-71a7de25f678
-- Vieux-Lille: 7d96f406-7c7a-4673-b88b-c975cdcdcbd5
-- Villeneuve-d'Ascq: 4ea6f4b1-ab62-470d-a013-4cf8b0f3c344
-- Marcq-en-Barœul: e817298c-4ad9-4364-b785-11c43385ef87
-- Bondues: ab53a895-693a-442a-8831-a131b6a5fa0c
-- La Madeleine: 4df6cbf7-a13c-4212-b0f6-c1cd609f962f
-- Lambersart: cc82e78a-b946-4428-be7f-f877ba558c33
-- Saint-André-lez-Lille: 41b391ea-988d-4bc5-8b65-7d17cb33565d
-- Lomme: 5d20eab4-98d6-42ba-ae93-7b57f3a9397b

-- 1) Nettoyage des FAQs locales existantes pour ces villes
DELETE FROM public.service_city_faqs
WHERE service_id = 'cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f'
  AND city_id IN (
    '41e4c37b-0b72-4728-84be-71a7de25f678', -- Lille
    '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', -- Vieux-Lille
    '4ea6f4b1-ab62-470d-a013-4cf8b0f3c344', -- Villeneuve-d'Ascq
    'e817298c-4ad9-4364-b785-11c43385ef87', -- Marcq-en-Barœul
    'ab53a895-693a-442a-8831-a131b6a5fa0c', -- Bondues
    '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', -- La Madeleine
    'cc82e78a-b946-4428-be7f-f877ba558c33', -- Lambersart
    '41b391ea-988d-4bc5-8b65-7d17cb33565d', -- Saint-André-lez-Lille
    '5d20eab4-98d6-42ba-ae93-7b57f3a9397b'  -- Lomme
  );

-- 2) Insertion des nouvelles FAQs locales

-- Lille
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Quel est le délai moyen pour l’intervention d’un plombier à Lille centre ou Wazemmes ?','Généralement sous 2h dans Lille intramuros (Centre, Vieux-Lille, Wazemmes, Fives). Les urgences comme une fuite sont prioritaires.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Réparez-vous les installations anciennes dans les maisons de Moulins ou Vauban ?','Oui. Nous travaillons souvent sur des réseaux vétustes, avec solutions durables adaptées.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Quels sont vos tarifs pour un débouchage de canalisation à Lille ?','De 120 à 250 € TTC selon diamètre et accessibilité. Un devis est toujours fourni avant travaux.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Intervenez-vous dans les résidences étudiantes de Hellemmes et Fives ?','Oui, nous dépannons régulièrement dans les logements étudiants et résidences universitaires.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Remplacez-vous les ballons d’eau chaude dans les immeubles collectifs du Vieux-Lille ?','Oui, en coordination avec le syndic et dans le respect des parties communes.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Faites-vous l’entretien des colonnes montantes d’eau à Lille ?','Oui, pour syndics et copropriétés, sur réseaux collectifs et montées d’immeubles.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Aidez-vous pour les démarches auprès des assurances après un dégât des eaux ?','Oui, nous fournissons devis, facture et photos pour simplifier la déclaration.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41e4c37b-0b72-4728-84be-71a7de25f678','Dans quelles zones de Lille intervenez-vous ?','Centre, Vieux-Lille, Wazemmes, Vauban, Bois-Blancs, Fives, Hellemmes, Moulins… et communes voisines (Marcq, La Madeleine, Lambersart, Lomme, Loos).',8,true);

-- Vieux-Lille
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Intervenez-vous rapidement dans le centre historique du Vieux-Lille ?','Oui, nous connaissons les rues étroites et les contraintes de circulation.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Faites-vous attention aux intérieurs anciens du Vieux-Lille lors des réparations ?','Oui, nous protégeons parquets, moulures et menuiseries typiques du quartier.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Peut-on remplacer un ballon d’eau chaude dans un immeuble ancien ?','Oui, nous utilisons des modèles compacts adaptés aux cages étroites.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Combien de temps prend un débouchage d’évier ou de douche ?','45 minutes à 1h en moyenne selon la gravité.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Proposez-vous des solutions gain de place pour les salles de bains ?','Oui, douche à l’italienne compacte, meubles suspendus, WC gain de place.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Travaillez-vous avec les syndics du Vieux-Lille ?','Oui, interventions régulières pour copropriétés et syndics.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Est-ce possible d’obtenir un devis avant intervention ?','Oui, devis estimatif avant travaux, confirmé après diagnostic.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','7d96f406-7c7a-4673-b88b-c975cdcdcbd5','Quelles zones du Vieux-Lille couvrez-vous ?','Esplanade, Citadelle, Comtesse, jusqu’à la Grand’Place et Lille-Flandres.',8,true);

-- Villeneuve-d'Ascq
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Intervenez-vous sur les campus universitaires (Pont-de-Bois, Cité scientifique) ?','Oui, nous dépannons souvent dans les résidences étudiantes et campus.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Quels types de ballons installez-vous à Villeneuve-d’Ascq ?','Ballons électriques, thermodynamiques et compacts selon besoins étudiants ou familles.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','L’eau est-elle calcaire à Villeneuve-d’Ascq ?','Oui, un adoucisseur protège vos installations et améliore le confort.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Combien coûte un débouchage canalisation à Villeneuve-d’Ascq ?','De 110 à 220 € TTC selon l’accès (cuisine, salle de bains, WC).',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Faites-vous la rénovation complète de salles de bains ?','Oui, projet clé en main : douche, carrelage, électricité, coordination corps d’état.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Intervenez-vous le week-end à Villeneuve-d’Ascq ?','Oui, selon charge, avec équipes de garde.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Accompagnez-vous les dossiers d’assurance ?','Oui, nous fournissons devis, factures et photos.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4ea6f4b1-ab62-470d-a013-4cf8b0f3c344','Zones couvertes à Villeneuve-d’Ascq ?','Hôtel-de-Ville, Triolo, Annappes, Ascq, Brigode + communes voisines (Wasquehal, Mons, Croix).',8,true);

-- Marcq-en-Barœul
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Pouvez-vous intervenir rapidement au Croisé-Laroche ?','Oui, nous avons des créneaux rapides dans ce secteur très demandé.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Proposez-vous le débouchage de canalisations dans les maisons de Plouich ?','Oui, avec méthodes non destructives (pompe HP, furet électrique).',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Prenez-vous en charge l’évacuation d’un ballon usagé ?','Oui, la dépose et l’évacuation sont incluses.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Faut-il un adoucisseur à Marcq ?','Oui, l’eau est calcaire. L’adoucisseur protège vos appareils.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Faites-vous des devis pour des rénovations de salles de bains à Marcq ?','Oui, devis clair avec coordination carrelage/électricité.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Travaillez-vous aussi le samedi ?','Oui, selon disponibilité de l’équipe.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Aidez-vous pour les assurances après dégât des eaux ?','Oui, entreprise agréée, documents fournis.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','e817298c-4ad9-4364-b785-11c43385ef87','Quels quartiers de Marcq couvrez-vous ?','Bourg, Croisé, Plouich, Pont, Rouges-Barres + Wasquehal, La Madeleine, Lille.',8,true);

-- Bondues
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Intervenez-vous dans les lotissements familiaux de Bondues ?','Oui, avec délais rapides et matériel adapté aux grandes habitations.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Les canalisations enterrées posent-elles problème à Bondues ?','Non, nous utilisons caméra d’inspection et pompe haute pression.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Quel est le prix moyen pour remplacer un ballon à Bondues ?','Entre 250 et 600 € TTC selon capacité, pose incluse.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Un adoucisseur est-il utile à Bondues ?','Oui, recommandé pour lutter contre le calcaire et protéger vos appareils.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Faites-vous des rénovations de salles de bains clés en main ?','Oui, coordination complète et finitions soignées.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Êtes-vous disponibles le samedi à Bondues ?','Oui, créneaux de garde pour urgences.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Travaillez-vous avec les assurances pour les sinistres ?','Oui, devis, factures et photos fournis.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','ab53a895-693a-442a-8831-a131b6a5fa0c','Quelles zones couvrez-vous à Bondues ?','Centre, Montjoie, Ravennes-les-Francs + Mouvaux, Roncq, Wambrechies.',8,true);

-- La Madeleine
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Pouvez-vous intervenir rapidement dans les immeubles proches de Lille-Europe ?','Oui, délais très courts dans Gare et Botanique.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Prenez-vous en charge les colonnes montantes des copropriétés ?','Oui, interventions régulières pour syndics.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Quel est le prix moyen d’un débouchage en appartement ?','Entre 120 et 200 € TTC selon type de canalisation.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Faut-il un adoucisseur à La Madeleine ?','Oui, l’eau est dure, l’adoucisseur réduit le tartre.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Faites-vous des rénovations complètes de salles de bains ?','Oui, clé en main, notamment dans Saint-Maur et Botanique.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Êtes-vous disponibles le week-end ?','Oui, pour urgences ou RDV planifiés.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Aidez-vous pour les dossiers assurance ?','Oui, nous gérons toute la partie administrative.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','4df6cbf7-a13c-4212-b0f6-c1cd609f962f','Quelles zones de La Madeleine couvrez-vous ?','Saint-Maur, Botanique, Berkem + Marcq, Saint-André, Lille.',8,true);

-- Lambersart
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Intervenez-vous dans les maisons bourgeoises de Canteleu ?','Oui, en respectant les finitions haut de gamme.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Vos méthodes de débouchage conviennent-elles aux réseaux des années 70 ?','Oui, matériel adapté aux réseaux encastrés et anciens.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Quel est le délai moyen pour un remplacement de ballon à Lambersart ?','Moins de 24h selon le modèle et le stock.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','L’eau est-elle calcaire à Lambersart ?','Oui, un adoucisseur est conseillé.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Faites-vous des rénovations de salles de bains au Pacot-Vandracq ?','Oui, avec coordination et devis clair.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Intervenez-vous le samedi ?','Oui, selon disponibilité.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Travaillez-vous avec les assurances ?','Oui, entreprise agréée, documents fournis.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','cc82e78a-b946-4428-be7f-f877ba558c33','Quelles zones couvrez-vous ?','Bourg, Canteleu, Pacot-Vandracq, Champ-de-Courses, Lompret.',8,true);

-- Saint-André-lez-Lille
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Intervenez-vous dans les maisons proches de la Deûle ?','Oui, délais rapides dans le centre et le long des berges.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Débouchage de colonnes collectives : possible ?','Oui, nous travaillons avec syndics et copropriétés.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Quel est le prix d’un remplacement de ballon à Saint-André ?','Entre 250 et 500 € TTC, évacuation incluse.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Faut-il un adoucisseur à Saint-André ?','Oui, l’eau est calcaire.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Faites-vous des rénovations dans les maisons anciennes ?','Oui, accompagnement complet et adapté aux contraintes.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Intervenez-vous le week-end ?','Oui, pour urgences et créneaux programmés.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Aidez-vous pour les assurances ?','Oui, devis, photos, factures fournis.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','41b391ea-988d-4bc5-8b65-7d17cb33565d','Quelles zones couvrez-vous ?','Centre, Sainte-Hélène, périphérie + La Madeleine, Lambersart, Marquette, Lille.',8,true);

-- Lomme
INSERT INTO public.service_city_faqs (service_id, city_id, question, answer, position, published) VALUES
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Intervenez-vous dans les pavillons de la Délivrance ?','Oui, interventions régulières dans ce quartier pavillonnaire.',1,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Combien de temps pour un débouchage à Lomme ?','En moyenne 30 à 60 minutes.',2,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Proposez-vous des ballons adaptés aux familles lommoises ?','Oui, de 150 à 300 L selon taille du foyer.',3,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Faut-il un adoucisseur à Lomme ?','Oui, recommandé pour limiter le calcaire.',4,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Faites-vous des rénovations complètes de salle de bains à Lomme ?','Oui, clé en main, même dans les maisons mitoyennes à espace réduit.',5,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Êtes-vous disponibles le samedi ?','Oui, selon créneaux.',6,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Travaillez-vous avec les assurances après dégât des eaux ?','Oui, entreprise agréée.',7,true),
('cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f','5d20eab4-98d6-42ba-ae93-7b57f3a9397b','Quelles zones de Lomme couvrez-vous ?','Bourg, Délivrance, Mitterie, Mont-à-Camp + Loos, Capinghem, Lambersart.',8,true);

COMMIT;
