-- Insert the toilet flush repair blog post
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
  'Au secours : ma chasse d''eau ne fonctionne plus !',
  'au-secours-ma-chasse-deau-ne-fonctionne-plus',
  'Flotteur défaillant, joint usé, mécanisme de chasse d''eau bloqué ? Découvrez nos conseils pratiques pour réparer facilement vos toilettes ou faire appel à Mon p''tit Dépanneur.',
  'Une chasse d''eau en panne, et c''est toute la maison qui est perturbée 🚽. Pas de panique : le mécanisme est simple, et dans bien des cas, vous pouvez résoudre le problème vous-même.

Voici un petit guide signé Mon p''tit Dépanneur pour réparer les pannes les plus courantes : flotteur bloqué, joint abîmé ou mécanisme défectueux.

## 1. Réparer un flotteur défaillant

Le flotteur contrôle le niveau d''eau dans le réservoir.

**Premier réflexe** : vérifiez qu''il n''est pas entartré. S''il l''est, démontez-le et nettoyez-le au vinaigre blanc chaud ou à l''anticalcaire, puis replacez-le.

**Si le flotteur est endommagé** : il faut le remplacer.
👉 **Étapes** : couper l''arrivée d''eau, vider le réservoir, démonter l''ancien flotteur et installer le nouveau.

## 2. Changer le joint du mécanisme de chasse d''eau

Un joint abîmé peut provoquer des fuites continues.
👉 **Étapes** :

- fermez l''arrivée d''eau et videz le réservoir,
- démontez le mécanisme de chasse d''eau (quart de tour),
- retirez et nettoyez le joint,
- remplacez-le si nécessaire, puis remontez le tout.

## 3. Vérifier l''installation

Une fois le flotteur et/ou le joint réparés :

- remettez l''eau,
- tirez la chasse,
- observez.

Si la fuite persiste → il faudra probablement remplacer l''ensemble du mécanisme (vendu en kit dans le commerce).

## Conclusion

Réparer une chasse d''eau est souvent une opération simple qui évite gaspillage d''eau et facture salée 💧.

📞 Si vous préférez confier la réparation à un pro, appelez Mon p''tit Dépanneur au **03 28 53 48 68** : nos plombiers interviennent rapidement et efficacement.',
  '/blog-images/chasse-eau.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1)
);