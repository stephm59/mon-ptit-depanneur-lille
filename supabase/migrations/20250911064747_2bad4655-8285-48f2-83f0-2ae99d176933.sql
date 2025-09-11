-- Check if redirect exists and add it if not
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/type-vitrages', '/carnet/type-vitrages', 301)
ON CONFLICT (from_path) DO NOTHING;