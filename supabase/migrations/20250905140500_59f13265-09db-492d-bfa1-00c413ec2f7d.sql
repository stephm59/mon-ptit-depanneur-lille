
-- Extensions utiles
create extension if not exists pgcrypto;

-- 1) Services
create table if not exists public.services (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  description text,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.services enable row level security;

-- Politiques RLS services
create policy "Public peut lire services publiés"
on public.services
for select
to anon, authenticated
using (published = true);

create policy "Éditer services (authentifié)"
on public.services
for all
to authenticated
using (true)
with check (true);


-- 2) Cities
create table if not exists public.cities (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  department text,
  region text,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.cities enable row level security;

-- Politiques RLS cities
create policy "Public peut lire villes publiées"
on public.cities
for select
to anon, authenticated
using (published = true);

create policy "Éditer villes (authentifié)"
on public.cities
for all
to authenticated
using (true)
with check (true);


-- 3) Pages locales Service + Ville
create table if not exists public.service_city_pages (
  id uuid primary key default gen_random_uuid(),
  service_id uuid not null references public.services(id) on delete cascade,
  city_id uuid not null references public.cities(id) on delete cascade,

  -- SEO
  meta_title text,
  meta_description text,

  -- Contenus
  h1 text,
  h2_intro text,
  intro_description text,

  -- Bloc CTA
  cta_title text,
  cta_subtitle text not null default 'Intervention rapide, devis gratuit et travaux garantis',

  -- Zones d’intervention
  zones_text text,

  -- Publication
  published boolean not null default false,
  published_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  unique (service_id, city_id)
);

create index if not exists idx_service_city_pages_service on public.service_city_pages(service_id);
create index if not exists idx_service_city_pages_city on public.service_city_pages(city_id);

alter table public.service_city_pages enable row level security;

-- Politiques RLS pages locales
create policy "Public peut lire pages locales publiées"
on public.service_city_pages
for select
to anon, authenticated
using (published = true);

create policy "Éditer pages locales (authentifié)"
on public.service_city_pages
for all
to authenticated
using (true)
with check (true);


-- 4) Prestations locales (6 items)
create table if not exists public.service_city_offers (
  id uuid primary key default gen_random_uuid(),
  page_id uuid not null references public.service_city_pages(id) on delete cascade,
  position smallint not null, -- 1..6
  emoji text,                 -- ex. "🔧" (facultatif)
  icon_name text,             -- ex. "wrench" si on veut mapper à une lib d’icônes
  title text not null,        -- ex. "Réparation de fuite d’eau à {city}"
  description text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (page_id, position)
);

create index if not exists idx_service_city_offers_page on public.service_city_offers(page_id);

alter table public.service_city_offers enable row level security;

-- Lecture publique uniquement si la page parente est publiée
create policy "Public peut lire offres de pages publiées"
on public.service_city_offers
for select
to anon, authenticated
using (
  exists (
    select 1
    from public.service_city_pages p
    where p.id = page_id
      and p.published = true
  )
);

create policy "Éditer offres locales (authentifié)"
on public.service_city_offers
for all
to authenticated
using (true)
with check (true);


-- 5) FAQ générique par service
create table if not exists public.service_faqs_generic (
  id uuid primary key default gen_random_uuid(),
  service_id uuid not null references public.services(id) on delete cascade,
  question text not null,
  answer text not null,
  position smallint not null default 1,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_service_faqs_generic_service on public.service_faqs_generic(service_id);

alter table public.service_faqs_generic enable row level security;

create policy "Public peut lire FAQ générique publiée"
on public.service_faqs_generic
for select
to anon, authenticated
using (published = true);

create policy "Éditer FAQ générique (authentifié)"
on public.service_faqs_generic
for all
to authenticated
using (true)
with check (true);


-- 6) FAQ locale (override) par service + ville
create table if not exists public.service_city_faqs (
  id uuid primary key default gen_random_uuid(),
  service_id uuid not null references public.services(id) on delete cascade,
  city_id uuid not null references public.cities(id) on delete cascade,
  question text not null,
  answer text not null,
  position smallint not null default 1,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (service_id, city_id, position, question)
);

create index if not exists idx_service_city_faqs_service on public.service_city_faqs(service_id);
create index if not exists idx_service_city_faqs_city on public.service_city_faqs(city_id);

alter table public.service_city_faqs enable row level security;

create policy "Public peut lire FAQ locale publiée"
on public.service_city_faqs
for select
to anon, authenticated
using (published = true);

create policy "Éditer FAQ locale (authentifié)"
on public.service_city_faqs
for all
to authenticated
using (true)
with check (true);


-- 7) Témoignages (filtrables par service et/ou ville)
create table if not exists public.testimonials (
  id uuid primary key default gen_random_uuid(),
  service_id uuid references public.services(id) on delete set null,
  city_id uuid references public.cities(id) on delete set null,
  author_name text not null,
  location text,
  rating int not null check (rating between 1 and 5),
  content text not null,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_testimonials_service on public.testimonials(service_id);
create index if not exists idx_testimonials_city on public.testimonials(city_id);
create index if not exists idx_testimonials_published on public.testimonials(published);

alter table public.testimonials enable row level security;

create policy "Public peut lire témoignages publiés"
on public.testimonials
for select
to anon, authenticated
using (published = true);

create policy "Éditer témoignages (authentifié)"
on public.testimonials
for all
to authenticated
using (true)
with check (true);


-- 8) Articles de blog (liés à un service)
create table if not exists public.blog_posts (
  id uuid primary key default gen_random_uuid(),
  service_id uuid references public.services(id) on delete set null,
  title text not null,
  slug text not null unique,
  excerpt text,
  cover_image_url text,
  content text,
  published boolean not null default false,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_blog_posts_service on public.blog_posts(service_id);
create index if not exists idx_blog_posts_published on public.blog_posts(published);

alter table public.blog_posts enable row level security;

create policy "Public peut lire articles publiés"
on public.blog_posts
for select
to anon, authenticated
using (published = true);

create policy "Éditer articles (authentifié)"
on public.blog_posts
for all
to authenticated
using (true)
with check (true);


-- 9) Trigger générique pour updated_at
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- Attacher le trigger aux tables concernées
drop trigger if exists set_timestamp_services on public.services;
create trigger set_timestamp_services
before update on public.services
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_cities on public.cities;
create trigger set_timestamp_cities
before update on public.cities
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_service_city_pages on public.service_city_pages;
create trigger set_timestamp_service_city_pages
before update on public.service_city_pages
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_service_city_offers on public.service_city_offers;
create trigger set_timestamp_service_city_offers
before update on public.service_city_offers
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_service_faqs_generic on public.service_faqs_generic;
create trigger set_timestamp_service_faqs_generic
before update on public.service_faqs_generic
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_service_city_faqs on public.service_city_faqs;
create trigger set_timestamp_service_city_faqs
before update on public.service_city_faqs
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_testimonials on public.testimonials;
create trigger set_timestamp_testimonials
before update on public.testimonials
for each row
execute procedure public.set_updated_at();

drop trigger if exists set_timestamp_blog_posts on public.blog_posts;
create trigger set_timestamp_blog_posts
before update on public.blog_posts
for each row
execute procedure public.set_updated_at();
