-- =======================================
-- CSV MERGE SCRIPT - Run after CSV imports
-- =======================================

-- 1. Merge service_city_pages from staging
INSERT INTO service_city_pages (
  service_id, city_id, published, meta_title, meta_description, h1, h2_intro,
  intro_description, zones_text, cta_title, cta_subtitle, published_at
)
SELECT s.id, c.id, t.published, t.meta_title, t.meta_description, t.h1, t.h2_intro,
       t.intro_description, t.zones_text, t.cta_title, t.cta_subtitle, t.published_at
FROM staging_service_city_pages t
JOIN services s ON s.slug = t.service_slug
JOIN cities c ON c.slug = t.city_slug
ON CONFLICT (service_id, city_id) DO UPDATE
SET published = EXCLUDED.published,
    meta_title = EXCLUDED.meta_title,
    meta_description = EXCLUDED.meta_description,
    h1 = EXCLUDED.h1,
    h2_intro = EXCLUDED.h2_intro,
    intro_description = EXCLUDED.intro_description,
    zones_text = EXCLUDED.zones_text,
    cta_title = EXCLUDED.cta_title,
    cta_subtitle = EXCLUDED.cta_subtitle,
    published_at = EXCLUDED.published_at,
    updated_at = now();

-- 2. Merge service_city_offers from staging
INSERT INTO service_city_offers (page_id, position, emoji, icon_name, title, description)
SELECT p.id, t.position, t.emoji, NULLIF(t.icon_name,''), t.title, t.description
FROM staging_service_city_offers t
JOIN services s ON s.slug = t.service_slug
JOIN cities c ON c.slug = t.city_slug
JOIN service_city_pages p ON p.service_id = s.id AND p.city_id = c.id
ON CONFLICT (page_id, position) DO UPDATE
SET emoji = EXCLUDED.emoji,
    icon_name = EXCLUDED.icon_name,
    title = EXCLUDED.title,
    description = EXCLUDED.description,
    updated_at = now();

-- 3. Merge service_city_faqs from staging
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT s.id, c.id, t.position, t.question, t.answer, COALESCE(t.published, true)
FROM staging_service_city_faqs t
JOIN services s ON s.slug = t.service_slug
JOIN cities c ON c.slug = t.city_slug
ON CONFLICT (service_id, city_id, position) DO UPDATE
SET question = EXCLUDED.question,
    answer = EXCLUDED.answer,
    published = EXCLUDED.published,
    updated_at = now();

-- 4. Merge testimonials from staging
INSERT INTO testimonials (author_name, content, rating, location, service_id, city_id, published)
SELECT t.author_name, t.content, t.rating, t.location, s.id, c.id, COALESCE(t.published, true)
FROM staging_testimonials t
LEFT JOIN services s ON s.slug = t.service_slug
LEFT JOIN cities c ON c.slug = t.city_slug
ON CONFLICT (author_name, content) DO NOTHING;

-- 5. Clean up staging tables (optional)
-- TRUNCATE staging_service_city_pages, staging_service_city_offers, staging_service_city_faqs, staging_testimonials;

-- 6. Verify results
SELECT 'Pages created:' as info, COUNT(*) as count FROM service_city_pages WHERE service_id IN (SELECT id FROM services WHERE slug = 'pompe-a-chaleur')
UNION ALL
SELECT 'Offers created:', COUNT(*) FROM service_city_offers WHERE page_id IN (
    SELECT p.id FROM service_city_pages p 
    JOIN services s ON p.service_id = s.id 
    WHERE s.slug = 'pompe-a-chaleur'
)
UNION ALL
SELECT 'FAQs created:', COUNT(*) FROM service_city_faqs WHERE service_id IN (SELECT id FROM services WHERE slug = 'pompe-a-chaleur')
UNION ALL
SELECT 'Testimonials created:', COUNT(*) FROM testimonials WHERE service_id IN (SELECT id FROM services WHERE slug = 'pompe-a-chaleur');