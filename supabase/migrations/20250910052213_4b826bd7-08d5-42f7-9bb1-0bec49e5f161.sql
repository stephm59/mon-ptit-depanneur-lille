-- Insert blog post: Comment se préparer aux variations de température (plomberie)
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
  'variation-temperatures-plomberie',
  'Comment se préparer aux variations de température ? (plomberie)',
  'L''automne s''installe avec son lot de pluie, humidité et baisses de température. Découvrez 6 réflexes simples pour protéger vos installations de plomberie.',
  'Comment se préparer aux variations de température ? (plomberie)

L''automne s''installe avec son lot de pluie, humidité et baisses de température. Et qui dit changement de saison dit aussi risques pour vos installations de plomberie : tuyaux gelés, gouttières bouchées, chauffe-eau fatigué…

Pas de panique ! Voici 6 réflexes simples proposés par **Mon p''tit Dépanneur** pour passer l''automne (et l''hiver) sans mauvaise surprise.

## 1. Protégez vos tuyaux extérieurs

L''eau gelée peut faire éclater les canalisations.

👉 **Avant l''hiver** :
- fermez les vannes d''arrêt des robinets extérieurs,
- vidangez les tuyaux,
- installez éventuellement une protection isolante sur les parties exposées.

## 2. Nettoyez vos gouttières

Les feuilles mortes s''accumulent vite et bouchent les descentes. Résultat : débordements d''eau, infiltration dans les murs et humidité dans la maison.

👉 **Pensez à** :
- nettoyer vos gouttières régulièrement,
- vérifier que l''eau s''écoule bien jusqu''au sol.

## 3. Inspectez votre chauffe-eau

Avec le froid, la demande en eau chaude augmente.

👉 **Profitez de l''automne pour vérifier** :
- l''état général du chauffe-eau,
- la température de réglage (autour de 55 °C pour éviter le calcaire et la légionellose),
- la présence éventuelle de fuites ou dépôts de tartre.

## 4. Contrôlez vos joints et siphons

Les variations de température fragilisent les joints. Un petit suintement aujourd''hui peut devenir une vraie fuite demain.

👉 **Inspectez** éviers, lavabos, baignoires et remplacez les joints usés.

## 5. Vérifiez votre pompe de relevage (si vous en avez une)

En cas de fortes pluies, une pompe de relevage évite les inondations. Assurez-vous qu''elle fonctionne correctement avant que les pluies d''automne ne s''intensifient.

## 6. Faites inspecter votre chaudière

Votre chaudière est sollicitée dès les premiers froids. Un entretien régulier garantit :
- la sécurité (pas de risques de CO ou panne de gaz),
- le rendement énergétique,
- la longévité de l''appareil.

👉 **Planifiez son entretien avant l''hiver.**

## Conclusion

Un entretien préventif de votre plomberie et de vos équipements vous évite bien des tracas : pas de fuite, pas de tuyau éclaté, pas de panne surprise.

📞 **Besoin d''aide ?** Contactez **Mon p''tit Dépanneur** au **03 28 53 48 68** pour un entretien ou une réparation rapide dans la métropole lilloise.',
  '/blog-images/variation-temperatures-plomberie.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1)
);