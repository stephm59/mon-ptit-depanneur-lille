UPDATE blog_posts 
SET content = REPLACE(
  content,
  '<h2>Les codes erreurs les plus fréquents</h2>

<!-- TABLEAUX CODES ERREUR CHAUDIERE - MON P''TIT DÉPANNEUR (LILLE) -->
<style>
  .mdp-table { width:100%; border-collapse:collapse; margin:1rem 0; font-size:16px; }
  .mdp-table caption { text-align:left; font-weight:700; margin-bottom:.5rem; }
  .mdp-table th, .mdp-table td { border:1px solid #e5e7eb; padding:.6rem .7rem; vertical-align:top; }
  .mdp-table thead th { background:#f8fafc; }
  .mdp-badge { display:inline-block; font-size:.85em; padding:.15rem .4rem; border-radius:.35rem; background:#eef2ff; }
  @media (max-width:720px){
    .mdp-table { font-size:15px; }
    .mdp-table th:nth-child(4), .mdp-table td:nth-child(4){ display:none; } /* masque la colonne 4 sur mobile */
  }
</style>

<!-- SAUNIER DUVAL -->
<table class="mdp-table">
  <caption>Saunier Duval — exemples de codes (résidentiel)</caption>',
  '<h2>Les codes erreurs les plus fréquents</h2>

<!-- TABLEAUX CODES ERREUR CHAUDIERE - MON P''TIT DÉPANNEUR (LILLE) -->
<style>
  .mdp-table { width:100%; border-collapse:collapse; margin:1rem 0; font-size:16px; font-family: inherit; }
  .mdp-table caption { text-align:left; font-weight:700; margin-bottom:.5rem; font-family: inherit; }
  .mdp-table th, .mdp-table td { border:1px solid #e5e7eb; padding:.6rem .7rem; vertical-align:top; font-family: inherit; }
  .mdp-table thead th { background:#f8fafc; }
  .mdp-badge { display:inline-block; font-size:.85em; padding:.15rem .4rem; border-radius:.35rem; background:#eef2ff; font-family: inherit; }
  @media (max-width:720px){
    .mdp-table { font-size:15px; }
    .mdp-table th:nth-child(4), .mdp-table td:nth-child(4){ display:none; } /* masque la colonne 4 sur mobile */
  }
</style>

<h2>Les codes erreurs les plus fréquents chez Saunier Duval</h2>

<!-- SAUNIER DUVAL -->
<table class="mdp-table">'
)
WHERE slug = 'code-erreur-chaudiere-signification'