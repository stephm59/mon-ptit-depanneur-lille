UPDATE blog_posts 
SET content = REPLACE(
  content,
  '<h2>Les codes erreurs les plus fréquents</h2>

<p>Voici quelques exemples que l''on retrouve chez de nombreuses marques (Vaillant, Saunier Duval, ELM Leblanc, Frisquet, Chaffoteaux, etc.) :</p>

<p><strong>Code F22 (Vaillant)</strong> : pression d''eau trop basse. Vérifiez le manomètre et rajoutez de l''eau via la vanne de remplissage.</p>

<p><strong>Code 501 (Saunier Duval)</strong> : défaut d''allumage du brûleur. Peut venir d''une électrode encrassée ou d''un problème de gaz.</p>

<p><strong>Code A01 (Chaffoteaux)</strong> : échec d''allumage. Nécessite souvent le contrôle d''un technicien.</p>

<p><strong>Code 5P1 (Frisquet)</strong> : problème de sonde de température.</p>

<p><strong>Code E10 (Elm Leblanc)</strong> : pression insuffisante dans le circuit de chauffage.</p>

<p><strong>Code 108 (Baxi)</strong> : manque d''eau dans le circuit.</p>

<p>👉 Astuce : consultez toujours le manuel de votre chaudière pour identifier la signification exacte du code selon votre modèle.</p>',
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
  <caption>Saunier Duval — exemples de codes (résidentiel)</caption>
  <thead>
    <tr>
      <th style="width:110px;">Code</th>
      <th style="width:32%;">Signification (simplifiée)</th>
      <th style="width:34%;">À tenter soi-même (sans risque)</th>
      <th>Appeler un pro si…</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="mdp-badge">F28</span></td>
      <td>Défaut d''allumage / pas de flamme détectée.</td>
      <td>Vérifier robinet de gaz ouvert, pression d''eau ~1–1,5 bar, **reset** unique.</td>
      <td>Le code revient, odeur de gaz, ou allumages répétés sans démarrer (électrode, ionisation, alimentation gaz).</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">501</span></td>
      <td>Défaut d''allumage du brûleur (variante selon modèles).</td>
      <td>Reset, vérifier pression, aérer la pièce.</td>
      <td>Code récurrent, fumées/odeur anormale, claquement à l''allumage.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">F1 / F4</span></td>
      <td>Allumage impossible / coupure flamme.</td>
      <td>Reset, contrôle de la pression, vérifier piles du thermostat (si modèle radio).</td>
      <td>Arrêts fréquents, instabilité de flamme : contrôle brûleur/ionisation nécessaire.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">F32 / F33</span></td>
      <td>Air/fumées : ventilateur ou pressostat de fumées.</td>
      <td>Rien à démonter : s''assurer que les **entrées d''air** ne sont pas obstruées.</td>
      <td>Toute alerte "fumées" = sécurité : diagnostic fumisterie/ventouse impératif.</td>
    </tr>
  </tbody>
</table>

<!-- DE DIETRICH -->
<table class="mdp-table">
  <caption>De Dietrich — exemples de codes (résidentiel)</caption>
  <thead>
    <tr>
      <th style="width:110px;">Code</th>
      <th style="width:32%;">Signification (simplifiée)</th>
      <th style="width:34%;">À tenter soi-même (sans risque)</th>
      <th>Appeler un pro si…</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="mdp-badge">E10</span></td>
      <td>Manque d''eau / défaut de circulation.</td>
      <td>Remonter la pression à **1–1,5 bar**, purger un radiateur si besoin.</td>
      <td>La pression rechute, bruit de pompe, zones froides persistantes (pompe/vase/fuite).</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">E25 / E26</span></td>
      <td>Absence de circulation (pompe bloquée, hydraulique).</td>
      <td>—</td>
      <td>N''insistez pas : contrôle/déblocage pompe et vérifs hydrauliques par un pro.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">E32</span></td>
      <td>Encrassement/entartrage circuit ou capteur.</td>
      <td>—</td>
      <td>Nécessite nettoyage/détartrage et contrôles capteurs/échangeur.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">E35</span></td>
      <td>Anomalie de flamme / flamme parasite.</td>
      <td>Reset unique, aérer la pièce.</td>
      <td>Analyse de combustion et contrôle brûleur/ionisation indispensables.</td>
    </tr>
  </tbody>
</table>

<!-- ATLANTIC -->
<table class="mdp-table">
  <caption>Atlantic — exemples de codes (NAEMA/NAIA et assimilés)</caption>
  <thead>
    <tr>
      <th style="width:110px;">Code</th>
      <th style="width:32%;">Signification (simplifiée)</th>
      <th style="width:34%;">À tenter soi-même (sans risque)</th>
      <th>Appeler un pro si…</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="mdp-badge">E59</span></td>
      <td>Pression d''eau trop basse.</td>
      <td>Remonter la pression à ~**1 bar** (à froid). Surveiller 24–48 h.</td>
      <td>La pression redescend → possible fuite ou **vase d''expansion** à revoir.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">E7</span></td>
      <td>Température fumées trop élevée / évacuation défaillante.</td>
      <td>—</td>
      <td>Arrêt de sécurité : **coupez l''appareil** et faites contrôler la fumisterie.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">68 / 69</span></td>
      <td>Perte de communication thermostat (zone 1/2).</td>
      <td>Vérifier alimentation du thermostat, piles/liaison radio.</td>
      <td>Persistance du défaut : contrôle du bus/platines par un pro.</td>
    </tr>
    <tr>
      <td><span class="mdp-badge">E46 / E25 / E34</span></td>
      <td>Autres défauts "Exxx" répertoriés selon notice du modèle.</td>
      <td>Reset unique + vérifs simples (pression, aération).</td>
      <td>Tout code récurrent ou lié aux **fumées** → intervention qualifiée.</td>
    </tr>
  </tbody>
</table>

<p style="font-size:.95em;color:#475569;margin-top:.5rem;">
<b>Rappels sécurité :</b> ne démontez ni brûleur, ni ventilateur, ni conduits. En cas d''odeur de gaz, de fumée ou de bruit suspect, coupez l''appareil et appelez un chauffagiste d''urgence.
</p>
<!-- FIN TABLEAUX -->'
)
WHERE slug = 'code-erreur-chaudiere-signification'