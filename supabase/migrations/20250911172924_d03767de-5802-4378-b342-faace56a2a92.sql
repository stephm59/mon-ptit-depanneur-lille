-- First, ensure we have the "serrurier" service
INSERT INTO services (name, slug, description) 
VALUES ('Serrurier', 'serrurier', 'Services de serrurerie : installation, dépannage et remplacement de serrures')
ON CONFLICT (slug) DO NOTHING;

-- Create the blog post about different types of locks
INSERT INTO blog_posts (
  title, 
  slug, 
  excerpt, 
  content, 
  cover_image_url, 
  published, 
  published_at, 
  service_id,
  meta_title,
  meta_description
) VALUES (
  'Les différents types de serrures : guide pratique',
  'differents-types-serrures',
  'Découvrez les principaux types de serrures : tubulaires, en applique, à encastrer, cylindre européen et serrures numériques. Conseils pratiques avec Mon p''tit Dépanneur.',
  'On n''y pense pas toujours, mais la serrure est la première barrière de sécurité de votre logement. Elle protège votre maison, vos bureaux, vos biens, et parfois même vos secrets (coffres-forts, pièces privées…).

👉 Dans cet article, Mon p''tit Dépanneur vous présente les principaux types de serrures, leurs caractéristiques, avantages et limites.

## Les principaux types de serrures

### 🔒 Serrures tubulaires

• **Utilisation** : souvent installées sur les portes de bureaux ou de salles de bains
• **Avantage** : verrouillage rapide depuis l''intérieur par simple pression sur un bouton
• **Inconvénient** : sécurité limitée, adaptées surtout aux pièces intérieures

### 🔒 Serrures en applique

• **Utilisation** : sur les portes donnant sur l''extérieur (portail, porte d''entrée secondaire)
• **Avantage** : faciles à poser, robustes
• **Inconvénient** : visibles, donc plus vulnérables aux tentatives d''effraction (méthode du levier)

### 🔒 Serrures à encastrer

• **Utilisation** : le type le plus répandu sur les portes d''entrée
• **Avantage** : invisibles, sécurisées, adaptées aux portes bois et métal
• **Inconvénient** : coût plus élevé, installation plus complexe

### 🔒 Serrures à cylindre européen

• **Utilisation** : très courantes sur les portes d''entrée modernes
• **Avantage** : système fiable, compatible avec les cylindres haute sécurité (anti-perçage, anti-crochetage, anti-extraction)
• **Inconvénient** : sécurité variable selon la qualité du cylindre

### 🔒 Serrures numériques

• **Utilisation** : hôtels, bureaux, garages, de plus en plus présentes en résidentiel
• **Avantage** : ouverture par carte, code ou empreinte digitale. Sécurité renforcée et confort moderne
• **Inconvénient** : prix plus élevé, nécessite une alimentation électrique ou batterie

## Conclusion

Chaque serrure répond à un usage précis :
• **Sécurité maximale** pour l''entrée
• **Praticité** pour l''intérieur
• **Confort digital** pour les établissements modernes

👉 Besoin de conseils pour choisir ou installer votre serrure ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68 : nos serruriers vous accompagnent dans le choix le plus adapté à vos besoins.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/types-serrurures.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'serrurier'),
  'Différents types de serrures : guide complet (choix et sécurité)',
  'Découvrez les principaux types de serrures : tubulaires, en applique, à encastrer, cylindre européen et serrures numériques. Conseils pratiques avec Mon p''tit Dépanneur.'
);

-- Create FAQs for this blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
((SELECT id FROM blog_posts WHERE slug = 'differents-types-serrures'), 
 'Quelle est la serrure la plus sûre pour une porte d''entrée ?', 
 'Les serrures à encastrer ou à cylindre européen haute sécurité (certifiées A2P) sont les plus fiables.', 1),

((SELECT id FROM blog_posts WHERE slug = 'differents-types-serrures'), 
 'Quelle différence entre serrure en applique et serrure à encastrer ?', 
 'La serrure en applique est fixée en surface de la porte, tandis que la serrure à encastrer est intégrée à l''intérieur.', 2),

((SELECT id FROM blog_posts WHERE slug = 'differents-types-serrures'), 
 'Peut-on remplacer seulement le cylindre d''une serrure ?', 
 'Oui, dans le cas des serrures à cylindre européen, il est possible de changer uniquement le barillet sans remplacer toute la serrure.', 3),

((SELECT id FROM blog_posts WHERE slug = 'differents-types-serrures'), 
 'Les serrures numériques sont-elles adaptées pour une maison ?', 
 'Oui, elles commencent à se démocratiser pour les portes d''entrée résidentielles, avec code, carte ou empreinte.', 4),

((SELECT id FROM blog_posts WHERE slug = 'differents-types-serrures'), 
 'Combien coûte une serrure sécurisée ?', 
 'Serrure simple : 30 à 80 € - Cylindre haute sécurité : 80 à 200 € - Serrure numérique : 200 à 500 €', 5),

((SELECT id FROM blog_posts WHERE slug = 'differents-types-serrures'), 
 'Faut-il un professionnel pour installer une serrure ?', 
 'Pour une serrure intérieure simple, non. Mais pour une porte d''entrée ou une serrure haute sécurité, l''intervention d''un serrurier est fortement conseillée.', 6);

-- Create redirect from old path to new path
INSERT INTO redirects (from_path, to_path, status_code) 
VALUES ('/differents-types-serrures', '/carnet/differents-types-serrures', 301);