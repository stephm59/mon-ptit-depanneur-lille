-- Check if redirect exists and add it if not
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/raccord-dielectrique', '/carnet/raccord-dielectrique', 301)
ON CONFLICT (from_path) DO NOTHING;