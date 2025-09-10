-- Insert blog post: Comment purger un radiateur étape par étape
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
  'comment-purger-radiateurs',
  'Comment purger un radiateur étape par étape ? Guide pratique',
  'Radiateur froid en haut ? Découvrez comment purger vos radiateurs simplement pour améliorer le confort, économiser de l''énergie et prolonger la durée de vie de votre chauffage.',
  'Comment purger vos radiateurs (et retrouver une chaleur optimale) ?

Un radiateur chaud en bas mais froid en haut ? C''est le signe qu''il y a de l''air coincé dans votre circuit de chauffage. La solution est simple et rapide : purger vos radiateurs.

Mon p''tit Dépanneur vous explique pourquoi c''est nécessaire, comment le faire pas à pas, et quand il vaut mieux appeler un pro.

## 1. Pourquoi faut-il purger les radiateurs ?

🔥 **Confort thermique** : l''air emprisonné empêche l''eau chaude de circuler correctement, d''où les zones froides.

💶 **Économies d''énergie** : un radiateur mal purgé consomme plus pour chauffer moins.

⏳ **Durée de vie du système** : purger régulièrement évite les surcharges de pression et préserve la chaudière.

👉 À faire au moins une fois par an, idéalement avant la saison de chauffe (septembre-octobre).

## 2. Comment purger un radiateur : le guide pas à pas

1. **Éteignez la chaudière** et laissez les radiateurs refroidir.

2. **Munissez-vous d''une clé de purge** (ou d''un tournevis plat selon le modèle).

3. **Placez un récipient** sous la vis de purge (haut ou côté du radiateur).

4. **Tournez doucement la vis** → un sifflement se fait entendre : c''est l''air qui s''échappe.

5. **Laissez couler** jusqu''à ce qu''un filet d''eau régulier sorte.

6. **Refermez la vis**.

7. **Répétez l''opération** sur tous les radiateurs.

👉 **Astuce** : commencez par les radiateurs du rez-de-chaussée, puis remontez à l''étage.

## 3. Vérifier la pression du circuit après purge

Une fois vos radiateurs purgés, la pression de la chaudière peut baisser. Vérifiez le manomètre (souvent sur la façade).

**La pression idéale** : entre 1 et 2 bars.

**Si elle est trop basse** : ouvrez doucement la vanne de remplissage (près de la chaudière) jusqu''à retrouver la bonne valeur.

## 4. Quand faire appel à un professionnel ?

Si malgré vos purges vos radiateurs chauffent mal, ou si la pression baisse trop vite, il peut y avoir un problème plus complexe (circulateur, vase d''expansion, fuite invisible…).

👉 Dans ce cas, contactez **Mon p''tit Dépanneur** : nos techniciens interviennent rapidement à Lille et alentours pour diagnostiquer et réparer.

📞 **Pour un entretien ou une intervention** : 03 28 53 48 68.',
  '/blog-images/comment-purger-radiateurs.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'chauffage' LIMIT 1)
);