-- Insert blog post about door cylinder selection
INSERT INTO blog_posts (
  slug,
  title,
  content,
  excerpt,
  meta_title,
  meta_description,
  cover_image_url,
  published,
  published_at,
  service_id
) VALUES (
  'quel-cylindre-porte-entree',
  'Quel cylindre choisir pour ma porte d''entrée ?',
  'Le cylindre de serrure est l''élément central de votre porte d''entrée. C''est lui qui reçoit la clé et actionne le mécanisme de verrouillage. Autrement dit, c''est aussi la première cible en cas de tentative d''effraction.

👉 Mon p''tit Dépanneur vous explique comment bien choisir un cylindre de porte d''entrée pour renforcer la sécurité de votre logement.

## Pourquoi le cylindre est-il si important ?

- C''est le cœur de la serrure : sans lui, impossible de verrouiller correctement.
- C''est la première protection contre le cambriolage : un cylindre basique se perce ou se casse en quelques secondes.
- C''est une pièce facile à remplacer sans changer toute la serrure.

En choisissant un cylindre de haute sécurité, vous réduisez fortement les risques de cambriolage et prolongez la durée de vie de votre serrure.

## Les composants d''un cylindre

Un cylindre est composé de plusieurs pièces qui garantissent son fonctionnement :

- **Clé** : actionne le mécanisme.
- **Ressorts** : poussent les goupilles pour les aligner.
- **Entraîneur** : transmet la rotation de la clé.
- **Panneton** : pièce qui verrouille et déverrouille la serrure.
- **Goupilles** : plus elles sont nombreuses et sophistiquées, plus la sécurité est élevée.
- **Barre anti-perçage** : empêche l''attaque à la perceuse.
- **Rotor** : pièce où l''on insère la clé et qui transmet le mouvement.

👉 Plus un cylindre possède d''éléments de protection, plus il est sûr.

## Les types de cylindres

- **Cylindre européen** : le plus courant (forme en « poire »).
- **Cylindre rond** : plus rare et plus complexe à remplacer.
- **Cylindre ovale** : peu utilisé, souvent sur des serrures spécifiques.

## Les critères pour choisir le bon cylindre

### Le niveau de sécurité
Privilégiez les cylindres anti-crochetage, anti-perçage, anti-casse, anti-extraction et anti-copiage.

### Le type de porte
- **Porte en bois** → panneton standard 15 mm.
- **Porte en métal/PVC** → panneton plus court (11 à 13 mm).

### La taille du cylindre
Mesurez la distance du panneton au bord intérieur et extérieur.

- **Cylindre double entrée** : 30×30, 35×35, 40×40 mm…
- **Cylindre dissymétrique** : ex. 30×40, 30×50, 40×50 mm.
- **Demi-cylindre** : ex. 30×10 mm (pour garages, portails, etc.).

⚠️ **Conseil** : le cylindre ne doit jamais dépasser de plus de 3 mm à l''extérieur, sinon il est vulnérable aux cambrioleurs.

## Conclusion

Le choix du cylindre de porte d''entrée est crucial pour la sécurité de votre habitation. Prenez en compte le type, la taille et les protections anti-effraction.

👉 Besoin d''aide pour choisir ou installer un cylindre ? Appelez Mon p''tit Dépanneur au **03 28 53 48 68** : nos serruriers certifiés vous conseillent et interviennent rapidement.',
  'Découvrez comment bien choisir un cylindre de porte d''entrée pour renforcer la sécurité de votre logement. Guide complet avec conseils de serruriers professionnels.',
  'Quel cylindre choisir pour une porte d''entrée (guide sécurité)',
  'Découvrez quel cylindre choisir pour votre porte d''entrée : types, tailles, protections anti-effraction et conseils de serruriers Mon p''tit Dépanneur.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/cylindre-porte-entree.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'serrurier')
);

-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
(
  (SELECT id FROM blog_posts WHERE slug = 'quel-cylindre-porte-entree'),
  'Pourquoi remplacer uniquement le cylindre et pas toute la serrure ?',
  'Parce que le cylindre est indépendant. Le changer est moins cher et tout aussi efficace pour renforcer la sécurité.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'quel-cylindre-porte-entree'),
  'Quel est le cylindre le plus sûr ?',
  'Un cylindre certifié A2P avec protections anti-crochetage, anti-perçage, anti-extraction et anti-copiage.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'quel-cylindre-porte-entree'),
  'Comment mesurer la taille d''un cylindre ?',
  'Retirez l''ancien cylindre et mesurez depuis le centre du panneton jusqu''aux bords intérieur et extérieur.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'quel-cylindre-porte-entree'),
  'Quelle différence entre cylindre simple, double et demi-cylindre ?',
  'Double entrée : clé des deux côtés. Dissymétrique : une clé et un bouton. Demi-cylindre : clé d''un seul côté.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'quel-cylindre-porte-entree'),
  'Quelle est la durée de vie d''un cylindre ?',
  'En moyenne 10 à 15 ans, selon la qualité et l''usage.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'quel-cylindre-porte-entree'),
  'Combien coûte un cylindre de sécurité ?',
  'Un cylindre standard coûte 20 à 40 €, mais un cylindre haute sécurité peut aller de 80 à 200 €, installation comprise.',
  6
);