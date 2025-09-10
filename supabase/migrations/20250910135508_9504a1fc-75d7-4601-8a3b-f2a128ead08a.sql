-- Insérer l'article de blog sur la prévention des fuites d'eau
INSERT INTO blog_posts (
  slug,
  title,
  excerpt,
  content,
  cover_image_url,
  service_id,
  published,
  published_at
) VALUES (
  'prevenir-fuite-eau',
  'Comment prévenir une fuite d''eau ? Nos conseils pratiques',
  'Découvrez nos conseils pour éviter les fuites d''eau dans vos canalisations : choix des matériaux, bonnes pratiques d''utilisation et installation professionnelle.',
  '# Nos conseils pour prévenir une fuite d''eau

Une fuite d''eau peut rapidement tourner au cauchemar 💧 : gaspillage, dégâts matériels, facture qui grimpe… Pourtant, avec quelques précautions simples, il est possible de limiter fortement les risques.

Chez Mon p''tit Dépanneur, nous réparons chaque année des dizaines de fuites dans la région lilloise. Voici nos meilleurs conseils pour anticiper et éviter les fuites d''eau chez vous.

## 1. Choisissez des tuyaux de qualité

Un tuyau bas de gamme s''use plus vite et risque de céder.
👉 Investir dans des matériaux de qualité, même un peu plus chers, c''est réduire les réparations futures et prolonger la durée de vie de votre installation.

## 2. Méfiez-vous des vieilles installations

Les anciennes canalisations sont souvent fragiles et corrodées.
👉 Si vous rénovez ou achetez un logement ancien, prévoyez un diagnostic de la plomberie. Remplacer des tuyaux usés évite de futurs dégâts.

## 3. Attention à ce que vous jetez dans l''évier

Les tuyaux sont faits pour l''eau, pas pour les déchets.

- **Pas d''huiles de cuisson** → elles se figent et bouchent les canalisations.
- **Pas de restes alimentaires ni lingettes** → ils créent des bouchons et augmentent la pression dans les tuyaux.

Un bouchon → une surpression → une fuite 🚱.

## 4. Confiez l''installation à un professionnel

Un raccord mal fait, une soudure approximative… et c''est la fuite assurée.
👉 Faites appel à un plombier qualifié pour l''installation ou la rénovation de vos canalisations. Vous gagnez en sécurité et tranquillité.

## 5. Pensez à l''entretien régulier

- **Vérifiez vos robinets et joints** → remplacez-les dès les premiers signes d''usure.
- **Surveillez vos compteurs** → une consommation anormale peut révéler une fuite cachée.
- **Purgez vos installations avant l''hiver** pour éviter le gel des tuyaux.

## Conclusion

Prévenir une fuite d''eau, c''est surtout adopter de bonnes habitudes : choisir des matériaux fiables, ne pas surcharger vos canalisations, et faire confiance à des pros.

👉 En cas de doute ou de fuite déjà présente, contactez Mon p''tit Dépanneur au 03 28 53 48 68 pour une intervention rapide et efficace.',
  '/blog-images/prevenir-fuite-eau.webp',
  (SELECT id FROM services WHERE slug = 'plomberie'),
  true,
  now()
);