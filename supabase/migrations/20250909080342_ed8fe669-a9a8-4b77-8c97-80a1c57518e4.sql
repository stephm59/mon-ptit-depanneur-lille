-- Create unique indexes for ON CONFLICT support
CREATE UNIQUE INDEX IF NOT EXISTS uq_service_city_pages_service_city ON service_city_pages(service_id, city_id);
CREATE UNIQUE INDEX IF NOT EXISTS uq_service_city_offers_page_position ON service_city_offers(page_id, position);
CREATE UNIQUE INDEX IF NOT EXISTS uq_service_city_faqs_service_city_position ON service_city_faqs(service_id, city_id, position);
CREATE UNIQUE INDEX IF NOT EXISTS uq_testimonials_author_content ON testimonials(author_name, content);

-- Create staging tables for CSV import
CREATE TABLE IF NOT EXISTS staging_service_city_pages (
  service_slug text not null,
  city_slug text not null,
  published boolean default true,
  meta_title text,
  meta_description text,
  h1 text,
  h2_intro text,
  intro_description text,
  zones_text text,
  cta_title text,
  cta_subtitle text,
  published_at timestamptz
);

CREATE TABLE IF NOT EXISTS staging_service_city_offers (
  service_slug text not null,
  city_slug text not null,
  position int not null,
  title text not null,
  description text,
  icon_name text,
  emoji text
);

CREATE TABLE IF NOT EXISTS staging_service_city_faqs (
  service_slug text not null,
  city_slug text not null,
  position int not null,
  question text not null,
  answer text not null,
  published boolean default true
);

CREATE TABLE IF NOT EXISTS staging_testimonials (
  author_name text not null,
  content text not null,
  rating int check (rating between 1 and 5),
  location text,
  service_slug text,
  city_slug text,
  published boolean default true
);

-- Add the 6 new cities
INSERT INTO cities (name, slug, department, region, published) VALUES
('Marcq-en-Barœul', 'marcq-en-baroeul', 'Nord', 'Hauts-de-France', true),
('Bondues', 'bondues', 'Nord', 'Hauts-de-France', true),
('La Madeleine', 'la-madeleine', 'Nord', 'Hauts-de-France', true),
('Lambersart', 'lambersart', 'Nord', 'Hauts-de-France', true),
('Saint-André-lez-Lille', 'saint-andre-lez-lille', 'Nord', 'Hauts-de-France', true),
('Lomme', 'lomme', 'Nord', 'Hauts-de-France', true)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  department = EXCLUDED.department,
  region = EXCLUDED.region,
  published = EXCLUDED.published,
  updated_at = now();