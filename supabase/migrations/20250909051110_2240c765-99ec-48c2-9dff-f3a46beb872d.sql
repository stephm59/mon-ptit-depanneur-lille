-- Create service_city_offers for marcq-en-baroeul
WITH page_data AS (
  SELECT scp.id as page_id
  FROM public.service_city_pages scp
  JOIN public.services s ON s.id = scp.service_id
  JOIN public.cities c ON c.id = scp.city_id
  WHERE s.slug = 'chauffagiste' AND c.slug = 'marcq-en-baroeul'
)
INSERT INTO public.service_city_offers (page_id, position, emoji, title, description, created_at, updated_at)
SELECT 
  pd.page_id,
  position,
  emoji,
  title,
  description,
  now(),
  now()
FROM page_data pd, (VALUES
  (1, '🔥', 'Dépannage chaudière gaz/fioul à Marcq', 'Diagnostic rapide, remise en route lorsque possible, remplacement de pièces défectueuses.'),
  (2, '🛠', 'Entretien annuel obligatoire', 'Nettoyage brûleur/corps de chauffe, contrôle combustion/sécurité, attestation fournie.'),
  (3, '🌡', 'Installation chaudière à condensation (compacte)', 'Modèles performants adaptés aux maisons et appartements marcquois.'),
  (4, '♻️', 'Remplacement d''ancienne chaudière', 'Étude de dimensionnement, pose conforme, évacuation de l''ancien appareil.'),
  (5, '💧', 'Équilibrage, purge et désembouage', 'Radiateurs homogènes, meilleur rendement, conso réduite.'),
  (6, '🌍', 'Conseils économies d''énergie', 'Réglages, thermostats, vannes thermostatiques, bonnes pratiques hiver.')
) AS offers_data(position, emoji, title, description);

-- Create testimonials for chauffagiste marcq-en-baroeul
INSERT INTO public.testimonials (content, author_name, location, rating, published, service_id, city_id, created_at, updated_at)
SELECT
  content,
  author_name,
  location,
  5 as rating,
  true as published,
  s.id as service_id,
  c.id as city_id,
  now() as created_at,
  now() as updated_at
FROM public.services s, public.cities c, (VALUES
  ('Panne un matin de gel. Le technicien est arrivé vite, a sécurisé l''installation et relancé la chaudière. Très pro.', 'Bérengère', 'Croisé-Laroche'),
  ('Désembouage + équilibrage : radiateurs enfin homogènes, maison plus confortable.', 'Laurent', 'Bourg'),
  ('Remplacement par une chaudière à condensation compacte. Pose soignée, explications claires.', 'Inès', 'Plouich'),
  ('Entretien annuel nickel, attestation remise et conseils pour baisser la conso.', 'Nicolas', 'Pont'),
  ('Intervention un samedi pour une fuite sur le circuit. Mise en sécurité puis réparation le lundi.', 'Céline', 'Rouges-Barres'),
  ('Devis précis, délais tenus. Je recommande pour le sérieux et la propreté du chantier.', 'Hadrien', 'proximité Hippodrome')
) AS testimonials_data(content, author_name, location)
WHERE s.slug = 'chauffagiste' AND c.slug = 'marcq-en-baroeul';