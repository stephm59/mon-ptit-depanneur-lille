-- Update the blog post to link it to the chaudiere service
UPDATE blog_posts 
SET service_id = (SELECT id FROM services WHERE slug = 'chaudiere')
WHERE slug = 'professionnel-du-gaz';