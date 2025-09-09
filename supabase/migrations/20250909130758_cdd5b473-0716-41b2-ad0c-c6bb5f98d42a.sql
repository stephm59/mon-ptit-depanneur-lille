-- Remplacer "salle de bain" par "salle de bains" dans les pages service-ville
UPDATE service_city_pages 
SET 
  meta_title = REPLACE(meta_title, 'salle de bain', 'salle de bains'),
  meta_description = REPLACE(meta_description, 'salle de bain', 'salle de bains'),
  h1 = REPLACE(h1, 'salle de bain', 'salle de bains'),
  h2_intro = REPLACE(h2_intro, 'salle de bain', 'salle de bains'),
  intro_description = REPLACE(intro_description, 'salle de bain', 'salle de bains'),
  cta_title = REPLACE(cta_title, 'salle de bain', 'salle de bains'),
  cta_subtitle = REPLACE(cta_subtitle, 'salle de bain', 'salle de bains'),
  zones_text = REPLACE(zones_text, 'salle de bain', 'salle de bains'),
  updated_at = now()
WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bains');

-- Remplacer dans les offres service-ville
UPDATE service_city_offers 
SET 
  title = REPLACE(title, 'salle de bain', 'salle de bains'),
  description = REPLACE(description, 'salle de bain', 'salle de bains'),
  updated_at = now()
WHERE page_id IN (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bains'));

-- Remplacer dans les FAQs locales
UPDATE service_city_faqs 
SET 
  question = REPLACE(question, 'salle de bain', 'salle de bains'),
  answer = REPLACE(answer, 'salle de bain', 'salle de bains'),
  updated_at = now()
WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bains');

-- Remplacer dans les FAQs génériques
UPDATE service_faqs_generic 
SET 
  question = REPLACE(question, 'salle de bain', 'salle de bains'),
  answer = REPLACE(answer, 'salle de bain', 'salle de bains'),
  updated_at = now()
WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bains');

-- Remplacer dans les témoignages
UPDATE testimonials 
SET 
  content = REPLACE(content, 'salle de bain', 'salle de bains'),
  updated_at = now()
WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bains');