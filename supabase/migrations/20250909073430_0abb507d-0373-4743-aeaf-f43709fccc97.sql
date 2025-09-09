-- Create the service-city page for Pompe à chaleur Villeneuve-d'Ascq
-- First, ensure we have the city Villeneuve-d'Ascq
INSERT INTO public.cities (name, slug) VALUES ('Villeneuve-d''Ascq', 'villeneuve-d-ascq')
ON CONFLICT (slug) DO NOTHING;

-- Create the service-city page
INSERT INTO public.service_city_pages (
  service_id, city_id, meta_title, meta_description, h1_title, h2_intro, intro_description,
  cta_title, cta_subtitle, zones_text, is_published
) 
SELECT 
  s.id as service_id,
  c.id as city_id,
  'Pompe à chaleur Villeneuve-d''Ascq (installation, entretien, dépannage) | Mon p''tit Dépanneur' as meta_title,
  'Installateur de pompes à chaleur à Villeneuve-d''Ascq : étude thermique, dimensionnement, pose, mise en service, entretien et dépannage. PAC air/eau et air/air. Aide MaPrimeRénov'' & CEE.' as meta_description,
  'Pompe à chaleur Villeneuve-d''Ascq (installation, entretien, dépannage)' as h1_title,
  'Des PAC pensées pour les maisons et résidences de Villeneuve-d''Ascq.' as h2_intro,
  'Depuis plus de 20 ans, Mon p''tit Dépanneur accompagne les familles et les entreprises de Villeneuve-d''Ascq pour l''installation, l''entretien et le dépannage de pompes à chaleur. Qu''il s''agisse des maisons pavillonnaires de Flers-Bourg, des résidences étudiantes autour du campus, ou des zones résidentielles comme Annappes ou Brigode, nous adaptons nos solutions aux contraintes locales : dimensionnement, bruit, réseaux hydrauliques. Nous gérons la pose, l''optimisation, la mise en service et l''accompagnement administratif pour les aides financières (MaPrimeRénov'', CEE).' as intro_description,
  'Besoin d''un installateur PAC à Villeneuve-d''Ascq ?' as cta_title,
  'Étude gratuite, installation soignée et entretien garanti.' as cta_subtitle,
  'Villeneuve-d''Ascq : Flers-Bourg, Annappes, Brigode, Triolo, Hôtel de Ville, Résidences étudiantes du campus, ainsi que les secteurs voisins : Mons-en-Barœul, Lezennes, Wasquehal, Hellemmes.' as zones_text,
  true as is_published
FROM public.services s, public.cities c
WHERE s.slug = 'pompe-a-chaleur' AND c.slug = 'villeneuve-d-ascq';

-- Create offers for this page
INSERT INTO public.service_city_offers (page_id, title, description, position, icon_name)
SELECT 
  page.id,
  offer.title,
  offer.description,
  offer.position,
  offer.icon_name
FROM (
  SELECT id FROM public.service_city_pages 
  WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur')
  AND city_id = (SELECT id FROM cities WHERE slug = 'villeneuve-d-ascq')
) page
CROSS JOIN (
  VALUES 
    ('🔍 Étude & dimensionnement PAC à Villeneuve-d''Ascq', 'Analyse thermique, déperditions, choix air/eau ou air/air, puissance adaptée aux maisons et résidences.', 1, 'Search'),
    ('🏗 Installation PAC air/eau + ballon ECS', 'Pose complète, raccordement hydraulique, régulation, mise en service.', 2, 'Wrench'),
    ('♻️ Remplacement chaudière par PAC', 'Conversion gaz → PAC, vérification des radiateurs existants, possibilité de système hybride.', 3, 'RefreshCw'),
    ('🧪 Optimisation circuit (équilibrage & désembouage)', 'Confort homogène, rendement optimisé, eau propre pour protéger le système.', 4, 'Settings'),
    ('🧰 Entretien & dépannage PAC', 'Contrats annuels, contrôle étanchéité, réglages, diagnostic bruit/givre.', 5, 'Tool'),
    ('📝 Aides & conformité', 'Accompagnement MaPrimeRénov'' et CEE, constitution des dossiers, notices techniques et justificatifs.', 6, 'FileText')
) offer(title, description, position, icon_name);