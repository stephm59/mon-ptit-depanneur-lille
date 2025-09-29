UPDATE blog_posts 
SET content = REPLACE(
  content,
  '## Appel à l''action (local & clair)',
  '## Quand nous contacter ?'
)
WHERE slug = 'code-erreur-clim-premiers-reflexes';