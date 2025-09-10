-- Mise à jour de l'image hero pour l'article régulation du chauffage avec la nouvelle URL
UPDATE blog_posts 
SET cover_image_url = 'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/regulation-chauffage-thermostats.webp',
    updated_at = now()
WHERE slug = 'regulation-chauffage';