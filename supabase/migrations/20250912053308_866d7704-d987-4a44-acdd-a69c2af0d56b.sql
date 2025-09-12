-- Insert new blog post about detecting water leaks
INSERT INTO blog_posts (
  service_id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  meta_title,
  meta_description
) VALUES (
  (SELECT id FROM services WHERE slug = 'plomberie'),
  'Comment détecter une fuite d''eau dans sa maison ?',
  'detecter-fuite-eau-maison',
  'Facture d''eau trop élevée ? Découvrez les étapes simples pour détecter une fuite d''eau : compteur, chauffe-eau, toilettes, robinetterie, jardin.',
  'Une facture d''eau anormalement élevée ? Un doute sur une fuite invisible ? Les fuites d''eau sont parfois discrètes mais peuvent coûter très cher si elles ne sont pas repérées rapidement.

👉 Mon p''tit Dépanneur vous explique comment vérifier vous-même pas à pas, avant de faire appel à un plombier.

## Étape 1 : Vérifier le compteur d''eau

• Relevez les chiffres de votre compteur le soir avant de vous coucher.

• Ne consommez pas d''eau pendant la nuit (pas de chasse d''eau, robinet, lave-vaisselle…).

**Le matin :**

• Si le compteur n''a pas bougé → pas de fuite.

• Si les chiffres ont augmenté → il y a une fuite à rechercher.

## Étape 2 : Contrôler le chauffe-eau

• Vérifiez la soupape de sécurité située sous le ballon.

• Penchez l''oreille : un sifflement est signe de fuite.

• Une fuite peut passer inaperçue si le tuyau est directement relié à l''évacuation.

## Étape 3 : Vérifier les toilettes

• Ouvrez le réservoir et écoutez : un bruit de sifflement est suspect.

**Astuce simple :** mettez quelques gouttes de colorant alimentaire dans le réservoir (pas dans la cuvette).

• Si au bout d''une minute la cuvette se colore → fuite confirmée.

## Étape 4 : Déterminer si la fuite est dans ou hors de la maison

• Coupez l''eau de votre logement au robinet d''arrêt général.

**Vérifiez le compteur :**

• Si le chiffre bouge encore → fuite entre le compteur et la maison.

• Sinon → fuite à l''intérieur du logement.

## Étape 5 : Vérifier la robinetterie et les tuyauteries

Inspectez soigneusement :

• Les robinets, bondes et siphons,

• Le pommeau de douche,

• Les flexibles d''alimentation sous l''évier ou le lavabo.

## Étape 6 : Ne pas oublier le jardin

Une fuite peut aussi venir de :

• L''arrosage automatique,

• Un tuyau d''arrosage fissuré,

• Le robinet extérieur.

## Conclusion

En suivant ces étapes, vous pouvez déjà éliminer beaucoup d''hypothèses.
Si malgré tout vous n''arrivez pas à localiser la fuite, contactez Mon p''tit Dépanneur au **03 28 53 48 68**. Nos plombiers interviennent à Lille, Villeneuve d''Ascq, La Madeleine, Wambrechies et alentours.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/fuite-eau.webp',
  true,
  'Comment détecter une fuite d''eau chez soi ? Guide pratique',
  'Facture trop élevée ? Découvrez comment détecter une fuite d''eau avec des méthodes simples (compteur, toilettes, chauffe-eau, jardin) et quand appeler un plombier.'
);

-- Insert blog post FAQs
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) 
SELECT 
  bp.id,
  faq.question,
  faq.answer,
  faq.position
FROM blog_posts bp,
(VALUES 
  ('Comment savoir si j''ai une fuite d''eau invisible ?', 'En vérifiant votre compteur d''eau la nuit : si les chiffres changent sans consommation, il y a fuite.', 1),
  ('Quels sont les signes d''une fuite d''eau cachée ?', 'Une facture anormalement élevée, de l''humidité sur un mur, un sifflement dans les canalisations, une baisse de pression.', 2),
  ('Comment vérifier si mes toilettes fuient ?', 'Mettez du colorant alimentaire dans le réservoir : si l''eau de la cuvette se colore, il y a une fuite.', 3),
  ('Qui appeler en cas de fuite d''eau ?', 'Un plombier certifié, comme Mon p''tit Dépanneur, capable de diagnostiquer et réparer rapidement.', 4),
  ('Une fuite d''eau peut-elle augmenter beaucoup ma facture ?', 'Oui, une petite fuite de chasse d''eau peut représenter plus de 600 litres/jour, soit des dizaines d''euros par mois.', 5),
  ('Que faire en urgence si la fuite est importante ?', 'Fermez immédiatement le robinet d''arrêt général et appelez un plombier.', 6)
) AS faq(question, answer, position)
WHERE bp.slug = 'detecter-fuite-eau-maison';