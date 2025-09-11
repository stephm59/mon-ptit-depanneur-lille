-- Ajouter l'article sur la colonne de douche
INSERT INTO public.blog_posts (
  service_id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at
) VALUES (
  (SELECT id FROM services WHERE slug = 'plomberie'),
  'Comment bien choisir sa colonne de douche ?',
  'comment-choisir-colonne-douche',
  'Colonne encastrée ou apparente ? Mitigeur ou thermostatique ? Découvrez tous nos conseils pour choisir la colonne de douche adaptée à votre salle de bains.',
  '# Comment bien choisir sa colonne de douche ?

Vous rénovez votre salle de bains ou vous souhaitez lui donner un coup de jeune ? 💧
Un détail qui change tout : la colonne de douche. À la fois pratique et esthétique, elle peut transformer votre salle de bains en véritable espace bien-être. Mais entre les modèles, les styles et les fonctionnalités, comment choisir sans se tromper ? Pas de panique, on vous guide !

## 1. Colonne de douche pour baignoire ou pour douche ?

La première question à se poser : où va-t-elle être installée ?

**Dans une douche** : la colonne classique, sans bec de remplissage.

**Dans une baignoire** : il faut un modèle avec un bec verseur pour remplir la baignoire.

👉 C''est le point de départ de votre choix… et de votre budget.

## 2. Colonne encastrée ou apparente ?

Un critère surtout esthétique… mais aussi pratique.

**Colonne encastrée** : intégrée dans le mur, design minimaliste. Mais installation plus coûteuse (nécessite de casser le carrelage).

**Colonne apparente** : la plus répandue. Facile à poser et à remplacer, parfaite pour une rénovation rapide.

💡 **Conseil** : si vous refaites entièrement votre salle de bains, profitez-en pour envisager l''encastrée.

## 3. Le choix de la robinetterie

C''est la partie qui détermine votre confort d''utilisation.

**Avec mélangeur** : deux poignées, une pour l''eau chaude, une pour l''eau froide. Design rétro, mais peu précis.

**Avec mitigeur** : une seule manette pour régler débit + température. C''est le standard actuel.

**Avec mitigeur thermostatique** : le top du confort ! Température préréglée, économies d''eau (jusqu''à –50 %), sécurité anti-brûlure (blocage à 38°C).

## 4. La pomme de douche : ronde ou carrée ?

La pomme de tête donne le style final à votre douche.

**Ronde** : look classique, minimaliste, intemporel.

**Carrée** : esprit moderne et contemporain.

Et côté confort ? Plus la pomme est grande, plus l''effet pluie est agréable.

## 5. Et les options ?

Aujourd''hui, certaines colonnes de douche intègrent :

- Jets hydromassants.
- Éclairage LED.
- Systèmes anti-calcaire.
- Débits éco pour économiser l''eau.

## En résumé

👉 **Pour une petite salle de bains ou une rénovation rapide** : colonne apparente avec mitigeur thermostatique.
👉 **Pour un projet design et sur mesure** : colonne encastrée avec pomme XL.

Chez Mon P''tit Dépanneur, nos experts peuvent vous conseiller et installer la colonne de douche qui correspond à vos besoins et à votre budget. Contactez-nous !',
  '/blog-images/colonne-de-douche.webp',
  true,
  now()
);

-- Ajouter les FAQs de l'article
INSERT INTO public.blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES 
(
  (SELECT id FROM blog_posts WHERE slug = 'comment-choisir-colonne-douche'),
  'Quelle différence entre une colonne de douche et une barre de douche classique ?',
  'La barre de douche ne fait que maintenir la douchette, alors que la colonne inclut pommeau, douchette, et souvent robinetterie intégrée.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'comment-choisir-colonne-douche'),
  'Quelle hauteur pour une colonne de douche ?',
  'En général, entre 2 m et 2,20 m du sol, mais cela dépend de la taille des utilisateurs.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'comment-choisir-colonne-douche'),
  'Combien coûte une colonne de douche ?',
  'Les prix varient de 100 € pour une entrée de gamme à plus de 1 000 € pour une colonne haut de gamme avec jets massants et LED.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'comment-choisir-colonne-douche'),
  'Faut-il un plombier pour installer une colonne de douche ?',
  'Pas toujours : une colonne apparente est facile à poser. Mais pour une encastrée, mieux vaut faire appel à un professionnel.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'comment-choisir-colonne-douche'),
  'Quelle colonne de douche choisir pour économiser l''eau ?',
  'Optez pour une colonne avec mitigeur thermostatique et réducteur de débit, vous pouvez économiser jusqu''à 50 % d''eau.',
  5
);

-- Ajouter la redirection
INSERT INTO public.redirects (
  from_path,
  to_path,
  status_code
) VALUES (
  '/comment-choisir-colonne-douche',
  '/carnet/comment-choisir-colonne-douche',
  301
);