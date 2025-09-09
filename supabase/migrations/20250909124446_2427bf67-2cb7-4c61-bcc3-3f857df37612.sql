-- Add testimonials for renovation-salle-de-bain service
INSERT INTO testimonials (author_name, content, rating, location, service_id, city_id, published)
VALUES
  -- Lille testimonials
  ('Sophie – Vieux-Lille', 'Rénovation complète avec douche italienne et carrelage métro blanc. Travail soigné et délais respectés.', 5, 'Vieux-Lille', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lille'), true),
  ('Julien – Wazemmes', 'Transformation d''une petite salle de bains en combiné baignoire-douche. Résultat très fonctionnel.', 5, 'Wazemmes', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lille'), true),
  ('Amélie – Centre', 'Très satisfaite du projet clé en main. Les plans 3D étaient conformes au résultat final.', 5, 'Centre', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lille'), true),
  ('Karim – Fives', 'Chantier bien organisé, plomberie et électricité aux normes. Bonne communication avec l''équipe.', 5, 'Fives', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lille'), true),
  ('Claire – Vauban', 'Pose d''une baignoire balnéo et de meubles suspendus. Finitions haut de gamme.', 5, 'Vauban-Esquermes', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lille'), true),
  ('Marc – Hellemmes', 'Adaptation PMR réussie pour ma mère. Douche sécurisée et pratique.', 5, 'Hellemmes', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lille'), true),

  -- Vieux-Lille testimonials
  ('Élodie – Rue Royale', 'Petite salle de bains transformée avec douche italienne compacte et carrelage moderne. Très satisfait du résultat.', 5, 'Rue Royale', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true),
  ('Damien – Place du Concert', 'Optimisation parfaite d''un espace réduit. L''équipe a respecté le cachet de l''appartement ancien.', 5, 'Place du Concert', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true),
  ('Sarah – Rue Basse', 'Rénovation avec baignoire compacte et mobilier suspendu. Chantier rapide et propre.', 5, 'Rue Basse', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true),
  ('Paul – Esquermoise', 'Très bon accompagnement design, rendu fidèle aux plans 3D proposés.', 5, 'Rue Esquermoise', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true),
  ('Nadia – Rue de Gand', 'Installation d''une douche italienne sécurisée. Respect des normes PMR pour ma mère.', 5, 'Rue de Gand', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true),
  ('Benoît – Rue Saint-Sébastien', 'Bonne communication avec l''équipe, finitions propres, délais respectés.', 5, 'Rue Saint-Sébastien', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'vieux-lille'), true),

  -- Villeneuve-d'Ascq testimonials
  ('Amandine – Flers-Bourg', 'Transformation totale avec douche italienne et meubles modernes. Travail soigné.', 5, 'Flers-Bourg', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true),
  ('Hugo – Triolo', 'Rénovation rapide pour un appartement étudiant. Douche compacte bien posée.', 5, 'Triolo', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true),
  ('Karine – Brigode', 'Très belle réalisation avec baignoire familiale et carrelage grand format.', 5, 'Brigode', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true),
  ('Antoine – Annappes', 'L''équipe a été réactive, devis clair et respecté. Résultat impeccable.', 5, 'Annappes', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true),
  ('Lucie – Hôtel de Ville', 'Aménagement optimisé d''une petite salle de bains, tout est fonctionnel.', 5, 'Hôtel de Ville', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true),
  ('David – Pont-de-Bois', 'Rénovation PMR réussie avec douche sécurisée. Grande satisfaction.', 5, 'Pont-de-Bois', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq'), true),

  -- Marcq-en-Barœul testimonials
  ('Clémence – Croisé-Laroche', 'Douche italienne spacieuse et carrelage design. Chantier haut de gamme.', 5, 'Croisé-Laroche', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true),
  ('Jérôme – Bourg', 'Pose d''une baignoire balnéo, finitions premium. Équipe professionnelle.', 5, 'Bourg', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true),
  ('Inès – Plouich', 'Optimisation d''un espace étroit, rendu esthétique et pratique.', 5, 'Plouich', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true),
  ('Martin – Rouges-Barres', 'Travail sérieux et délais tenus. Bon suivi du chef de chantier.', 5, 'Rouges-Barres', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true),
  ('Camille – Pont', 'Carrelage grand format parfaitement posé. Résultat haut de gamme.', 5, 'Pont', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true),
  ('Florence – Hippodrome', 'Rénovation complète avec double vasque et éclairage LED. Très satisfaite.', 5, 'Hippodrome', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'marcq-en-baroeul'), true),

  -- Bondues testimonials
  ('Manon – Montjoie', 'Grande salle de bains rénovée avec baignoire îlot. Pose parfaite.', 5, 'Montjoie', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'bondues'), true),
  ('Guillaume – Ravennes-les-Francs', 'Chantier haut de gamme, douche italienne XXL avec finitions soignées.', 5, 'Ravennes-les-Francs', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'bondues'), true),
  ('Isabelle – Vertu-Couture', 'Pose rapide et matériaux premium. Résultat fidèle aux attentes.', 5, 'Vertu-Couture', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'bondues'), true),
  ('Jean – Centre', 'Superbe réalisation avec carrelage marbre et meubles sur mesure.', 5, 'Centre', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'bondues'), true),
  ('Laura – Proche golf', 'Équipe sérieuse, salle de bains balnéo installée en 10 jours.', 5, 'Proche golf', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'bondues'), true),
  ('Mathieu – Campagne', 'Adaptation PMR réussie, douche sécurisée et confortable.', 5, 'Secteur campagne', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'bondues'), true),

  -- La Madeleine testimonials
  ('Mélanie – Saint-Maur', 'Rénovation avec douche gain de place. Pose discrète, respect de la copropriété.', 5, 'Saint-Maur', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true),
  ('Damien – Botanique', 'Optimisation parfaite d''un petit appartement. Résultat moderne et pratique.', 5, 'Botanique', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true),
  ('Claire – Centre', 'Travaux rapides et propres, belle finition du carrelage.', 5, 'Centre', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true),
  ('Alexandre – Berkem', 'Pose d''une baignoire compacte. Bonne organisation du chantier.', 5, 'Berkem', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true),
  ('Nora – Romarin', 'Rénovation complète avec mobilier suspendu et éclairage LED. Excellent rendu.', 5, 'Romarin', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true),
  ('Yassine – Limite Marcq', 'Travaux respectés, devis clair. Salle de bains moderne et fonctionnelle.', 5, 'Limite Marcq', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'la-madeleine'), true),

  -- Lambersart testimonials
  ('Sabrina – Canteleu', 'Transformation réussie d''une salle de bains ancienne. Douche italienne élégante.', 5, 'Canteleu', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lambersart'), true),
  ('Philippe – Pacot-Vandracq', 'Pose d''une baignoire îlot. Superbe résultat dans une maison bourgeoise.', 5, 'Pacot-Vandracq', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lambersart'), true),
  ('Julie – Champ-de-Courses', 'Chantier haut de gamme avec matériaux nobles. Équipe à l''écoute.', 5, 'Champ-de-Courses', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lambersart'), true),
  ('Bastien – Bourg', 'Installation rapide, finitions soignées. Bon suivi du chef de chantier.', 5, 'Bourg', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lambersart'), true),
  ('Aurore – Avenue de Dunkerque', 'Douche italienne posée avec précision. Aucun défaut visible.', 5, 'Avenue de Dunkerque', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lambersart'), true),
  ('Thomas – Limite Saint-André', 'Projet clé en main respecté. Très satisfait de la communication.', 5, 'Limite Saint-André', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lambersart'), true),

  -- Saint-André-lez-Lille testimonials
  ('Pauline – Centre', 'Petite salle de bains transformée avec douche pratique. Pose rapide.', 5, 'Centre', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true),
  ('Adrien – Sainte-Hélène', 'Très bonne expérience. Mobilier adapté, finitions soignées.', 5, 'Sainte-Hélène', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true),
  ('Sophie – Bords de Deûle', 'Douche italienne sécurisée avec barres. Respect des normes PMR.', 5, 'Bords de Deûle', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true),
  ('Olivier – Proche gare', 'Rénovation complète, délais respectés. Super équipe.', 5, 'Proche gare', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true),
  ('Nathalie – Secteur canal', 'Pose soignée, bonne gestion des nuisances. Résultat impeccable.', 5, 'Secteur canal', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true),
  ('Hervé – Limite Lambersart', 'Très satisfait du projet. Salle de bains moderne et élégante.', 5, 'Limite Lambersart', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'saint-andre-lez-lille'), true),

  -- Lomme testimonials
  ('Clara – Délivrance', 'Rénovation avec douche italienne moderne et meubles pratiques.', 5, 'Délivrance', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lomme'), true),
  ('Antoine – Bourg', 'Chantier bien mené, carrelage et finitions réussis.', 5, 'Bourg', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lomme'), true),
  ('Laetitia – Mitterie', 'Pose d''une baignoire familiale. Résultat fidèle au devis.', 5, 'Mitterie', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lomme'), true),
  ('Yohan – Mont-à-Camp', 'Transformation complète, délais respectés et suivi impeccable.', 5, 'Mont-à-Camp', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lomme'), true),
  ('Aline – Lomme-Campus', 'Optimisation d''un petit espace, mobilier suspendu et éclairage LED.', 5, 'Lomme-Campus', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lomme'), true),
  ('Stéphane – Limite Loos', 'Rénovation réussie avec adaptation PMR pour mes parents. Douche sécurisée.', 5, 'Limite Loos', (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain'), (SELECT id FROM cities WHERE slug = 'lomme'), true);