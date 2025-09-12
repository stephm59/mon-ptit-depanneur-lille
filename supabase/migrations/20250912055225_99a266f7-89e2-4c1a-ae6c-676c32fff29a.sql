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
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 520" role="img" aria-labelledby="compteur-title compteur-desc" style="width: 100%; height: auto; max-width: 900px;">
  <title id="compteur-title">Schéma de lecture d''un compteur d''eau</title>
  <desc id="compteur-desc">Les chiffres noirs représentent les mètres cubes facturés. Les chiffres rouges indiquent les litres ou décilitres, utiles pour une lecture fine mais non facturés.</desc>
  <defs>
    <style>
      .compteur-bg {fill: #ffffff}
      .compteur-card {fill: #f7f7f9; stroke: #d7d7dc; stroke-width: 2}
      .compteur-text {fill: #1f2937}
      .compteur-muted {fill: #6b7280}
      .compteur-brand {fill: #0ea5e9}
      .compteur-h1 {font: 700 30px/1.2 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill: #1f2937}
      .compteur-h2 {font: 700 22px/1.2 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill: #1f2937}
      .compteur-p {font: 400 18px/1.4 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill: #6b7280}
      .compteur-kbd {font: 700 44px/1.1 ui-monospace,SFMono-Regular,Menlo,monospace; letter-spacing: 2px}
      .compteur-chip {font: 600 14px/1 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill: #fff}
      .compteur-arrow {stroke: #0ea5e9; stroke-width: 4; marker-end: url(#compteur-arrow-marker)}
      .compteur-note {font: 600 16px/1.3 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto; fill: #0f766e}
      .compteur-badge {fill: #0ea5e9}
      .compteur-black-bg {fill: #0b0b0e}
      .compteur-black-fg {fill: #ffffff}
      .compteur-red-bg {fill: #e02424}
      .compteur-red-fg {fill: #ffffff}
    </style>
    <marker id="compteur-arrow-marker" markerWidth="12" markerHeight="12" refX="6" refY="6" orient="auto-start-reverse">
      <path d="M0,0 L12,6 L0,12 Z" fill="#0ea5e9"/>
    </marker>
  </defs>

  <!-- Titre -->
  <text class="compteur-h1" x="30" y="48">Comment lire un compteur d''eau</text>
  <text class="compteur-p" x="30" y="78">Noir = m³ facturés · Rouge = litres/décilitres (lecture fine, non facturée)</text>

  <!-- Carte compteur -->
  <rect x="30" y="100" width="840" height="240" rx="16" class="compteur-card"/>

  <!-- Zone chiffres noirs (m³ facturés) -->
  <rect x="60" y="150" width="360" height="140" rx="10" class="compteur-black-bg" stroke="#000" stroke-opacity=".2"/>
  <text x="240" y="222" text-anchor="middle" class="compteur-kbd compteur-black-fg">0538</text>
  <rect x="60" y="120" width="170" height="26" rx="13" class="compteur-badge"/>
  <text x="145" y="139" text-anchor="middle" class="compteur-chip">m³ facturés (noir)</text>

  <!-- Zone chiffres rouges (litres/décilitres) -->
  <rect x="480" y="150" width="360" height="140" rx="10" class="compteur-red-bg" stroke="#000" stroke-opacity=".12"/>
  <text x="660" y="222" text-anchor="middle" class="compteur-kbd compteur-red-fg">4256</text>
  <rect x="670" y="120" width="170" height="26" rx="13" class="compteur-badge"/>
  <text x="755" y="139" text-anchor="middle" class="compteur-chip">litres/décilitres (rouge)</text>

  <!-- Explication noir -->
  <path d="M240 300 C 240 345, 240 370, 260 392" class="compteur-arrow" fill="none"/>
  <text class="compteur-h2" x="30" y="398">Exemple</text>
  <text class="compteur-p" x="30" y="424">Chiffres noirs = <tspan font-weight="700" class="compteur-text">0538 m³</tspan> → base de facturation</text>

  <!-- Explication rouge -->
  <path d="M660 300 C 660 345, 660 370, 640 392" class="compteur-arrow" fill="none"/>
  <text class="compteur-p" x="420" y="424">Chiffres rouges = <tspan font-weight="700" class="compteur-text">425,6 L</tspan> = 0,4256 m³ (lecture fine)</text>

  <!-- Résumé calcul -->
  <rect x="30" y="450" width="840" height="48" rx="10" class="compteur-card"/>
  <text class="compteur-note" x="45" y="480">Total affiché = 538 m³ + 0,4256 m³ = <tspan font-weight="700">538,4256 m³</tspan> (facturation sur les m³ entiers/au pas défini par le fournisseur)</text>
</svg>
</div>

🔎 **Exemple concret :**

Affichage : 05384256

• **Chiffres noirs** : 0538 = 538 m³ → Ce qui est facturé par votre fournisseur d''eau.
• **Chiffres rouges** : 4256 = 0,4256 m³ → Permet une lecture plus fine (425,6 litres en plus).

**Votre consommation totale** = 538,4256 m³

### 2. Le compteur d''eau « volumétrique à jet unique »

Plus moderne, il affiche directement les m³ avec des décimales sur un cadran digital.

## Méthode de relevé pas à pas

### Étape 1 : Localisez votre compteur

Le compteur se trouve généralement :

• **En limite de propriété** (en bordure de trottoir)
• **Dans un regard** (petite trappe au sol)
• **Près du robinet d''arrêt** de votre installation

### Étape 2 : Ouvrez le regard

Soulevez délicatement la trappe. Vous verrez :

• Le **compteur** (boîtier rond ou rectangulaire)
• Les **canalisations** d''arrivée et de sortie
• Parfois un **robinet de fermeture**

### Étape 3 : Relevez les chiffres noirs

**Important** : Ne notez que les chiffres sur **fond noir** (ou blancs sur fond noir).

Ces chiffres correspondent aux **mètres cubes consommés** depuis l''installation du compteur.

### Étape 4 : Notez la date de relevé

Inscrivez la **date** et l''**heure** du relevé pour calculer ultérieurement votre consommation entre deux relevés.

## Calcul de consommation entre deux relevés

**Formule simple :**

Consommation = Nouveau relevé - Ancien relevé

**Exemple :**

• Relevé du 15/01 : 1847 m³
• Relevé du 15/02 : 1852 m³
• **Consommation du mois** = 1852 - 1847 = **5 m³**

## Conseils pratiques de Mon p''tit Dépanneur

### ✅ À faire :

• **Relevez régulièrement** (chaque mois) pour détecter les surconsommations
• **Photographiez le compteur** en cas de doute sur les chiffres
• **Vérifiez la cohérence** avec vos factures d''eau
• **Contactez votre fournisseur** si vous constatez des écarts importants

### ❌ À éviter :

• **Ne touchez pas** aux canalisations ou robinets si vous n''êtes pas sûr
• **N''utilisez pas d''outils** pour ouvrir le regard (risque de casse)
• **Ne notez pas** les chiffres rouges pour la facturation

## Quand s''inquiéter de sa consommation ?

### 🚨 Signes d''alerte :

• **Consommation doublée** sans explication
• **Compteur qui tourne** robinets fermés
• **Facture anormalement élevée**
• **Bruit d''eau** dans les canalisations à l''arrêt

### 🔧 Réflexes à avoir :

1. **Coupez l''eau** au robinet général
2. **Vérifiez si le compteur s''arrête**
3. Si le compteur continue de tourner → **fuite probable**
4. **Contactez un plombier professionnel**

## FAQ Compteur d''eau

**Qui relève mon compteur ?**

Selon les communes : le fournisseur d''eau, la mairie, ou une entreprise délégataire. Généralement **1 à 2 fois par an**.

**Puis-je changer mon compteur moi-même ?**

**Non**, le compteur appartient au fournisseur d''eau. Seul un professionnel agréé peut intervenir.

**Que faire si mon compteur est cassé ?**

Contactez immédiatement votre **fournisseur d''eau** ou la **mairie**. N''intervenez jamais vous-même.

**Le compteur peut-il geler ?**

Oui, protégez-le l''hiver avec un **isolant** (paille, polystyrène) si le regard n''est pas assez profond.

---

## Résumé

La lecture du compteur d''eau n''a plus de secret pour vous :

✅ **Relevez les chiffres noirs** uniquement
✅ **Notez la date** de chaque relevé  
✅ **Calculez votre consommation** entre deux relevés
✅ **Surveillez les surconsommations** inhabituelles

**Une consommation anormale ?** N''hésitez pas à faire appel à un plombier qualifié pour vérifier votre installation !

> 💡 **Bon à savoir :** La consommation moyenne d''un foyer français est de **148 litres par jour et par personne** (douche, cuisine, WC, etc.).'
WHERE slug = 'lecture-compteur-eau';