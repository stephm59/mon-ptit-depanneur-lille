-- Insert blog post: Monoxyde de carbone et gaz : 7 conseils pour éviter les fuites et intoxications
INSERT INTO blog_posts (
  slug,
  title,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at,
  service_id
) VALUES (
  'fuites-intoxictions-monoxyde-carbone',
  'Monoxyde de carbone et gaz : 7 conseils pour éviter les fuites et intoxications',
  'Entretien des appareils à gaz, détecteurs de CO, ventilation : découvrez nos conseils pratiques pour prévenir les fuites de gaz et les intoxications au monoxyde de carbone.',
  '7 conseils pour prévenir les fuites de gaz et les intoxications au monoxyde de carbone

Invisible, inodore et pourtant mortel : le monoxyde de carbone fait chaque année des victimes en France. Les fuites de gaz représentent elles aussi un danger sérieux. Heureusement, quelques gestes simples permettent de sécuriser votre logement et de protéger vos proches.

Voici les conseils de **Mon p''tit Dépanneur** pour éviter les accidents.

## 1. Faites entretenir régulièrement vos appareils à gaz

Chaudière, chauffe-eau, cuisinière : tout appareil à gaz doit être contrôlé au moins une fois par an par un professionnel. Cet entretien réduit fortement les risques de fuite ou de mauvais réglage.

## 2. Installez un détecteur de monoxyde de carbone

Le CO est surnommé le "tueur silencieux" : il est invisible, inodore et incolore.

👉 Un détecteur de CO vous alerte par une alarme sonore en cas de danger. Placez-le près des chambres et dans les pièces où fonctionnent des appareils à gaz.

## 3. Aérez régulièrement votre maison

Même en hiver, ouvrez vos fenêtres au moins 10 minutes par jour. Cela permet de renouveler l''air et d''éviter la concentration de gaz toxiques.

## 4. Soyez attentif aux signes de fuite de gaz

- Odeur forte caractéristique,
- Sifflement au niveau d''un tuyau,
- Flamme de gaz anormale (jaune au lieu de bleue).

👉 **Si vous suspectez une fuite** :
- n''utilisez pas d''électricité ni d''appareil électronique,
- ne fumez pas et n''allumez pas de flamme,
- ouvrez les fenêtres,
- coupez l''arrivée générale de gaz,
- appelez immédiatement un professionnel.

## 5. Vérifiez les tuyaux de raccordement

Contrôlez régulièrement l''état des flexibles de gaz (date de péremption, fissures, usure).

👉 Remplacez-les dès le moindre signe d''altération. Un tuyau de gaz se change facilement et coûte peu par rapport aux risques encourus.

## 6. Assurez une bonne ventilation

Ne bouchez jamais les grilles de ventilation de vos appareils à gaz. Elles sont indispensables pour évacuer les gaz brûlés. Un meuble ou un rideau devant une grille peut suffire à créer un danger.

## 7. Ne bricolez jamais vos installations de gaz

La plomberie et les raccordements de gaz ne s''improvisent pas. En cas de panne ou de fuite, faites appel à un professionnel qualifié. Vous éviterez ainsi tout risque d''accident.

## Conclusion

En respectant ces gestes simples, vous réduisez fortement les risques liés au gaz et au monoxyde de carbone.

👉 Pour l''entretien, le dépannage ou la réparation de vos appareils à gaz, contactez **Mon p''tit Dépanneur** au **03 28 53 48 68**.',
  '/blog-images/fuites-intoxictions-monoxyde-carbone.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'chauffage' LIMIT 1)
);