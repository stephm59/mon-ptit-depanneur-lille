-- Create Bondues city
INSERT INTO public.cities (name, slug, department, region, published, created_at, updated_at)
VALUES (
  'Bondues',
  'bondues',
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

-- Create service_city_page for chauffagiste bondues
INSERT INTO public.service_city_pages (
  service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description,
  cta_title, cta_subtitle, zones_text, created_at, updated_at
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  'Chauffagiste Bondues (installation, dépannage, entretien chaudière) | Mon p''tit Dépanneur' as meta_title,
  'Chauffagiste à Bondues : installation, entretien et dépannage de chaudières gaz/fioul. Interventions rapides à Montjoie, Ravennes-les-Francs et grandes propriétés. Devis gratuit, agréé assurances.' as meta_description,
  'Chauffagiste Bondues (installation, dépannage, entretien chaudière)' as h1,
  'Chauffagistes pour maisons familiales et grandes propriétés de Bondues.' as h2_intro,
  'Depuis 20 ans, Mon p''tit Dépanneur intervient à Bondues pour dépannage, entretien et installation de chaudières. Nous connaissons les particularités des quartiers Montjoie, Ravennes-les-Francs et des propriétés aux réseaux étendus. Chaudières gaz/fioul, modèles à condensation, désembouage et équilibrage : nous adaptons nos solutions à la surface et à l''usage de votre habitation. Agréés par de nombreuses assurances, nous simplifions vos démarches après sinistre.' as intro_description,
  'Besoin d''un chauffagiste à Bondues ?' as cta_title,
  'Intervention rapide, devis gratuit et travaux garantis.' as cta_subtitle,
  'Bondues : Montjoie, Ravennes-les-Francs, centre, Vertu-Couture, secteurs proches de Mouvaux et Wambrechies, ainsi que les propriétés en lisière de campagne. Interventions aussi sur Mouvaux, Marcq-en-Barœul, Roncq, Wambrechies.' as zones_text,
  now() as created_at,
  now() as updated_at
FROM public.services s, public.cities c
WHERE s.slug = 'chauffagiste' AND c.slug = 'bondues'
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

-- Create service_city_offers for bondues
WITH page_data AS (
  SELECT scp.id as page_id
  FROM public.service_city_pages scp
  JOIN public.services s ON s.id = scp.service_id
  JOIN public.cities c ON c.id = scp.city_id
  WHERE s.slug = 'chauffagiste' AND c.slug = 'bondues'
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
  (1, '🔥', 'Dépannage chaudière gaz/fioul à Bondues', 'Diagnostic rapide, mise en sécurité et remise en route si possible.'),
  (2, '🛠', 'Entretien annuel obligatoire', 'Nettoyage brûleur/corps de chauffe, contrôles sécurité/combustion, attestation fournie.'),
  (3, '🌡', 'Installation chaudière à condensation', 'Dimensionnement adapté aux grandes maisons, intégration propre.'),
  (4, '♻️', 'Remplacement d''ancienne chaudière', 'Dépose/évacuation, pose conforme, mise en service et conseils de réglage.'),
  (5, '💧', 'Équilibrage & désembouage de circuit', 'Réseaux longs maîtrisés, radiateurs homogènes, conso optimisée.'),
  (6, '🌍', 'Conseils économies d''énergie', 'Thermostats, robinets thermostatiques, programmation et bonnes pratiques.')
) AS offers_data(position, emoji, title, description);