-- Add redirect for bathroom renovation blog post
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/renover-salle-bains-douche-baignoire/', '/carnet/renover-salle-bains-douche-baignoire/', 301)
ON CONFLICT (from_path) DO NOTHING;