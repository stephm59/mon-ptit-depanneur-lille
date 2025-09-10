-- Corriger le service_id de l'article sur les systèmes de plomberie
UPDATE blog_posts 
SET service_id = (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1)
WHERE slug = 'systemes-plomberie-maison';