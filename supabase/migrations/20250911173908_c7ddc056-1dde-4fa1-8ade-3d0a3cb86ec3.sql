-- Create the blog post about changing locks
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
  'Comment changer une serrure ?',
  'comment-changer-serrure',
  'Apprenez à changer une serrure ou un cylindre en quelques minutes : étapes pratiques, conseils de mesure et sécurité. Guide Mon p''tit Dépanneur.',
  'Une serrure qui coince, une clé cassée ou un cylindre qui tourne dans le vide… Ça arrive plus souvent qu''on ne le pense ! Dans ce cas, deux options s''offrent à vous :

• **Faire appel à un serrurier certifié** (solution rapide et sécurisée)
• **Remplacer vous-même la serrure ou le cylindre** (si vous êtes un peu bricoleur)

👉 Bonne nouvelle : changer une serrure est une opération assez simple, qui peut se faire en quelques minutes.

## Avant de commencer : vérifier la compatibilité

Avant d''acheter un cylindre ou une serrure neuve, assurez-vous que le modèle choisi correspond bien à votre porte. Pour cela :

• **Notez l''épaisseur de la porte**
• **Mesurez la longueur du cylindre** : distance entre le panneton (vis centrale) et les bords intérieur et extérieur
• **Vérifiez le type de serrure** (applique, encastrée, multipoints…)

⚠️ **Astuce** : prenez des photos ou apportez l''ancien cylindre au magasin pour éviter toute erreur.

## Changer uniquement le cylindre (barillet)

1. **Ouvrez la porte**
2. **Repérez la vis de fixation** située sur la têtière (au niveau du panneton)
3. **Retirez cette vis**
4. **Introduisez la clé**, tournez-la légèrement pour aligner le cylindre
5. **Tirez le cylindre** pour le sortir
6. **Insérez le nouveau cylindre** (avec la clé en place, c''est plus simple)
7. **Replacez la vis** et serrez-la

👉 **Temps estimé** : 5 minutes.

## Changer toute la serrure

Si vous devez remplacer l''ensemble du mécanisme :

1. **Dévissez toutes les vis** de fixation
2. **Retirez la serrure complète**
3. **Placez la nouvelle serrure** de même taille (elle doit remplir exactement l''espace)
4. **Revissez l''ensemble** et testez le bon fonctionnement

👉 **Temps estimé** : 10 minutes.

⚠️ **Important** : Ne "bricolez" pas avec une serrure trop petite ou trop grande. La serrure protège votre maison : elle doit être parfaitement adaptée.

## Conclusion

Changer une serrure est à la portée de tous… à condition d''acheter le bon modèle et de suivre les étapes dans l''ordre.

👉 Et si vous ne voulez pas prendre de risque, ou si vous souhaitez installer une serrure haute sécurité, faites appel à Mon p''tit Dépanneur au 03 28 53 48 68. Nos serruriers interviennent rapidement à Lille et alentours.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/changer-serrure.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'serrurier'),
  'Comment changer une serrure (guide pratique)',
  'Découvrez comment changer une serrure ou un cylindre facilement : étapes simples, conseils pratiques et prix moyens. Explications Mon p''tit Dépanneur.'
);

-- Create FAQs for this blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
((SELECT id FROM blog_posts WHERE slug = 'comment-changer-serrure'), 
 'Quelle est la différence entre changer un cylindre et changer une serrure ?', 
 'Le cylindre (barillet) : c''est la partie où l''on insère la clé, facile à remplacer. La serrure complète : inclut le cylindre et le mécanisme, remplacement plus long.', 1),

((SELECT id FROM blog_posts WHERE slug = 'comment-changer-serrure'), 
 'Combien de temps faut-il pour changer une serrure ?', 
 'Cylindre seul : 5 minutes. Serrure complète : environ 10 minutes.', 2),

((SELECT id FROM blog_posts WHERE slug = 'comment-changer-serrure'), 
 'Quel est le prix d''un changement de serrure ?', 
 'Cylindre standard : 20 à 50 € - Cylindre haute sécurité : 80 à 200 € - Intervention serrurier : 70 à 150 € en moyenne.', 3),

((SELECT id FROM blog_posts WHERE slug = 'comment-changer-serrure'), 
 'Peut-on changer une serrure soi-même ?', 
 'Oui, si vous êtes bricoleur. Mais pour une porte blindée ou une serrure multipoints, mieux vaut confier l''installation à un professionnel.', 4),

((SELECT id FROM blog_posts WHERE slug = 'comment-changer-serrure'), 
 'Comment éviter de choisir le mauvais cylindre ?', 
 'Toujours mesurer la longueur du barillet et prendre l''ancien modèle comme référence.', 5),

((SELECT id FROM blog_posts WHERE slug = 'comment-changer-serrure'), 
 'Quand faut-il changer sa serrure ?', 
 'En cas de clé perdue, cylindre abîmé, tentative d''effraction ou pour renforcer la sécurité.', 6);

-- Create redirect from old path to new path
INSERT INTO redirects (from_path, to_path, status_code) 
VALUES ('/comment-changer-serrure', '/carnet/comment-changer-serrure', 301);