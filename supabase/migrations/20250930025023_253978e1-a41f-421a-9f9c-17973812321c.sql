-- Retirer les préfixes numériques et alphabétiques des titres de l'article sur les serrures
UPDATE blog_posts
SET content = REGEXP_REPLACE(
  content,
  '(#{2,3})\s*[0-9]+\)\s*|#{3}\s*[a-z]\)\s*',
  '\1 ',
  'g'
)
WHERE slug = 'differents-types-serrures';