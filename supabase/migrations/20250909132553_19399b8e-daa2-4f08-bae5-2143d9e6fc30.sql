-- Ajouter le service serrurier
INSERT INTO services (name, slug, description, published) 
VALUES ('Serrurier', 'serrurier', 'Ouverture de porte, changement de serrures, blindage et sécurisation', true)
ON CONFLICT (slug) DO NOTHING;

-- Ajouter les pages service-ville pour serrurier
INSERT INTO service_city_pages (
  service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description, zones_text, cta_title, cta_subtitle, published_at
) VALUES 
-- Lille
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lille'), true, 
'Serrurier Lille (ouverture de porte, changement de serrure) | Mon p''tit Dépanneur',
'Serrurier à Lille : ouverture de porte sans casse, changement de cylindre/barillet, serrures multipoints, sécurisation, blindage, dépannage 7j/7, devis clair, agréé assurances.',
'Serrurier Lille (ouverture de porte, changement de serrure)',
'Dépannage serrurier rapide à Lille, 7j/7.',
'Ouverture de porte, remplacement de serrures (cylindres européens, multipoints), réparation après effraction, pose de verrous et blindage de portes. Intervention dans tout Lille avec devis transparent et pièces certifiées.',
'Lille : Vieux-Lille, Centre, Vauban-Esquermes, Wazemmes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Moulins, Hellemmes, Lomme. Villes proches : La Madeleine, Lambersart, Mons-en-Barœul, Loos.',
'Besoin d''un serrurier à Lille ?',
'Intervention rapide, devis transparent, agréé assurances.',
'2025-09-09T09:00:00Z'),

-- Vieux-Lille
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true,
'Serrurier Vieux-Lille (portes anciennes, copro) | Mon p''tit Dépanneur',
'Serrurier au Vieux-Lille : ouverture de porte discrète, respect du bâti ancien, changement de cylindres sécurisés, gestion accès copro, dépannage 7j/7.',
'Serrurier Vieux-Lille (portes anciennes, copro)',
'Ouverture fine et finitions propres en immeuble ancien.',
'Techniques d''ouverture non destructives privilégiées, remplacement de cylindres compatibles portes anciennes, renforts discrets, gestion badges/digicodes et autorisations de copropriété.',
'Vieux-Lille : rues Esquermoise, Royale, Basse, de Gand, place du Concert, cours intérieures et immeubles anciens.',
'Un serrurier discret au Vieux-Lille ?',
'Ouverture sans casse, finitions soignées en copro.',
'2025-09-09T09:00:00Z'),

-- Villeneuve-d'Ascq
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true,
'Serrurier Villeneuve-d''Ascq (maisons & résidences) | Mon p''tit Dépanneur',
'Serrurier à Villeneuve-d''Ascq : ouverture de porte, remplacement de serrures, sécurisation multipoints, accès résidences étudiantes, dépannage 7j/7.',
'Serrurier Villeneuve-d''Ascq (maisons & résidences)',
'Interventions rapides pour familles et étudiants.',
'Ouverture de porte toutes marques, remplacement de cylindres, pose de serrures multipoints/anti-effraction, renforts de paumelles et cornières. Intervention Annappes, Brigode, Flers-Bourg, Triolo.',
'Villeneuve-d''Ascq : Annappes, Brigode, Flers-Bourg, Triolo, Hôtel de Ville, campus et résidences étudiantes. Voisines : Wasquehal, Lezennes, Hellemmes.',
'Besoin d''un serrurier à Villeneuve-d''Ascq ?',
'Devis immédiat et pièces certifiées.',
'2025-09-09T09:00:00Z'),

-- Marcq-en-Barœul
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true,
'Serrurier Marcq-en-Barœul (multipoints, blindage) | Mon p''tit Dépanneur',
'Serrurier à Marcq : ouverture de porte, changements de serrures multipoints, blindage/porte blindée, réparation après effraction, dépannage 7j/7.',
'Serrurier Marcq-en-Barœul (multipoints, blindage)',
'Sécurité et finitions au Croisé-Laroche, Bourg, Plouich.',
'Ouverture fine, remplacement de barillets européens, pose de serrures A2P, renforts de huisseries, blindage et portes blindées sur mesure. Assistance assurances après effraction.',
'Marcq-en-Barœul : Croisé-Laroche, Bourg, Plouich, Pont, Rouges-Barres, Hippodrome. Proches : Wasquehal, La Madeleine, Lille.',
'Votre serrurier à Marcq ?',
'Intervention soignée, solutions A2P testées.',
'2025-09-09T09:00:00Z'),

-- Bondues
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'bondues'), true,
'Serrurier Bondues (sécurisation haut de gamme) | Mon p''tit Dépanneur',
'Serrurier à Bondues : ouverture de porte, serrures multipoints A2P, cylindres haute sécurité, blindage de porte, sécurisation de propriétés et dépendances.',
'Serrurier Bondues (sécurisation haut de gamme)',
'Solutions robustes et discrètes pour grandes maisons.',
'Ouverture sans casse, cylindres anti-crochetage/anti-perçage, serrures 3/5 points, blindage, contrôles d''accès pour dépendances/bureaux. Conseil sécurité personnalisé.',
'Bondues : Montjoie, Ravennes-les-Francs, centre, Vertu-Couture, secteurs de campagne, proche golf. Voisines : Mouvaux, Wambrechies.',
'Un serrurier fiable à Bondues ?',
'Audit sécurité et installation premium.',
'2025-09-09T09:00:00Z'),

-- La Madeleine
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true,
'Serrurier La Madeleine (copro & maisons) | Mon p''tit Dépanneur',
'Serrurier à La Madeleine : ouverture de porte, changement de cylindre, serrures multipoints, gestion copro (Saint-Maur, Botanique), dépannage 7j/7.',
'Serrurier La Madeleine (copro & maisons)',
'Ouverture discrète et gestion syndic simplifiée.',
'Ouverture sans casse quand possible, remplacement rapide de barillets, mise à niveau multipoints, renforcement huisseries et conseils copro (badges, VIGIK, digicodes).',
'La Madeleine : Saint-Maur, Botanique, centre-ville, Berkem, Romarin ; proximité Euralille, Marcq, Saint-André.',
'Besoin d''un serrurier à La Madeleine ?',
'Devis clair, intervention rapide et propre.',
'2025-09-09T09:00:00Z'),

-- Lambersart
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lambersart'), true,
'Serrurier Lambersart (ouverture, multipoints, blindage) | Mon p''tit Dépanneur',
'Serrurier à Lambersart : ouverture de porte, changement de serrures, multipoints A2P, blindage discret pour maisons bourgeoises/pavillons.',
'Serrurier Lambersart (ouverture, multipoints, blindage)',
'Interventions propres, respect du bâti.',
'Ouverture fine, pose de cylindres sécurisés, serrures multipoints, cornières anti-pinces, blindage avec finitions soignées. Conseils esthétique/sécurité.',
'Lambersart : Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg ; proches Saint-André, La Madeleine, Lille.',
'Un serrurier à Lambersart ?',
'Sécurisation élégante, finitions premium.',
'2025-09-09T09:00:00Z'),

-- Saint-André-lez-Lille
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true,
'Serrurier Saint-André-lez-Lille (maisons mitoyennes) | Mon p''tit Dépanneur',
'Serrurier à Saint-André : ouverture, remplacement de serrures, renforts anti-effraction, réparation après cambriolage, dépannage 7j/7.',
'Serrurier Saint-André-lez-Lille (maisons mitoyennes)',
'Dépannage rapide et sécurisation durable.',
'Ouverture de porte, changement de barillets, serrures multipoints, renforts de paumelles/cornières, remise en sécurité après effraction avec devis pour assurances.',
'Saint-André-lez-Lille : centre, Sainte-Hélène, bords de Deûle, proche gare ; limites Lambersart, La Madeleine.',
'Besoin d''un serrurier à Saint-André ?',
'Sécurisation immédiate et devis assurances.',
'2025-09-09T09:00:00Z'),

-- Lomme
((SELECT id FROM services WHERE slug = 'serrurier'), (SELECT id FROM cities WHERE slug = 'lomme'), true,
'Serrurier Lomme (ouverture de porte, barillet) | Mon p''tit Dépanneur',
'Serrurier à Lomme : ouverture de porte, changement de barillet, serrures multipoints, réparation après effraction, intervention quartiers Délivrance, Bourg, Mitterie, Mont-à-Camp.',
'Serrurier Lomme (ouverture de porte, barillet)',
'Interventions locales rapides dans tous les quartiers.',
'Ouverture sans casse quand possible, remplacement de cylindres, mise à niveau multipoints, renforts et réglages de portes. Devis clair, SAV réactif.',
'Lomme : Délivrance, Bourg, Mitterie, Mont-à-Camp, Lomme-Campus. Voisines : Loos, Lambersart, Lille.',
'Un serrurier à Lomme ?',
'Déplacement rapide, prix nets, pièces garanties.',
'2025-09-09T09:00:00Z')

ON CONFLICT (service_id, city_id) DO NOTHING;