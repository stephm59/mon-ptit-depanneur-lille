-- Compléter les avis clients pour les services restants

-- Avis pour Climatisation (service_id: 0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40)
INSERT INTO testimonials (service_id, city_id, author_name, content, location, rating, published) VALUES
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '41e4c37b-0b72-4728-84be-71a7de25f678', 'Valérie Descamps', 'Installation climatisation réversible multi-split. Très bon conseil et pose parfaite.', 'Lille Gambetta', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', 'cc82e78a-b946-4428-be7f-f877ba558c33', 'Nicolas Delvoye', 'Entretien climatisation bureau professionnel. Service efficace et ponctuel.', 'Lambersart Centre', 4, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', 'Christine Dubois', 'Dépannage clim en urgence été. Intervention très rapide et réparation durable.', 'La Madeleine République', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', 'ab53a895-693a-442a-8831-a131b6a5fa0c', 'Laurent Delepierre', 'Installation système gainable discret. Résultat parfait et explications techniques claires.', 'Bondues Résidence', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', 'e817298c-4ad9-4364-b785-11c43385ef87', 'Patricia Delmotte', 'Maintenance préventive climatisation. Technicien compétent et conseils précieux.', 'Marcq Ville', 4, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '5d20eab4-98d6-42ba-ae93-7b57f3a9397b', 'Stéphane Delcourt', 'Installation clim gainable maison neuve. Travail discret et très professionnel.', 'Lomme Délivrance', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '41b391ea-988d-4bc5-8b65-7d17cb33565d', 'Murielle Delahaye', 'Réglage température climatisation. Amélioration notable du confort été et hiver.', 'Saint-André Rue Nationale', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Jean-Marc Delannoy', 'Dépannage climatisation commerce samedi. Service client remarquable et réactif.', 'Vieux-Lille Rue de la Monnaie', 4, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '4ea6f4b1-ab62-470d-a013-4cf8b0f3c344', 'Sophie Delcroix', 'Installation climatisation appartement étudiant. Très satisfaite des performances.', 'Villeneuve Cité', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '41e4c37b-0b72-4728-84be-71a7de25f678', 'Pierre Delattre', 'Entretien annuel climatisation restaurant. Service complet et tarif transparent.', 'Lille Wazemmes', 5, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', 'cc82e78a-b946-4428-be7f-f877ba558c33', 'Hélène Delfosse', 'Réparation climatisation en panne canicule. Diagnostic précis et réparation immédiate.', 'Lambersart Golf', 4, true),
('0ba6e0d2-17f3-4961-9e6f-8dbb9d455f40', '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', 'Michel Delaporte', 'Installation clim chambre enfant. Travail soigné et mise en service parfaite.', 'La Madeleine Écoles', 5, true),

-- Avis pour Pompe à chaleur (service_id: 5bbb80dd-9a2f-4a2c-b0dc-12176886d474)
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '41e4c37b-0b72-4728-84be-71a7de25f678', 'Dominique Vandenberghe', 'Installation PAC air-eau Daikin. Excellent travail et économies immédiates visibles.', 'Lille Moulins', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', 'cc82e78a-b946-4428-be7f-f877ba558c33', 'Catherine Delannoy', 'Entretien pompe à chaleur Atlantic. Service très professionnel et conseils utiles.', 'Lambersart Pacot', 4, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', 'Philippe Delamarche', 'Dépannage PAC défaillante hiver. Intervention rapide et réparation efficace.', 'La Madeleine Résidence', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', 'ab53a895-693a-442a-8831-a131b6a5fa0c', 'Monique Delcourt', 'Installation PAC géothermique grande maison. Résultat exceptionnel et très écologique.', 'Bondues Bois Blanc', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', 'e817298c-4ad9-4364-b785-11c43385ef87', 'Alain Delesalle', 'Maintenance annuelle PAC Mitsubishi. Technicien compétent et très méticuleux.', 'Marcq Croisé-Laroche', 4, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '5d20eab4-98d6-42ba-ae93-7b57f3a9397b', 'Christiane Delbarre', 'Réglage pompe à chaleur air-air. Amélioration notable des performances énergétiques.', 'Lomme Marais', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '41b391ea-988d-4bc5-8b65-7d17cb33565d', 'Bernard Delplanque', 'Installation PAC air-air tri-split. Très bon conseil et pose parfaite.', 'Saint-André Deûle', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Annie Delcroix', 'Dépannage urgent PAC période grand froid. Service réactif même conditions difficiles.', 'Vieux-Lille Rihour', 4, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '4ea6f4b1-ab62-470d-a013-4cf8b0f3c344', 'Régis Delannoy', 'Optimisation pompe à chaleur existante mauvais rendement. Amélioration significative.', 'Villeneuve Université', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '41e4c37b-0b72-4728-84be-71a7de25f678', 'Martine Delefortrie', 'Installation PAC avec production eau chaude sanitaire. Très satisfaite résultat.', 'Lille Bois Blancs', 5, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', 'cc82e78a-b946-4428-be7f-f877ba558c33', 'Jacques Delval', 'Entretien complet PAC Panasonic. Service professionnel et tarif très transparent.', 'Lambersart Canteleu', 4, true),
('5bbb80dd-9a2f-4a2c-b0dc-12176886d474', '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', 'Sylviane Delporte', 'Réparation PAC défaillante garantie. Diagnostic précis et réparation définitive durable.', 'La Madeleine Bd Jean-Baptiste Lebas', 5, true),

-- Avis pour Rénovation salle de bains (service_id: 48a41b25-8754-4ed0-a44a-85a358174394)
('48a41b25-8754-4ed0-a44a-85a358174394', '41e4c37b-0b72-4728-84be-71a7de25f678', 'Frédéric Delcroix', 'Rénovation complète salle de bain parentale. Travail exceptionnel et finitions parfaites.', 'Lille Fives', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', 'cc82e78a-b946-4428-be7f-f877ba558c33', 'Nathalie Delaporte', 'Transformation baignoire en douche senior. Résultat moderne et très fonctionnel.', 'Lambersart Bourg', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', 'Christian Delannoy', 'Rénovation salle d''eau PMR handicap. Adaptation parfaite et travail très soigné.', 'La Madeleine Centre Commercial', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', 'ab53a895-693a-442a-8831-a131b6a5fa0c', 'Véronique Delval', 'Installation douche italienne carrelage mosaïque. Très beau résultat et étanchéité parfaite.', 'Bondues Résidence Bois', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', 'e817298c-4ad9-4364-b785-11c43385ef87', 'Pascal Deleplanque', 'Rénovation salle de bain ancienne années 70. Transformation réussie et moderne.', 'Marcq Croix Blanche', 4, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '5d20eab4-98d6-42ba-ae93-7b57f3a9397b', 'Claudine Delcourt', 'Installation meuble vasque double sur mesure chêne. Travail artisan et conseils pertinents.', 'Lomme Mont-à-Camp', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '41b391ea-988d-4bc5-8b65-7d17cb33565d', 'Serge Delporte', 'Carrelage salle de bain grand format. Pose impeccable et choix matériaux excellent.', 'Saint-André Pont Neuf', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '7d96f406-7c7a-4673-b88b-c975cdcdcbd5', 'Marie-France Delannoy', 'Réfection complète salle d''eau appartement ancien. Délais respectés et qualité rendez-vous.', 'Vieux-Lille Rue Royale', 4, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '4ea6f4b1-ab62-470d-a013-4cf8b0f3c344', 'Thierry Delval', 'Modernisation salle de bain vintage carrelage époque. Mélange parfait ancien et moderne.', 'Villeneuve Résidence Universités', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '41e4c37b-0b72-4728-84be-71a7de25f678', 'Jocelyne Delamarche', 'Installation WC suspendu et meuble laqué. Optimisation espace très réussie.', 'Lille Saint-Sauveur', 5, true),
('48a41b25-8754-4ed0-a44a-85a358174394', 'cc82e78a-b946-4428-be7f-f877ba558c33', 'Daniel Delcroix', 'Rénovation salle de bain parentale avec baignoire îlot. Résultat luxueux et fonctionnel.', 'Lambersart Résidence Parc', 4, true),
('48a41b25-8754-4ed0-a44a-85a358174394', '4df6cbf7-a13c-4212-b0f6-c1cd609f962f', 'Sylvie Delaporte', 'Création salle d''eau dans combles aménagés. Défi technique relevé avec grand brio.', 'La Madeleine Résidence Fleurs', 5, true);