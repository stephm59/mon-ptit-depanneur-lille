-- Insert the blog post about plumbing pipe roles
INSERT INTO blog_posts (title, slug, excerpt, content, cover_image_url, published, service_id) 
VALUES (
  'La tuyauterie en plomberie : quel rôle joue-t-elle ?',
  'role-tuyauterie-plomberie',
  'Découvrez le rôle essentiel de la tuyauterie en plomberie : distribution d''eau, évacuation des eaux usées, matériaux utilisés et conseils d''entretien.',
  'On ne la voit pas, mais elle est partout 💧. La tuyauterie est au cœur de nos maisons : sans elle, pas d''eau potable, pas d''évacuation, pas de confort.

Chez Mon p''tit Dépanneur, on vous explique le rôle fondamental de la tuyauterie, ses matériaux et pourquoi un bon plombier est indispensable pour la poser et l''entretenir.

## 1. Le rôle essentiel de la tuyauterie

La tuyauterie permet de :

- distribuer l''eau potable dans toute la maison (robinets, douche, cuisine),
- évacuer les eaux usées vers les canalisations,
- garantir la séparation entre eau potable et eaux sales, indispensable pour la santé,
- alimenter certains systèmes comme le chauffage ou la climatisation.

## 2. Les missions du plombier autour de la tuyauterie

Un plombier professionnel assure :

🔧 la détection et réparation des fuites (corrosion, usure, chocs),
🧩 le choix du bon matériau (cuivre, PVC, PER, multicouche…),
🏗️ l''installation dans une construction neuve, en respectant les plans,
🍴 l''entretien de la cuisine et de la salle de bains, où l''usage est intensif.

## 3. Les principaux matériaux utilisés

### 👉 Les plastiques (PVC, CPVC, PEX)

**Avantages :** économiques, résistants à la corrosion.
**Limite :** supportent mal les très hautes températures.
**Idéal pour :** réseaux d''évacuation et eau froide.

### 👉 Les tuyaux métalliques

**Cuivre :** fiable, durable, utilisé pour eau potable, gaz et chauffage.
**Acier inoxydable :** cher mais résistant, utilisé pour l''eau salée.
**Tuyaux galvanisés :** longtemps utilisés, remplacés aujourd''hui par le PER/PEX.

### 👉 Les tuyaux multicouches et PER

Modernes, faciles à installer, résistants aux hautes températures.
Idéal pour le chauffage et les installations neuves.

## 4. Pourquoi bien choisir sa tuyauterie ?

Un réseau bien conçu et bien posé :
✔️ évite les fuites,
✔️ réduit les pertes d''énergie,
✔️ garantit une eau potable de qualité,
✔️ prolonge la durée de vie de votre installation.

👉 Vous envisagez de rénover votre salle de bains ou votre cuisine ? Faites appel à Mon p''tit Dépanneur pour une installation fiable et durable.',
  '/blog-images/tuyauterie-role.webp',
  true,
  (SELECT id FROM services WHERE slug = 'plomberie')
);