-- 1) Vérifier que service & ville existent
select id, slug from services where slug = 'pompe-a-chaleur';
select id, slug from cities   where slug = 'la-madeleine';

-- 2) Créer/mettre à jour la page Service+Ville
insert into service_city_pages (
  service_id, city_id, published,
  meta_title, meta_description, h1, h2_intro,
  intro_description, zones_text, cta_title, cta_subtitle, published_at
)
select
  s.id, c.id, true,
  'Pompe à chaleur La Madeleine (installation, entretien, dépannage) | Mon p'tit Dépanneur',
  'PAC à La Madeleine : étude, dimensionnement, pose, mise en service, entretien et dépannage. Copropriétés Saint-Maur, Botanique, Berkem. Aide MaPrimeRénov'' & CEE.',
  'Pompe à chaleur La Madeleine (installation, entretien, dépannage)',
  'PAC compactes et silencieuses pour Saint-Maur, Botanique et tout La Madeleine.',
  'Installation et maintenance de PAC en maisons et copropriétés madeleinoises. Gestion des contraintes d''accès, locaux techniques, bruit et dossiers syndic. Optimisation hydraulique et paramétrage de loi d''eau.',
  'La Madeleine : Saint-Maur, Botanique, centre-ville, Berkem ; proximité Euralille, Marcq-en-Barœul, Saint-André-lez-Lille.',
  'Besoin d''un installateur PAC à La Madeleine ?',
  'Étude gratuite, installation soignée et entretien garanti.',
  '2025-09-09T09:00:00Z'::timestamptz
from services s
join cities c on c.slug = 'la-madeleine'
where s.slug = 'pompe-a-chaleur'
on conflict (service_id, city_id) do update set
  published        = excluded.published,
  meta_title       = excluded.meta_title,
  meta_description = excluded.meta_description,
  h1               = excluded.h1,
  h2_intro         = excluded.h2_intro,
  intro_description= excluded.intro_description,
  zones_text       = excluded.zones_text,
  cta_title        = excluded.cta_title,
  cta_subtitle     = excluded.cta_subtitle,
  published_at     = excluded.published_at,
  updated_at       = now();

-- 3) (optionnel mais utile) Injecter les 6 offres & 8 FAQ pour La Madeleine
-- OFFRES
with p as (
  select p.id from service_city_pages p
  join services s on s.id = p.service_id and s.slug='pompe-a-chaleur'
  join cities   c on c.id = p.city_id   and c.slug='la-madeleine'
)
insert into service_city_offers (page_id, position, emoji, icon_name, title, description)
values
((select id from p),1,'🔍',null,'Étude & dimensionnement PAC','Étude adaptée aux copropriétés et maisons, contraintes d''accès et acoustiques.'),
((select id from p),2,'🏗',null,'Installation PAC air/eau + ballon ECS','Pose en logement ancien/compact, régulation et mise en service.'),
((select id from p),3,'♻️',null,'Remplacement de chaudière par PAC','Compatibilité radiateurs, option hybride si besoin.'),
((select id from p),4,'🧪',null,'Optimisation circuit (équilibrage & désembouage)','Protection du système, confort et rendement à basse température.'),
((select id from p),5,'🧰',null,'Entretien & dépannage PAC','Contrat annuel, contrôle étanchéité, réglages et diagnostics.'),
((select id from p),6,'📝',null,'Aides & conformité copro','Dossiers syndic (acoustique, implantation), MaPrimeRénov''/CEE.')
on conflict (page_id, position) do update
set emoji = excluded.emoji, icon_name = excluded.icon_name, title = excluded.title, description = excluded.description, updated_at = now();

-- FAQ
insert into service_city_faqs (service_id, city_id, position, question, answer, published)
select s.id, c.id, f.pos, f.q, f.a, true
from services s
join cities   c on c.slug='la-madeleine'
join lateral ( values
  (1,'Quelle PAC choisir à La Madeleine (maison vs copro) ?','Air/eau pour radiateurs/plancher + ECS ; air/air pour chauffage/rafraîchissement sans ECS, pratique en appartements compacts.'),
  (2,'Contraintes copro (Saint-Maur, centre) : comment faire ?','Nous montons le dossier syndic : acoustique, implantation, schémas, évacuations/condensats ; coordination avec gardien/syndic.'),
  (3,'Où implanter l''unité extérieure en ville ?','En cour intérieure ou façade non exposée aux chambres, sur plots antivibratiles, avec dégagement d''air et traitement acoustique si nécessaire.'),
  (4,'Radiateurs existants : compatibles ?','Souvent oui après désembouage et équilibrage ; nous ajustons la loi d''eau et remplaçons au besoin certains émetteurs basse température.'),
  (5,'Entretien d''une PAC : obligatoire ?','Recommandé et parfois obligatoire selon la charge en fluide ; contrôles étanchéité, régulation, dégivrage, échangeurs et circulateur.'),
  (6,'Économies et confort : à quoi s''attendre ?','Baisse de conso vs gaz/fioul grâce à un SCOP élevé ; confort stable à basse température, suivi d''optimisation post-pose.'),
  (7,'Délais d''installation ?','Après validation technique et copro si besoin, la pose + mise en service s''échelonnent en général sur 1 à 2 jours.'),
  (8,'Aides (MaPrimeRénov'', CEE) : prise en charge ?','On gère l''éligibilité, les devis normalisés et les attestations, et on guide le calendrier pour enclencher les primes.')
) as f(pos,q,a) on true
where s.slug='pompe-a-chaleur'
on conflict (service_id, city_id, position) do update
set question = excluded.question, answer = excluded.answer, published = excluded.published, updated_at = now();