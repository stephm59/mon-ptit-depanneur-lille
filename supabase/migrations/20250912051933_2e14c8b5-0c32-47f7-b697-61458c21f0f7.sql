-- Insert new blog post about water heater maintenance
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
  'Entretien ballon d''eau chaude : guide complet et conseils pratiques',
  'guide-entretien-ballon-eau-chaude',
  'Tout savoir sur l''entretien d''un ballon d''eau chaude : fréquence, étapes, coût et responsabilités. Prolongez sa durée de vie et évitez les pannes.',
  'Un ballon d''eau chaude bien entretenu, c''est moins de pannes, plus de confort et des économies à la clé. Rien de pire que de se retrouver sous une douche glaciale parce que le ballon a lâché !

👉 Mon p''tit Dépanneur vous livre toutes les bonnes pratiques pour prolonger la durée de vie de votre chauffe-eau.

## Pourquoi entretenir son ballon d''eau chaude ?

L''entretien régulier permet de :

• **Réduire le risque de panne** et d''éviter les réparations coûteuses,

• **Optimiser la consommation énergétique** et donc diminuer vos factures,

• **Préserver l''environnement** en consommant moins d''énergie,

• **Régler la température de l''eau** pour plus de confort,

• **Rester couvert par l''assurance** en cas de sinistre lié à l''appareil.

⚠️ **À retenir :** un ballon mal entretenu s''use plus vite et peut tomber en panne bien avant sa durée de vie prévue (10 à 15 ans).

## Quand effectuer l''entretien ?

• **Détartrage complet :** tous les 3 ans (selon la dureté de l''eau).

• **Remplacement du groupe de sécurité :** tous les 4 ans.

• **Actionner la valve du groupe de sécurité :** tous les 6 mois pour éviter qu''elle ne se bloque.

## Comment se déroule un entretien de ballon d''eau chaude ?

Un professionnel suit généralement ces étapes :

• Couper l''électricité et l''arrivée d''eau.

• Vidanger la cuve.

• Accéder au boîtier électronique (dévissage du capot).

• Démonter le thermostat et la résistance.

• Nettoyer la cuve et la résistance pour retirer le tartre.

• Remplacer le joint de bride si nécessaire.

• Vérifier la pression et les éléments de sécurité.

• Remettre en eau et en service après test.

💡 **Pour les ballons gaz, l''entretien annuel par un professionnel est obligatoire.**

## Qui doit payer : propriétaire ou locataire ?

En location, l''entretien courant (détartrage, vérification) est une **charge locative**, donc à la charge du locataire.

Certains propriétaires peuvent toutefois proposer de prendre en charge l''opération.

## Conclusion

Entretenir votre ballon d''eau chaude, c''est prolonger sa durée de vie, gagner en confort et éviter les mauvaises surprises.

📞 Besoin d''un entretien, d''un détartrage ou d''un diagnostic ? Contactez Mon p''tit Dépanneur au **03 28 53 48 68**.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/entretien-ballon-eau-chaude.webp',
  true,
  'Entretien ballon d''eau chaude : guide complet et conseils pratiques',
  'Découvrez pourquoi et comment entretenir un ballon d''eau chaude : fréquence, étapes, coût et responsabilités locataire/propriétaire. Conseils Mon p''tit Dépanneur.'
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
  ('Pourquoi entretenir un ballon d''eau chaude ?', 'Pour éviter les pannes, prolonger sa durée de vie, réduire les factures et garantir la sécurité.', 1),
  ('À quelle fréquence faut-il détartrer un ballon d''eau chaude ?', 'En moyenne tous les 3 ans, selon la dureté de l''eau.', 2),
  ('Qui doit payer l''entretien du ballon d''eau chaude ?', 'En location, c''est une charge locative donc à la charge du locataire.', 3),
  ('Quels sont les signes d''un ballon entartré ?', 'Eau moins chaude, consommation électrique plus élevée, bruits inhabituels dans la cuve.', 4),
  ('Combien coûte un entretien de ballon d''eau chaude ?', 'Comptez entre 100 € et 200 €, selon le modèle et la complexité.', 5),
  ('Quelle est la durée de vie moyenne d''un ballon d''eau chaude ?', 'Entre 10 et 15 ans, si l''entretien est régulier.', 6)
) AS faq(question, answer, position)
WHERE bp.slug = 'guide-entretien-ballon-eau-chaude';