-- Ajouter les témoignages pour serrurier
INSERT INTO testimonials (service_id, city_id, author_name, location, rating, content, published) VALUES

-- Lille
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), 'Claire – Vieux-Lille', 'Vieux-Lille', 5, 'Clés oubliées à l''intérieur, ouverture rapide et sans dommage sur la serrure.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), 'Karim – Wazemmes', 'Wazemmes', 5, 'Perte de clés en soirée, serrurier arrivé en 35 minutes. Service impeccable.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), 'Sophie – Centre', 'Centre', 5, 'Changement de cylindre multipoints effectué le jour même. Très professionnel.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), 'Antoine – Fives', 'Fives', 5, 'Effraction sécurisée dans l''heure, devis assurance remis immédiatement.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), 'Mélanie – Vauban', 'Vauban-Esquermes', 5, 'Pose de serrure haute sécurité. Travail propre et rapide.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), 'Yassine – Hellemmes', 'Hellemmes', 5, 'Ouverture de porte claquée en urgence. Intervention efficace et prix clair.', true),

-- Vieux-Lille
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), 'Nadia – Rue Royale', 'Rue Royale', 5, 'Ouverture de porte ancienne sans casse. Respect du bâti, travail discret.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), 'Julien – Rue de Gand', 'Rue de Gand', 5, 'Changement de cylindre sécurisé après perte de clés. Très satisfait.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), 'Pauline – Place du Concert', 'Place du Concert', 5, 'Intervention rapide en copropriété, communication fluide avec le syndic.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), 'Marc – Rue Basse', 'Rue Basse', 5, 'Blindage discret posé sur porte ancienne. Finitions impeccables.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), 'Amélie – Rue Esquermoise', 'Rue Esquermoise', 5, 'Dépannage un dimanche soir, délais respectés. Merci pour le professionnalisme.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), 'Hugo – Cours intérieures', 'Cours intérieures', 5, 'Ouverture fine sur serrure bloquée, résultat parfait.', true),

-- Villeneuve-d'Ascq
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), 'Camille – Annappes', 'Annappes', 5, 'Ouverture de porte claquée dans résidence étudiante. Dépannage rapide.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), 'Rachid – Brigode', 'Brigode', 5, 'Changement de serrure multipoints. Équipe ponctuelle et sérieuse.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), 'Élodie – Flers-Bourg', 'Flers-Bourg', 5, 'Réparation après effraction, porte consolidée efficacement.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), 'Maxime – Triolo', 'Triolo', 5, 'Pose d''un cylindre haute sécurité, service rapide.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), 'Isabelle – Hôtel de Ville', 'Hôtel de Ville', 5, 'Blindage de porte réalisé en copropriété. Travail très propre.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), 'Benoît – Campus', 'Campus', 5, 'Dépannage en pleine nuit. Très réactif.', true),

-- Marcq-en-Barœul
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), 'Sophie – Croisé-Laroche', 'Croisé-Laroche', 5, 'Ouverture rapide de porte, serrurier arrivé en 25 minutes.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), 'Thomas – Bourg', 'Bourg', 5, 'Installation d''une serrure A2P multipoints. Conseils utiles.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), 'Claire – Plouich', 'Plouich', 5, 'Blindage posé proprement, finitions premium.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), 'Nicolas – Hippodrome', 'Hippodrome', 5, 'Intervention après cambriolage, sécurisation immédiate.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), 'Julie – Rouges-Barres', 'Rouges-Barres', 5, 'Changement rapide de barillet européen, devis clair.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), 'Adrien – Pont', 'Pont', 5, 'Pose de porte blindée, installation soignée et garantie incluse.', true),

-- Bondues
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), 'Manon – Montjoie', 'Montjoie', 5, 'Blindage haut de gamme sur porte d''entrée. Finitions parfaites.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), 'Alexandre – Ravennes-les-Francs', 'Ravennes-les-Francs', 5, 'Ouverture de porte soignée, sans casse. Très satisfait.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), 'Laura – Centre', 'Centre', 5, 'Remplacement de cylindre haute sécurité. Conseils utiles.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), 'David – Vertu-Couture', 'Vertu-Couture', 5, 'Intervention après cambriolage, sécurisation rapide.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), 'Émilie – Secteur golf', 'Secteur golf', 5, 'Pose de serrure multipoints A2P. Résultat impeccable.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), 'Olivier – Campagne', 'Secteur campagne', 5, 'Audit sécurité complet, solutions adaptées à ma maison.', true),

-- La Madeleine
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), 'Clara – Saint-Maur', 'Saint-Maur', 5, 'Ouverture de porte en copropriété, intervention discrète.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), 'Julien – Botanique', 'Botanique', 5, 'Pose d''un cylindre haute sécurité, travail rapide et soigné.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), 'Valérie – Centre', 'Centre', 5, 'Réparation après cambriolage, sécurisation efficace.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), 'Nathalie – Berkem', 'Berkem', 5, 'Blindage posé proprement, conforme aux attentes.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), 'Antoine – Romarin', 'Romarin', 5, 'Ouverture en urgence un samedi, équipe réactive.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), 'Sébastien – Limite Marcq', 'Limite Marcq', 5, 'Installation de serrure multipoints, prestation impeccable.', true),

-- Lambersart
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Sophie – Canteleu', 'Canteleu', 5, 'Pose d''un blindage discret, respect du style de la maison.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Olivier – Pacot-Vandracq', 'Pacot-Vandracq', 5, 'Changement de serrure multipoints A2P. Très satisfait.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Hélène – Champ-de-Courses', 'Champ-de-Courses', 5, 'Ouverture rapide d''une porte bloquée. Intervention efficace.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Bastien – Bourg', 'Bourg', 5, 'Réparation après effraction. Porte consolidée et devis remis.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Caroline – Avenue de Dunkerque', 'Avenue de Dunkerque', 5, 'Installation de porte blindée, finitions haut de gamme.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), 'Lucas – Limite Saint-André', 'Limite Saint-André', 5, 'Audit sécurité et conseils adaptés. Très pro.', true),

-- Saint-André-lez-Lille
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Élodie – Centre', 'Centre', 5, 'Ouverture rapide après perte de clés. Intervention dans les délais.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Damien – Sainte-Hélène', 'Sainte-Hélène', 5, 'Remplacement de cylindre, devis clair et respecté.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Clément – Bords de Deûle', 'Bords de Deûle', 5, 'Sécurisation après cambriolage, équipe très réactive.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Anne – Proche gare', 'Proche gare', 5, 'Pose de serrure multipoints en maison mitoyenne. Finitions propres.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Mathilde – Secteur canal', 'Secteur canal', 5, 'Blindage de porte installé en une journée. Excellent rendu.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), 'Vincent – Limite Lambersart', 'Limite Lambersart', 5, 'Ouverture de porte claquée, intervention soignée.', true),

-- Lomme
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), 'Hugo – Délivrance', 'Délivrance', 5, 'Ouverture rapide d''une porte claquée, serrurier ponctuel.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), 'Camille – Bourg', 'Bourg', 5, 'Changement de serrure multipoints. Devis transparent.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), 'Sébastien – Mitterie', 'Mitterie', 5, 'Réparation après effraction, sécurisation immédiate.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), 'Aurélie – Mont-à-Camp', 'Mont-à-Camp', 5, 'Pose d''un blindage complet. Très beau travail.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), 'Yann – Lomme-Campus', 'Lomme-Campus', 5, 'Ouverture en résidence étudiante. Service rapide et efficace.', true),
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), 'Sarah – Limite Loos', 'Limite Loos', 5, 'Changement de cylindre haute sécurité. Très satisfaite.', true);