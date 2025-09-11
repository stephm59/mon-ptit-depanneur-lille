-- Create new blog post about door lock components
INSERT INTO blog_posts (
  slug, 
  title, 
  content, 
  excerpt,
  cover_image_url,
  meta_title,
  meta_description,
  published,
  published_at,
  service_id
) VALUES (
  'composant-serrure-porte',
  'Qu''est-ce qui compose une serrure de porte ?',
  'Une serrure semble être un petit mécanisme simple… mais elle est en réalité composée de plusieurs pièces essentielles qui assurent la sécurité et le bon fonctionnement de votre porte.

👉 Mon p''tit Dépanneur vous explique les principaux composants d''une serrure classique, qu''elle soit en applique ou à encastrer.

## Les principaux éléments d''une serrure

### 🔩 La têtière

C''est la partie visible sur le chant de la porte. Elle maintient la serrure fixée à la porte grâce à ses vis.

### 🔄 Le pêne demi-tour (ou bec de canne)

Cette pièce inclinée s''enclenche dans la gâche quand la porte se ferme. Il se rétracte en appuyant sur la poignée ou en tournant la clé.

### 🔒 Le pêne dormant

C''est la partie qui verrouille réellement la porte. Il sort uniquement quand vous tournez la clé et bloque l''ouverture tant qu''elle n''est pas réinsérée.

### 🗝️ Le cylindre (ou canon, ou barillet)

C''est le cœur de la serrure : on y insère la clé pour actionner le mécanisme. L''avantage, c''est qu''il peut être remplacé sans changer toute la serrure.

### 🚪 La poignée

Elle permet d''actionner le pêne demi-tour pour ouvrir la porte. Présente sur toutes les portes, qu''elles soient verrouillables ou non.

### 🔑 Le trou de serrure

On le trouve sur les serrures anciennes sans cylindre moderne : c''est l''ouverture dans laquelle on insère directement la clé.

### 🪛 La gâche

Placée sur le cadre de la porte, elle reçoit le pêne dormant et maintient la porte verrouillée. C''est une petite plaque métallique vissée au bâti.

## Pourquoi connaître les composants d''une serrure ?

Comprendre comment fonctionne une serrure permet de :

• Identifier une pièce à remplacer (par ex. cylindre usé).

• Faciliter l''installation d''une nouvelle serrure.

• Améliorer la sécurité de votre habitation en choisissant le bon modèle.

👉 Et si vous n''êtes pas sûr de vous, Mon p''tit Dépanneur est là pour vous aider.

📞 Contactez-nous au 03 28 53 48 68 pour une installation rapide et professionnelle.

Ce bon conseil vous est proposé par Mon p''tit Dépanneur, votre [serrurier préféré à Lille](/serrurier-lille).',
  'Découvrez les composants essentiels d''une serrure de porte : têtière, pêne dormant, cylindre, poignée... Guide complet pour mieux comprendre votre serrure.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/serrure-porte.webp',
  'Composants d''une serrure de porte (explications simples)',
  'Découvrez les composants essentiels d''une serrure : cylindre, pêne dormant, poignée, gâche… Explications claires et conseils de Mon p''tit Dépanneur.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'serrurier' LIMIT 1)
);

-- Create FAQs for this blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  (SELECT id FROM blog_posts WHERE slug = 'composant-serrure-porte'),
  question,
  answer,
  position
FROM (VALUES
  ('Quelles sont les pièces essentielles d''une serrure moderne ?', 'La têtière, le pêne demi-tour, le pêne dormant, le cylindre, la poignée et la gâche.', 1),
  ('Quelle différence entre pêne dormant et pêne demi-tour ?', 'Le demi-tour maintient la porte fermée sans clé. Le dormant verrouille réellement la porte avec une clé.', 2),
  ('Peut-on changer uniquement le cylindre d''une serrure ?', 'Oui, c''est l''un des gros avantages : on peut remplacer uniquement le cylindre sans changer toute la serrure.', 3),
  ('À quoi sert la gâche ?', 'C''est la pièce fixée au cadre qui reçoit le pêne dormant et empêche la porte de s''ouvrir.', 4),
  ('Une serrure sans cylindre est-elle encore utilisée ?', 'Oui, surtout dans les anciennes portes. On y insère directement la clé dans le trou de serrure.', 5),
  ('Quel est le rôle de la poignée dans une serrure ?', 'Elle permet de rétracter le pêne demi-tour et d''ouvrir la porte, sans avoir à utiliser la clé.', 6)
) AS faq_data(question, answer, position);

-- Create redirect from old URL to new URL  
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/composant-serrure-porte', '/carnet/composant-serrure-porte', 301);