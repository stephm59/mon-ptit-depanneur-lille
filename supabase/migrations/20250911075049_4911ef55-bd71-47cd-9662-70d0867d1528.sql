-- Update the title to remove the site name suffix
UPDATE blog_posts 
SET 
  title = 'Rénover sa salle de bains : douche ou baignoire ?',
  updated_at = NOW()
WHERE slug = 'renover-salle-bains-douche-baignoire';