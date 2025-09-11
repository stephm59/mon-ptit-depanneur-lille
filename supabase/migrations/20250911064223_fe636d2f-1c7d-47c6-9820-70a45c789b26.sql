-- Update the blog post to link it to the chauffage service instead of chaudiere
UPDATE blog_posts 
SET service_id = (SELECT id FROM services WHERE slug = 'chauffage')
WHERE slug = 'professionnel-du-gaz';