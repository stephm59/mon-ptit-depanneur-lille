-- Insérer l'article sur le choix des raccords de plomberie
INSERT INTO blog_posts (
  title, 
  slug, 
  excerpt, 
  content, 
  cover_image_url, 
  published, 
  published_at,
  service_id
) VALUES (
  'Comment choisir le bon raccord de plomberie ? Guide pratique',
  'comment-choisir-raccord',
  'Raccord à visser, à sertir, à souder ou instantané ? Découvrez notre guide simple pour bien choisir un raccord adapté à votre installation.',
  'Les raccords sont de petites pièces souvent invisibles… mais essentielles 💡. Sans eux, impossible d''assembler correctement vos tuyaux et d''assurer une installation étanche.

Voici un guide pratique signé Mon p''tit Dépanneur pour savoir quel raccord choisir en fonction de votre projet.

## 1. Les critères pour choisir un raccord

### 🔧 Type de connexion

**Raccord rapide** : pratique à installer et démonter régulièrement.

**Raccord à visser** : facile à démonter avec une clé.

**Raccord à souder ou à sertir** : connexion définitive, idéale pour une installation fixe.

### 🌡️ Environnement

Tenez compte de la température, du risque de gel, de l''humidité ou des vibrations. Un raccord mal choisi peut s''user prématurément.

### 💧 Nature du fluide

Eau froide, eau chaude, gaz, air comprimé… Chaque fluide a ses spécificités (pression, température, débit). Vérifiez la compatibilité.

### 🧩 Matériaux

**Laiton** : solide et résistant à la corrosion.

**Cuivre** : utilisé pour l''eau potable et le chauffage.

**PVC / PER** : idéal pour les installations modernes, facile à poser.

## 2. Les principaux types de raccords

### 🔹 Raccords instantanés (ou à glissement)

- Très fiables, démontables sans outils.
- Parfaits si vous comptez démonter régulièrement.
- Plus coûteux que les autres.

### 🔹 Raccords à visser

- Faciles à démonter avec une clé.
- Parfaits pour les interventions occasionnelles.
- Généralement équipés de joints pour une meilleure étanchéité.

### 🔹 Raccords à souder ou à sertir

- Connexion définitive → ne se démonte pas.
- Très utilisés pour les circuits fixes (eau, chauffage).
- Les plus économiques, mais nécessitent un certain savoir-faire.

## 3. À retenir

👉 **Pour une installation démontable** : privilégiez les raccords à visser ou instantanés.

👉 **Pour une installation fixe et durable** : optez pour les raccords soudés ou sertis.

Et surtout, n''oubliez pas : la pose doit être réalisée avec soin. Un mauvais montage → fuite garantie 💧.

**Besoin d''aide pour choisir ou poser vos raccords ?** Appelez Mon p''tit Dépanneur au **03 28 53 48 68**.',
  '/blog-images/comment-choisir-raccord.webp',
  true,
  NOW(),
  (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1)
);

-- Ajouter la redirection
INSERT INTO blog_posts (
  title, 
  slug, 
  excerpt, 
  content, 
  cover_image_url, 
  published, 
  published_at,
  service_id
) VALUES (
  'Comment choisir le bon raccord de plomberie ? Guide pratique',
  'comment-choisir-raccord-redirect',
  'Raccord à visser, à sertir, à souder ou instantané ? Découvrez notre guide simple pour bien choisir un raccord adapté à votre installation.',
  'Redirection vers /carnet/comment-choisir-raccord',
  '/blog-images/comment-choisir-raccord.webp',
  false,
  NOW(),
  (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1)
) ON CONFLICT (slug) DO NOTHING;