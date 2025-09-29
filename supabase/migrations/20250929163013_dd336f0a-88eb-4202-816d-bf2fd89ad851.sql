UPDATE blog_posts 
SET content = REPLACE(
  content,
  '<!-- ATLANTIC -->
<table class="mdp-table">
  <caption>Atlantic — exemples de codes (NAEMA/NAIA et assimilés)</caption>',
  '<h2>Les codes erreurs les plus fréquents chez Atlantic</h2>

<!-- ATLANTIC -->
<table class="mdp-table">'
)
WHERE slug = 'code-erreur-chaudiere-signification'