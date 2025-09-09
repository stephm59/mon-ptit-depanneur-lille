-- Correction de l'URL de l'image hero pour l'article régulation du chauffage avec la bonne image
UPDATE blog_posts 
SET cover_image_url = '/lovable-uploads/89adf8eb-dac6-4819-ad0d-a0cff36327a2.png',
    updated_at = now()
WHERE slug = 'regulation-chauffage';