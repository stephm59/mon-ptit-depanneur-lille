-- Create Villeneuve-d'Ascq city if it doesn't exist
INSERT INTO public.cities (id, name, slug, department, region, published, created_at, updated_at)
VALUES (
  'f47ac10b-58cc-4372-a567-0e02b2c3d479',
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

-- Get service ID for chauffagiste
-- Create service_city_page for chauffagiste villeneuve-d-ascq
INSERT INTO public.service_city_pages (
  id, service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description,
  cta_title, cta_subtitle, zones_text, created_at, updated_at
)
SELECT 
  gen_random_uuid(),
  s.id as service_id,
  'f47ac10b-58cc-4372-a567-0e02b2c3d479' as city_id,
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
FROM public.services s
WHERE s.slug = 'chauffagiste'
ON CONFLICT DO NOTHING;

-- Create service_city_offers for the page
WITH page_data AS (
  SELECT scp.id as page_id
  FROM public.service_city_pages scp
  JOIN public.services s ON s.id = scp.service_id
  JOIN public.cities c ON c.id = scp.city_id
  WHERE s.slug = 'chauffagiste' AND c.slug = 'villeneuve-d-ascq'
)
INSERT INTO public.service_city_offers (id, page_id, position, emoji, title, description, created_at, updated_at)
SELECT 
  gen_random_uuid(),
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
) AS offers_data(position, emoji, title, description)
ON CONFLICT DO NOTHING;

-- Create testimonials for chauffagiste villeneuve-d-ascq
INSERT INTO public.testimonials (id, content, author_name, location, rating, published, service_id, city_id, created_at, updated_at)
SELECT
  gen_random_uuid(),
  content,
  author_name,
  location,
  5 as rating,
  true as published,
  s.id as service_id,
  'f47ac10b-58cc-4372-a567-0e02b2c3d479' as city_id,
  now() as created_at,
  now() as updated_at
FROM public.services s, (VALUES
  ('Panne de chauffage dans mon studio. Le technicien est arrivé dans l''après-midi et a relancé la chaudière après un réglage. Service clair et efficace.', 'Mathilde', 'Pont-de-Bois'),
  ('Désembouage complet + purge des radiateurs : la maison chauffe mieux et plus vite. Conseils utiles pour programmer le thermostat.', 'Romain', 'Annappes'),
  ('Entretien annuel fait en 40 minutes, attestation fournie et vérifications complètes. Très pro.', 'Hajar', 'Cité scientifique'),
  ('Remplacement d''une vieille chaudière par un modèle à condensation. Pose propre, explications détaillées et mise en service le jour même.', 'Guillaume', 'Brigode'),
  ('Intervention un samedi matin pour une panne soudaine. Mise en sécurité puis changement de pièce le lundi. Communication parfaite.', 'Éva', 'Ascq'),
  ('Tarifs transparents, délais respectés. Le chauffagiste a aussi réglé mes vannes thermostatiques pour équilibrer le circuit.', 'Pierre', 'Flers-Bourg')
) AS testimonials_data(content, author_name, location)
WHERE s.slug = 'chauffagiste'
ON CONFLICT DO NOTHING;

-- Create FAQs for chauffagiste villeneuve-d-ascq
INSERT INTO public.service_city_faqs (id, service_id, city_id, position, question, answer, published, created_at, updated_at)
SELECT
  gen_random_uuid(),
  s.id as service_id,
  'f47ac10b-58cc-4372-a567-0e02b2c3d479' as city_id,
  position,
  question,
  answer,
  true as published,
  now() as created_at,
  now() as updated_at
FROM public.services s, (VALUES
  (1, 'Quels sont vos délais pour dépanner une chaudière à Villeneuve-d''Ascq (campus, Annappes, Ascq) ?', 'En urgence, nous intervenons généralement sous 2 heures sur Villeneuve-d''Ascq. Nos équipes sont réparties par secteurs (Pont-de-Bois, Cité scientifique, Annappes/Ascq, Brigode) pour limiter les trajets. Nous commençons par une mise en sécurité (coupe-gaz, contrôle des fuites, vérification tirage/ventouse), puis effectuons la réparation ou programmons un remplacement de pièce si nécessaire.'),
  (2, 'Quel est le prix d''un entretien annuel de chaudière à Villeneuve-d''Ascq ?', 'L''entretien coûte en moyenne 120 à 160 € TTC selon le type d''appareil (gaz, fioul, condensation). Il comprend le nettoyage du brûleur et du corps de chauffe, le contrôle des organes de sécurité, la mesure de combustion et la remise de l''attestation obligatoire. Cet entretien est indispensable pour la sécurité, la durée de vie et la couverture assurance.'),
  (3, 'Intervenez-vous dans les résidences étudiantes et logements compacts ?', 'Oui. Nous avons l''habitude des espaces réduits, des accès par badge et des plannings serrés. Nous proposons des modèles compacts (condensation petite emprise) et des solutions économiques : réglages optimisés, programmation hebdo, robinets thermostatiques pour ne chauffer que les pièces occupées.'),
  (4, 'Remplacez-vous les anciennes chaudières par des modèles plus économes ?', 'Oui, avec étude du dimensionnement (surface, isolation, nombre d''occupants) pour éviter la sur-ou sous-puissance. Nous privilégions des chaudières à condensation performantes, compatibles avec l''existant (radiateurs, ventouse/conduit) et nous gérons l''évacuation de l''ancien appareil. Un devis détaillé précise matériel, main-d''œuvre et délais.'),
  (5, 'Proposez-vous des contrats d''entretien pour les bailleurs/syndics à Villeneuve-d''Ascq ?', 'Oui. Contrats annuels pour appartements, maisons et résidences : visite planifiée, priorité en cas de panne, tarifs préférentiels sur certaines interventions. Nous savons coordonner avec gardien/bailleur pour limiter la gêne dans les bâtiments collectifs.'),
  (6, 'Que faire si mes radiateurs chauffent mal malgré une chaudière récente ?', 'C''est souvent un souci d''équilibrage ou d''embouage. Nous vérifions la pression, purgeons les radiateurs, ajustons les débits et proposons un désembouage si l''eau est chargée. À la clé : meilleure montée en température, confort accru et conso en baisse.'),
  (7, 'Intervenez-vous le week-end en cas de panne de chauffage ?', 'Oui, nous assurons une permanence le samedi et parfois le dimanche pour les urgences (chaudière à l''arrêt, fuite sur circuit). Les frais de week-end sont communiqués à l''avance. Nous réalisons la mise en sécurité et, si besoin, un dépannage provisoire avant la réparation définitive en semaine.'),
  (8, 'Aides financières : puis-je en bénéficier pour remplacer ma chaudière à Villeneuve-d''Ascq ?', 'Selon votre situation, vous pouvez prétendre à des aides (ex. MaPrimeRénov'', primes énergie) pour remplacer une chaudière ancienne par un modèle plus performant. Nous vous guidons sur l''éligibilité, les pièces à fournir et le calendrier afin d''optimiser le budget et les délais du chantier.')
) AS faqs_data(position, question, answer)
WHERE s.slug = 'chauffagiste'
ON CONFLICT DO NOTHING;