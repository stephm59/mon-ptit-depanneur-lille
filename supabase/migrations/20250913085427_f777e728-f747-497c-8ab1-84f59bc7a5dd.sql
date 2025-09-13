-- Mettre à jour les slugs des services pour qu'ils correspondent aux URLs utilisateur
UPDATE services SET slug = 'chauffagiste' WHERE slug = 'chauffage';
UPDATE services SET slug = 'vitrier' WHERE slug = 'vitre';  
UPDATE services SET slug = 'serrurier' WHERE slug = 'serrure';