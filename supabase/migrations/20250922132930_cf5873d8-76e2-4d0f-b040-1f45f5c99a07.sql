-- Update the redirect to point to the correct URL
UPDATE redirects 
SET to_path = '/carnet/remplacer-chaudiere-par-pompe-chaleur'
WHERE from_path = '/carnet/remplacement-chaudiere-pac-etapes-delais';