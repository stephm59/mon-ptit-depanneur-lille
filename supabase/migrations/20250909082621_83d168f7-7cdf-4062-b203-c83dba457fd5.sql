-- Créer/mettre à jour la page Lomme
insert into service_city_pages (
  service_id, city_id, published,
  meta_title, meta_description, h1, h2_intro,
  intro_description, zones_text, cta_title, cta_subtitle, published_at
)
select
  s.id, c.id, true,
  'Pompe à chaleur Lomme (installation, entretien, dépannage) | Mon p''tit Dépanneur',
  'PAC à Lomme : étude, dimensionnement, pose, mise en service, entretien et dépannage. Quartiers Marais, Bourg, Mont-à-Camp. Aide MaPrimeRénov'' & CEE.',
  'Pompe à chaleur Lomme (installation, entretien, dépannage)',
  'PAC performantes et discrètes pour Marais, Bourg et tous les quartiers lommois.',
  'Installation et maintenance de PAC en maisons et appartements lommois. Gestion des contraintes urbaines, accès réduits et optimisation énergétique. Solutions adaptées aux logements anciens.',
  'Lomme : Marais, Bourg, Mont-à-Camp, Mitterie ; proximité Lille-Euralille, Capinghem, Ennetières.',
  'Besoin d''un installateur PAC à Lomme ?',
  'Étude gratuite, installation soignée et entretien garanti.',
  '2025-09-09T09:00:00Z'::timestamptz
from services s
join cities c on c.slug = 'lomme'
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

-- Créer/mettre à jour la page Lambersart
insert into service_city_pages (
  service_id, city_id, published,
  meta_title, meta_description, h1, h2_intro,
  intro_description, zones_text, cta_title, cta_subtitle, published_at
)
select
  s.id, c.id, true,
  'Pompe à chaleur Lambersart (installation, entretien, dépannage) | Mon p''tit Dépanneur',
  'PAC à Lambersart : étude, dimensionnement, pose, mise en service, entretien et dépannage. Quartiers Canteleu, Pacot, Centre. Aide MaPrimeRénov'' & CEE.',
  'Pompe à chaleur Lambersart (installation, entretien, dépannage)',
  'PAC haute performance pour Canteleu, Pacot et tous les secteurs lambersartois.',
  'Installation et maintenance de PAC en résidences et pavillons lambersartois. Expertise en rénovation énergétique et solutions hybrides. Respect des contraintes architecturales locales.',
  'Lambersart : Canteleu, Pacot, Centre, Château ; proximité Saint-André-lez-Lille, La Madeleine, Loos.',
  'Besoin d''un installateur PAC à Lambersart ?',
  'Étude gratuite, installation soignée et entretien garanti.',
  '2025-09-09T09:00:00Z'::timestamptz
from services s
join cities c on c.slug = 'lambersart'
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