-- Update blog post content to include SVG diagram
UPDATE blog_posts 
SET content = 'Votre facture d''eau a augmenté et vous voulez mieux comprendre vos consommations ?
La lecture du compteur d''eau peut sembler compliquée, mais avec quelques explications et exemples concrets, vous saurez déchiffrer vos chiffres comme un pro.

👉 Mon p''tit Dépanneur vous explique pas à pas.

## Les deux types de compteurs d''eau

### 1. Le compteur d''eau « volume »

Il possède deux cadrans :

• **Chiffres blancs sur fond noir** → indiquent la consommation en m³ (c''est ce qui est facturé).

• **Chiffres blancs sur fond rouge** (ou rouges sur fond blanc) → indiquent les litres ou décilitres, utiles pour une lecture plus précise mais non utilisés pour la facturation.

<div style="background: #f8faff; padding: 20px; border-radius: 10px; margin: 24px 0;">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 520" role="img" aria-labelledby="title desc" style="width: 100%; height: auto; max-width: 900px;">
  <title id="title">Schéma de lecture d''un compteur d''eau</title>
  <desc id="desc">Les chiffres noirs représentent les mètres cubes facturés. Les chiffres rouges indiquent les litres ou décilitres, utiles pour une lecture fine mais non facturés.</desc>
  <style>
    :root {
      --bg: #ffffff;
      --card: #f7f7f9;
      --stroke: #d7d7dc;
      --text: #1f2937;
      --muted: #6b7280;
      --brand: #0ea5e9;
      --blackBg: #0b0b0e;
      --blackFg: #ffffff;
      --redBg: #e02424;
      --redFg: #ffffff;
      --hint: #0f766e;
    }
    .card{fill:var(--card);stroke:var(--stroke);stroke-width:2}
    .h1{font:700 30px/1.2 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill:var(--text)}
    .h2{font:700 22px/1.2 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill:var(--text)}
    .p{font:400 18px/1.4 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill:var(--muted)}
    .kbd{font:700 44px/1.1 ui-monospace,SFMono-Regular,Menlo,monospace; letter-spacing:2px}
    .chip{font:600 14px/1 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill:#fff}
    .arrow{stroke:var(--brand); stroke-width:4; marker-end:url(#arrow)}
    .note{font:600 16px/1.3 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill:var(--hint)}
    .badge{fill:var(--brand)}
  </style>

  <!-- Titre -->
  <text class="h1" x="30" y="48">Comment lire un compteur d''eau</text>
  <text class="p"  x="30" y="78">Noir = m³ facturés · Rouge = litres/décilitres (lecture fine, non facturée)</text>

  <!-- Carte compteur -->
  <rect x="30" y="100" width="840" height="240" rx="16" class="card"/>

  <!-- Zone chiffres noirs (m³ facturés) -->
  <rect x="60" y="150" width="360" height="140" rx="10" fill="var(--blackBg)" stroke="#000" stroke-opacity=".2"/>
  <text x="240" y="222" text-anchor="middle" class="kbd" fill="var(--blackFg)">0538</text>
  <rect x="60" y="120" width="170" height="26" rx="13" class="badge"/>
  <text x="145" y="139" text-anchor="middle" class="chip">m³ facturés (noir)</text>

  <!-- Zone chiffres rouges (litres/décilitres) -->
  <rect x="480" y="150" width="360" height="140" rx="10" fill="var(--redBg)" stroke="#000" stroke-opacity=".12"/>
  <text x="660" y="222" text-anchor="middle" class="kbd" fill="var(--redFg)">4256</text>
  <rect x="670" y="120" width="170" height="26" rx="13" class="badge"/>
  <text x="755" y="139" text-anchor="middle" class="chip">litres/décilitres (rouge)</text>

  <!-- Flèches et explications -->
  <defs>
    <marker id="arrow" markerWidth="12" markerHeight="12" refX="6" refY="6" orient="auto-start-reverse">
      <path d="M0,0 L12,6 L0,12 Z" fill="var(--brand)"/>
    </marker>
  </defs>

  <!-- Explication noir -->
  <path d="M240 300 C 240 345, 240 370, 260 392" class="arrow" fill="none"/>
  <text class="h2" x="30" y="398">Exemple</text>
  <text class="p"  x="30" y="424">Chiffres noirs = <tspan font-weight="700" fill="var(--text)">0538 m³</tspan> → base de facturation</text>

  <!-- Explication rouge -->
  <path d="M660 300 C 660 345, 660 370, 640 392" class="arrow" fill="none"/>
  <text class="p"  x="420" y="424">Chiffres rouges = <tspan font-weight="700" fill="var(--text)">425,6 L</tspan> = 0,4256 m³ (lecture fine)</text>

  <!-- Résumé calcul -->
  <rect x="30" y="450" width="840" height="48" rx="10" class="card"/>
  <text class="note" x="45" y="480">Total affiché = 538 m³ + 0,4256 m³ = <tspan font-weight="700">538,4256 m³</tspan> (facturation sur les m³ entiers/au pas défini par le fournisseur)</text>
</svg>
</div>

🔎 **Exemple concret :**

Affichage : 05384256

• Les 4 premiers chiffres (0538) = 538 m³ consommés → ce sera le montant facturé.

• Les chiffres rouges (4256) = 425,6 litres consommés supplémentaires, soit 0,42 m³.

👉 **Votre consommation totale = 538,42 m³.**

### 2. Le compteur d''eau « vitesse »

Ce modèle affiche uniquement les m³ consommés (chiffres blancs sur fond noir).
Il est souvent accompagné de petits cadrans à aiguilles, qui mesurent plus finement :

• 1ère aiguille (gauche) → décilitres,

• 2ème → litres,

• 3ème → décalitres,

• 4ème (droite) → hectolitres.

🔎 **Exemple concret :**

• Le compteur indique 000356 → soit 356 m³ consommés.

• L''aiguille des litres est sur 7 → +7 litres.

• L''aiguille des décilitres est sur 3 → +0,3 litre.

👉 **Votre consommation totale = 356,307 m³.**

## Comment calculer sa consommation d''eau ?

• Relevez les chiffres noirs (m³) à une date précise.

• Relevez-les à nouveau plus tard (ex : un mois après).

• Faites la différence → vous obtenez la consommation en m³ sur la période.

💡 **Pour estimer le montant à payer :** multipliez votre consommation par le prix du m³ appliqué par votre fournisseur.

## Consommation moyenne et repères utiles

En France, la consommation moyenne est de **40 m³/an par personne** (soit 40 000 litres).
Voici quelques ordres d''idées :

• 🚽 WC → 6 à 12 litres par chasse,

• 🍽 Vaisselle à la main → 10 à 30 litres,

• 🧼 Lave-vaisselle → 20 à 40 litres,

• 🚿 Douche → 30 à 100 litres,

• 🛁 Bain → 75 à 200 litres,

• 👕 Lave-linge → 80 à 140 litres,

• 🚗 Lavage voiture → env. 200 litres,

• 🌱 Arrosage jardin → 1000 à 2000 litres/heure.

## Conclusion

Lire son compteur d''eau n''est pas si compliqué une fois que l''on comprend les cadrans.
Cela permet de suivre sa consommation, détecter les fuites et éviter les mauvaises surprises sur la facture.

📞 Besoin d''aide pour un diagnostic de fuite ou un contrôle ? Contactez Mon p''tit Dépanneur au **03 28 53 48 68**.'
WHERE slug = 'lecture-compteur-eau';