-- Create Marcq-en-Barœul city
INSERT INTO public.cities (name, slug, department, region, published, created_at, updated_at)
VALUES (
  'Marcq-en-Barœul',
  'marcq-en-baroeul',
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

-- Create service_city_page for chauffagiste marcq-en-baroeul
INSERT INTO public.service_city_pages (
  service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description,
  cta_title, cta_subtitle, zones_text, created_at, updated_at
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  'Chauffagiste Marcq-en-Barœul (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur' as meta_title,
  'Chauffagiste à Marcq-en-Barœul : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides au Croisé-Laroche, Bourg, Plouich. Devis gratuit, agréé assurances.' as meta_description,
  'Chauffagiste Marcq-en-Barœul (installation, dépannage, entretien chaudière)' as h1,
  'Chauffagistes réactifs au Croisé-Laroche, au Bourg et dans tout Marcq.' as h2_intro,
  'Depuis 20 ans, Mon p''tit Dépanneur accompagne les Marcquois pour l''entretien, le dépannage et l''installation de chaudières. Nos équipes interviennent au Croisé-Laroche, dans le Bourg, à Plouich, Pont et Rouges-Barres. Chaudières gaz/fioul, modèles à condensation, désembouage et équilibrage : nous adaptons nos solutions à chaque logement. Agréés par de nombreuses assurances, nous facilitons aussi vos démarches en cas de sinistre.' as intro_description,
  'Besoin d''un chauffagiste à Marcq-en-Barœul ?' as cta_title,
  'Intervention rapide, devis gratuit et travaux garantis.' as cta_subtitle,
  'Marcq-en-Barœul : Croisé-Laroche, Bourg, Plouich, Pont, Rouges-Barres, secteurs proches de l''Hippodrome et des axes Clemenceau/République. Interventions également à Wasquehal, La Madeleine, Lille, Mons-en-Barœul.' as zones_text,
  now() as created_at,
  now() as updated_at
FROM public.services s, public.cities c
WHERE s.slug = 'chauffagiste' AND c.slug = 'marcq-en-baroeul'
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