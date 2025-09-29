UPDATE blog_posts 
SET content = REPLACE(
  content,
  '<!-- DE DIETRICH -->
<table class="mdp-table">
  <caption>De Dietrich — exemples de codes (résidentiel)</caption>',
  '<h2>Les codes erreurs les plus fréquents chez De Dietrich</h2>

<!-- DE DIETRICH -->
<table class="mdp-table">'
)
WHERE slug = 'code-erreur-chaudiere-signification'