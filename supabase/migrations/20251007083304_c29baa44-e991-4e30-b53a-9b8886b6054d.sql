-- Correction de la coquille dans l'article entretien-chaudiere-lille
UPDATE blog_posts 
SET content = REPLACE(content, 'comptez 90 à 140 € (hors pièces)..', 'comptez 90 à 140 € (hors pièces).'),
    updated_at = now()
WHERE slug = 'entretien-chaudiere-lille';