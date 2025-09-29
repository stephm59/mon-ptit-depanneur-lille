UPDATE blog_posts 
SET content = REPLACE(
  content,
  '<h2>Les codes erreurs les plus fréquents</h2>

<!-- TABLEAUX CODES ERREUR CHAUDIERE - MON P''TIT DÉPANNEUR (LILLE) -->',
  '<!-- TABLEAUX CODES ERREUR CHAUDIERE - MON P''TIT DÉPANNEUR (LILLE) -->'
)
WHERE slug = 'code-erreur-chaudiere-signification'