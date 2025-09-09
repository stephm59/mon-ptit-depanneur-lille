-- First, let's check what cities exist and create Villeneuve-d'Ascq properly
INSERT INTO public.cities (name, slug, department, region, published, created_at, updated_at)
VALUES (
  'Villeneuve-d''Ascq',
  'villeneuve-d-ascq',
  'Nord',
  'Hauts-de-France',
  true,
  now(),
  now()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  department = EXCLUDED.department,
  region = EXCLUDED.region,
  published = EXCLUDED.published,
  updated_at = now();

-- Create service_city_page for chauffagiste villeneuve-d-ascq
INSERT INTO public.service_city_pages (
  service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description,
  cta_title, cta_subtitle, zones_text, created_at, updated_at
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  'Chauffagiste Villeneuve-d''Ascq (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur' as meta_title,
  'Chauffagiste à Villeneuve-d''Ascq : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides dans les quartiers étudiants et familiaux. Devis gratuit, agréé assurances.' as meta_description,
  'Chauffagiste Villeneuve-d''Ascq (installation, dépannage, entretien chaudière)' as h1,
  'Chauffagistes pour familles et étudiants à Villeneuve-d''Ascq.' as h2_intro,
  'Depuis plus de 20 ans, Mon p''tit Dépanneur entretient, dépanne et installe des chaudières à Villeneuve-d''Ascq. Nos équipes interviennent aussi bien dans les résidences étudiantes (Pont-de-Bois, Cité scientifique) que dans les maisons familiales d''Annappes, Ascq ou Brigode. Chaudières gaz, fioul ou modèles à condensation : nous proposons des solutions adaptées à chaque logement, avec des délais courts et un travail soigné. Agréés par de nombreuses assurances, nous simplifions vos démarches en cas de sinistre.' as intro_description,
  'Besoin d''un chauffagiste à Villeneuve-d''Ascq ?' as cta_title,
  'Intervention rapide, devis gratuit et travaux garantis.' as cta_subtitle,
  'Villeneuve-d''Ascq au complet : Hôtel-de-Ville, Triolo, Pont-de-Bois, Annappes, Ascq, Brigode, Flers-Bourg, Château, Prés. Interventions également sur les communes voisines : Mons-en-Barœul, Wasquehal, Croix, Lezennes, Lille.' as zones_text,
  now() as created_at,
  now() as updated_at
FROM public.services s, public.cities c
WHERE s.slug = 'chauffagiste' AND c.slug = 'villeneuve-d-ascq'
ON CONFLICT (service_id, city_id) DO UPDATE SET
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description,
  h1 = EXCLUDED.h1,
  h2_intro = EXCLUDED.h2_intro,
  intro_description = EXCLUDED.intro_description,
  cta_title = EXCLUDED.cta_title,
  cta_subtitle = EXCLUDED.cta_subtitle,
  zones_text = EXCLUDED.zones_text,
  updated_at = now();

-- Create service_city_offers for the page
WITH page_data AS (
  SELECT scp.id as page_id
  FROM public.service_city_pages scp
  JOIN public.services s ON s.id = scp.service_id
  JOIN public.cities c ON c.id = scp.city_id
  WHERE s.slug = 'chauffagiste' AND c.slug = 'villeneuve-d-ascq'
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
  (1, '🔥', 'Dépannage chaudière gaz/fioul à Villeneuve-d''Ascq', 'Diagnostic rapide, mise en sécurité et remise en route lorsque c''est possible.'),
  (2, '🛠', 'Entretien annuel obligatoire', 'Nettoyage brûleur, contrôle sécurité/combustion, attestation remise pour l''assurance.'),
  (3, '🌡', 'Installation chaudière à condensation (compacte)', 'Modèles performants adaptés aux appartements étudiants et maisons familiales.'),
  (4, '♻️', 'Remplacement d''ancienne chaudière', 'Conseil sur le bon dimensionnement, pose conforme et évacuation de l''ancien appareil.'),
  (5, '💧', 'Purge/désembouage de circuit', 'Rendement optimisé, radiateurs homogènes, réduction de la conso.'),
  (6, '🌍', 'Conseils économies d''énergie', 'Réglages, thermostats, robinets thermostatiques, bonnes pratiques pour l''hiver.')
) AS offers_data(position, emoji, title, description);