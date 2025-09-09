-- Mise à jour des articles de blog pour le service chauffagiste avec le bon tag
UPDATE blog_posts 
SET excerpt = 'Des conseils pratiques pour optimiser votre système de chauffage et réduire vos factures énergétiques.'
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND title LIKE '%Comment réduire sa facture de chauffage%';

UPDATE blog_posts 
SET excerpt = 'Découvrez les avantages des chaudières à condensation et les économies qu''elles permettent de réaliser.'
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND title LIKE '%Chaudière gaz à condensation%';

UPDATE blog_posts 
SET excerpt = 'Les signes qui indiquent qu''il est temps de remplacer votre ancienne chaudière à Lille.'
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND title LIKE '%Quand faut-il remplacer%';

UPDATE blog_posts 
SET excerpt = 'Tout ce que vous devez savoir sur l''entretien obligatoire de votre chaudière en France.'
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND title LIKE '%Entretien annuel de chaudière%';

UPDATE blog_posts 
SET excerpt = 'Diagnostiquer et résoudre les problèmes de radiateurs qui chauffent mal.'
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND title LIKE '%Radiateurs qui chauffent mal%';

UPDATE blog_posts 
SET excerpt = 'Pourquoi et comment effectuer un désembouage de vos circuits de chauffage.'
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND title LIKE '%Désembouage des circuits%';

-- Supprimer l'ancien témoignage et ajouter les nouveaux
DELETE FROM testimonials 
WHERE service_id = (SELECT id FROM services WHERE slug = 'chauffagiste') 
AND city_id = (SELECT id FROM cities WHERE slug = 'lille');

-- Ajouter tous les nouveaux témoignages
INSERT INTO testimonials (author_name, location, content, rating, service_id, city_id) VALUES
('Clara', 'Wazemmes', 'Ma chaudière est tombée en panne en plein hiver. Le chauffagiste est arrivé en moins de 2 heures et a réussi à la relancer le jour même. Service rapide et rassurant, prix annoncé à l''avance, aucune mauvaise surprise.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Antoine', 'Vauban', 'Intervention très sérieuse : purge des radiateurs, désembouage complet du circuit et réglages précis. Ma consommation a baissé de 15 % depuis. Le technicien a pris le temps d''expliquer chaque étape.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Sophie', 'Vieux-Lille', 'J''avais une vieille chaudière gaz dans un appartement ancien. Le chauffagiste m''a conseillé un modèle à condensation compact, parfaitement adapté. Installation propre, finitions soignées, et tout fonctionne à merveille.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Youssef', 'Hellemmes', 'Entretien annuel fait avec rigueur : nettoyage complet, test de combustion et conseils pour mieux régler mon thermostat. Attestation fournie immédiatement, ça met en confiance.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Marc', 'Fives', 'Canalisations de chauffage complètement bouchées dans mon immeuble étudiant. L''équipe est intervenue avec une caméra pour trouver le problème. Résultat impeccable, écoulement rétabli sans casser le mur.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Élise', 'Bois-Blancs', 'Très satisfaite ! J''ai eu un souci de fuite sur une vieille chaudière fioul. Le chauffagiste a sécurisé l''installation immédiatement et m''a proposé un devis clair pour une solution durable.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Thomas', 'Saint-Maurice Pellevoisin', 'Je craignais une intervention compliquée à cause de l''accès étroit dans ma cave, mais le remplacement du ballon s''est fait rapidement. Tout a été nettoyé avant leur départ, travail soigné.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille')),
('Julie', 'Centre de Lille', 'Chaudière neuve posée dans mon appartement. Le chauffagiste a tout expliqué : entretien, réglages, économies d''énergie. Le service client est disponible et réactif. Je recommande sans hésiter.', 5, (SELECT id FROM services WHERE slug = 'chauffagiste'), (SELECT id FROM cities WHERE slug = 'lille'));