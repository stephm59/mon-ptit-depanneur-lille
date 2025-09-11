-- Créer seulement la redirection car l'article existe déjà
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/avantages-garantie-constructeur', '/carnet/garantie-constructeur-avantages', 301)
ON CONFLICT (from_path) DO UPDATE SET
  to_path = EXCLUDED.to_path,
  status_code = EXCLUDED.status_code,
  updated_at = now();