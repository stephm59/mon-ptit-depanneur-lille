-- Import testimonials for pompe-a-chaleur service in 6 cities
-- First, delete any existing testimonials for these service+city combinations
DELETE FROM testimonials 
WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur')
  AND city_id IN (
    SELECT id FROM cities 
    WHERE slug IN ('marcq-en-baroeul', 'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme')
  );

-- Insert testimonials from CSV data
WITH testimonial_data AS (
  SELECT * FROM (VALUES
    ('Hélène – Croisé-Laroche', 'Remplacement chaudière par PAC air/eau. Pose propre, bruit discret, conso en baisse.', 5, 'Croisé-Laroche', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Antoine – Bourg', 'Étude sérieuse, radiateurs conservés, confort OK en hiver. Réglages bien expliqués.', 5, 'Bourg', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Maya – Plouich', 'Contrat d''entretien clair : régulation ajustée, contrôle étanchéité. Très pro.', 5, 'Plouich', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Yanis – Pont', 'Dépannage en période de givre : cycle corrigé, sonde repositionnée.', 5, 'Pont', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Claire – Rouges-Barres', 'PAC + ballon ECS posés, délais tenus, doc syndic fournie.', 5, 'Rouges-Barres', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Louis – prox. Hippodrome', 'Désembouage + équilibrage : radiateurs homogènes, PAC plus silencieuse.', 5, 'Hippodrome', 'pompe-a-chaleur', 'marcq-en-baroeul'),
    ('Blandine – Montjoie', 'Pose propre, mise en service soignée. Très rassurants.', 5, 'Montjoie', 'pompe-a-chaleur', 'bondues'),
    ('Xavier – Ravennes-les-Francs', 'Optimisation d''un grand réseau : équilibrage réussi, confort homogène.', 5, 'Ravennes-les-Francs', 'pompe-a-chaleur', 'bondues'),
    ('Héloïse – centre', 'PAC + ECS installées sans surprise, explications claires.', 5, 'Centre', 'pompe-a-chaleur', 'bondues'),
    ('Damien – limite Mouvaux', 'Entretien complet et réglages loi d''eau : facture en baisse.', 5, 'Limite Mouvaux', 'pompe-a-chaleur', 'bondues'),
    ('Agnès – campagne', 'Intervention un samedi, dépannage provisoire puis réparation définitive.', 5, 'Secteur campagne', 'pompe-a-chaleur', 'bondues'),
    ('Romain – proche golf', 'Devis précis, délais respectés, chantier propre.', 5, 'Proche golf', 'pompe-a-chaleur', 'bondues'),
    ('Maud – Saint-Maur', 'Installation compacte en copro, bruit maîtrisé, dossier syndic nickel.', 5, 'Saint-Maur', 'pompe-a-chaleur', 'la-madeleine'),
    ('Jérôme – Botanique', 'Équilibrage/désembouage : confort retrouvé, SCOP amélioré.', 5, 'Botanique', 'pompe-a-chaleur', 'la-madeleine'),
    ('Aline – centre', 'PAC + ECS ; documentation fournie, délais tenus.', 5, 'Centre', 'pompe-a-chaleur', 'la-madeleine'),
    ('Olivier – Berkem', 'Entretien annuel sérieux, thermostat optimisé.', 5, 'Berkem', 'pompe-a-chaleur', 'la-madeleine'),
    ('Sarah – Romarin', 'Dépannage samedi puis réparation lundi, communication parfaite.', 5, 'Romarin', 'pompe-a-chaleur', 'la-madeleine'),
    ('Hugo – limite Marcq', 'Chantier soigné, très pro.', 5, 'Limite Marcq', 'pompe-a-chaleur', 'la-madeleine'),
    ('Aurélie – Canteleu', 'PAC posée proprement, respect des boiseries et accès étroits.', 5, 'Canteleu', 'pompe-a-chaleur', 'lambersart'),
    ('Bastien – Pacot-Vandracq', 'Désembouage + équilibrage : chaleur homogène, facture en baisse.', 5, 'Pacot-Vandracq', 'pompe-a-chaleur', 'lambersart'),
    ('Léa – Champ-de-Courses', 'Installation compacte, programmation expliquée clairement.', 5, 'Champ-de-Courses', 'pompe-a-chaleur', 'lambersart'),
    ('Samuel – Bourg', 'Entretien sérieux, attestation fournie.', 5, 'Bourg', 'pompe-a-chaleur', 'lambersart'),
    ('Nora – limite Saint-André', 'Dépannage week-end, retour pièce le lundi. Nickel.', 5, 'Limite Saint-André', 'pompe-a-chaleur', 'lambersart'),
    ('Cyril – av. de Dunkerque', 'Devis clair, délais respectés, chantier propre.', 5, 'Avenue de Dunkerque', 'pompe-a-chaleur', 'lambersart'),
    ('Coralie – centre', 'Sécurisation rapide, remise en route. Très pro.', 5, 'Centre', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Vincent – Sainte-Hélène', 'Optimisation réseau : radiateurs réguliers, PAC silencieuse.', 5, 'Sainte-Hélène', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Amandine – bord de Deûle', 'Installation en cour, gestion des condensats impeccable.', 5, 'Bords de Deûle', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Jules – proche gare', 'Entretien + réglages régulation, confort stable.', 5, 'Proche gare', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Nadia – secteur canal', 'Dépannage samedi, réparation définitive lundi.', 5, 'Secteur canal', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Thierry – limite La Madeleine', 'Chantier propre, délais tenus.', 5, 'Limite La Madeleine', 'pompe-a-chaleur', 'saint-andre-lez-lille'),
    ('Amélie – Délivrance', 'PAC air/eau posée, bruit maîtrisé, conso en baisse.', 5, 'Délivrance', 'pompe-a-chaleur', 'lomme'),
    ('Gauthier – Bourg', 'Équilibrage réussi : confort immédiat.', 5, 'Bourg', 'pompe-a-chaleur', 'lomme'),
    ('Lina – Mitterie', 'Pose PAC + ECS ; très bonnes explications.', 5, 'Mitterie', 'pompe-a-chaleur', 'lomme'),
    ('Farid – Mont-à-Camp', 'Entretien annuel sérieux, thermostat optimisé.', 5, 'Mont-à-Camp', 'pompe-a-chaleur', 'lomme'),
    ('Nolwenn – Lomme-Campus', 'Dépannage samedi, réparation lundi. RAS.', 5, 'Lomme-Campus', 'pompe-a-chaleur', 'lomme'),
    ('Cédric – limite Loos', 'Devis précis, chantier propre, équipe réactive.', 5, 'Limite Loos', 'pompe-a-chaleur', 'lomme')
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