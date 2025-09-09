-- Update testimonials with enriched content for pompe-a-chaleur service in 6 cities
-- First, delete existing testimonials for these service+city combinations
DELETE FROM testimonials 
WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur')
  AND city_id IN (
    SELECT id FROM cities 
    WHERE slug IN ('marcq-en-baroeul', 'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme')
  );

-- Insert enriched testimonials
WITH testimonial_data AS (
  SELECT * FROM (VALUES
    ('Claire – Croisé-Laroche', 'Installation d''une PAC air/eau dans une maison familiale. Pose impeccable, bruit quasi inaudible. Explications claires sur l''entretien.', 5, 'Croisé-Laroche', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Yann – Bourg', 'Très satisfait du remplacement de notre vieille chaudière gaz par une PAC. Les radiateurs en fonte ont été conservés et optimisés.', 5, 'Bourg', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Sophie – Plouich', 'L''équipe est intervenue rapidement pour un dépannage en plein hiver. Réglage parfait, maison à nouveau confortable.', 5, 'Plouich', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Julien – Pont', 'Étude sérieuse avant travaux. Le technicien a simulé nos consommations et nous avons déjà constaté 40 % d''économies.', 5, 'Pont', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Mélanie – Rouges-Barres', 'Très bonne expérience. Dossier complet fourni pour le syndic, installation validée sans difficulté.', 5, 'Rouges-Barres', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Arnaud – Hippodrome', 'Entretien annuel réalisé avec soin. Le chauffagiste a pris le temps d''expliquer chaque réglage.', 5, 'Hippodrome', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Hélène – Montjoie', 'Installation d''une PAC dans une grande maison. Pose discrète dans le jardin, aucun bruit gênant. Service haut de gamme.', 5, 'Montjoie', 'pompe-a-chaleur', 'bondues'),
    ('Marc – Ravennes-les-Francs', 'Très professionnel. Équilibrage du réseau long parfaitement réalisé, confort retrouvé dans toute la maison.', 5, 'Ravennes-les-Francs', 'pompe-a-chaleur', 'bondues'),
    ('Camille – Centre', 'Devis précis, délais respectés. Les techniciens ont tout nettoyé avant de partir, chantier impeccable.', 5, 'Centre', 'pompe-a-chaleur', 'bondues'),
    ('Damien – Vertu-Couture', 'Remplacement d''une chaudière fioul par une PAC hybride. Les conseils étaient pertinents et adaptés à notre maison.', 5, 'Vertu-Couture', 'pompe-a-chaleur', 'bondues'),
    ('Anne – Campagne', 'Super intervention pour l''entretien. Explications claires, facture maîtrisée. Je recommande.', 5, 'Secteur campagne', 'pompe-a-chaleur', 'bondues'),
    ('Louis – Proche golf', 'PAC installée en 2 jours, mise en service immédiate. L''équipe a même aidé à constituer le dossier MaPrimeRénov''.', 5, 'Proche golf', 'pompe-a-chaleur', 'bondues'),
    ('Maud – Saint-Maur', 'PAC air/air installée dans notre appartement. Compacte et silencieuse, c''est parfait pour la copropriété.', 5, 'Saint-Maur', 'pompe-a-chaleur', 'la-madeleine'),
    ('Olivier – Botanique', 'Le dossier fourni au syndic était complet. L''AG a validé sans discussion. Installation en 48h.', 5, 'Botanique', 'pompe-a-chaleur', 'la-madeleine'),
    ('Sarah – Centre', 'Travail sérieux et équipe agréable. La consommation a baissé dès les premières semaines.', 5, 'Centre', 'pompe-a-chaleur', 'la-madeleine'),
    ('Thomas – Berkem', 'Installation propre et soignée, malgré un accès étroit. Le chantier a été terminé dans les temps.', 5, 'Berkem', 'pompe-a-chaleur', 'la-madeleine'),
    ('Élise – Romarin', 'Dépannage rapide un samedi, réparation définitive le lundi. Service client réactif et efficace.', 5, 'Romarin', 'pompe-a-chaleur', 'la-madeleine'),
    ('Youssef – Limite Marcq', 'Remplacement chaudière → PAC. Bons conseils, suivi après travaux, rien à redire.', 5, 'Limite Marcq', 'pompe-a-chaleur', 'la-madeleine'),
    ('Aurélie – Canteleu', 'Très contente de la pose. Les techniciens ont respecté la maison et trouvé une implantation discrète.', 5, 'Canteleu', 'pompe-a-chaleur', 'lambersart'),
    ('Bastien – Pacot-Vandracq', 'PAC installée avec désembouage complet du réseau. Radiateurs à nouveau efficaces.', 5, 'Pacot-Vandracq', 'pompe-a-chaleur', 'lambersart'),
    ('Léa – Champ-de-Courses', 'Excellente expérience. Installation rapide et conforme, confort immédiat.', 5, 'Champ-de-Courses', 'pompe-a-chaleur', 'lambersart'),
    ('Samuel – Bourg', 'Entretien annuel bien réalisé. Attestation fournie dans la foulée, équipe ponctuelle.', 5, 'Bourg', 'pompe-a-chaleur', 'lambersart'),
    ('Nora – Proche Saint-André', 'Panne en plein hiver, sécurisation immédiate puis réparation définitive. Très pro.', 5, 'Limite Saint-André', 'pompe-a-chaleur', 'lambersart'),
    ('Cyril – Avenue de Dunkerque', 'Travail soigné, communication claire, devis respecté.', 5, 'Avenue de Dunkerque', 'pompe-a-chaleur', 'lambersart'),
    ('Coralie – Centre', 'Installation PAC air/eau dans notre maison mitoyenne. Le confort est incomparable.', 5, 'Centre', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Vincent – Sainte-Hélène', 'Les techniciens ont pris le temps d''expliquer le fonctionnement et les réglages. Je recommande.', 5, 'Sainte-Hélène', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Amandine – Bords de Deûle', 'Pose soignée en cour arrière. L''unité est discrète et silencieuse, aucun souci avec les voisins.', 5, 'Bords de Deûle', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Jules – Proche gare', 'Entretien complet, diagnostic précis. On sent le sérieux de l''équipe.', 5, 'Proche gare', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Nadia – Secteur canal', 'Dépannage un week-end, réparation définitive le lundi. Très réactifs.', 5, 'Secteur canal', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Thierry – Limite La Madeleine', 'Chantier nickel, communication claire. Je recommande sans hésiter.', 5, 'Limite La Madeleine', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Amélie – Délivrance', 'PAC posée dans un pavillon. Bruit faible, consommation déjà en baisse. Pose rapide et propre.', 5, 'Délivrance', 'pompe-a-chaleur', 'lomme'),
    ('Gauthier – Bourg', 'Remplacement de chaudière. Simulation réaliste, devis respecté. Très satisfait.', 5, 'Bourg', 'pompe-a-chaleur', 'lomme'),
    ('Lina – Mitterie', 'Installation PAC + ballon ECS. Tout fonctionne parfaitement, confort immédiat.', 5, 'Mitterie', 'pompe-a-chaleur', 'lomme'),
    ('Farid – Mont-à-Camp', 'Entretien annuel impeccable, avec conseils pour réduire la conso.', 5, 'Mont-à-Camp', 'pompe-a-chaleur', 'lomme'),
    ('Nolwenn – Lomme-Campus', 'Panne un soir, dépannage provisoire assuré rapidement, puis réparation définitive. Très pros.', 5, 'Lomme-Campus', 'pompe-a-chaleur', 'lomme'),
    ('Cédric – Limite Loos', 'Installation conforme, délais respectés, équipe souriante et efficace.', 5, 'Limite Loos', 'pompe-a-chaleur', 'lomme')
  ) AS t(author_name, content, rating, location, service_slug, city_slug)
)
INSERT INTO testimonials (
  author_name, 
  content, 
  rating, 
  location, 
  service_id, 
  city_id, 
  published,
  created_at,
  updated_at
)
SELECT 
  td.author_name,
  td.content,
  td.rating,
  td.location,
  s.id as service_id,
  c.id as city_id,
  true as published,
  now() as created_at,
  now() as updated_at
FROM testimonial_data td
JOIN services s ON s.slug = td.service_slug
JOIN cities c ON c.slug = td.city_slug;