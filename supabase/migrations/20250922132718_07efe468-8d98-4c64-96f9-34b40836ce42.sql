-- Create a 301 redirect from the old URL to the new article
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/carnet/remplacement-chaudiere-pac-etapes-delais', '/carnet/remplacer-chaudiere-gaz-par-pac-lille', 301);