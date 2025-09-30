-- Mettre l'article "Code erreur clim" en dernière position du carousel avec une date plus ancienne
UPDATE blog_posts 
SET published_at = '2023-01-15 10:00:00+00' 
WHERE slug = 'code-erreur-clim-premiers-reflexes';