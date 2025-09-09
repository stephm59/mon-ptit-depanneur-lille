-- Correction de l'URL de l'image hero pour l'article régulation du chauffage avec la bonne image fournie par l'utilisateur
UPDATE blog_posts 
SET cover_image_url = '/lovable-uploads/a031128f-c53f-419a-b721-b863966cedb0.png',
    updated_at = now()
WHERE slug = 'regulation-chauffage';