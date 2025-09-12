-- Insert new blog post about reading water meter
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
  'Comment lire son compteur d''eau ?',
  'lecture-compteur-eau',
  'Apprenez à lire un compteur d''eau (volume ou vitesse) avec des exemples concrets. Découvrez comment calculer votre consommation, vérifier vos factures et repérer une fuite.',
  'Votre facture d''eau a augmenté et vous voulez mieux comprendre vos consommations ?
La lecture du compteur d''eau peut sembler compliquée, mais avec quelques explications et exemples concrets, vous saurez déchiffrer vos chiffres comme un pro.

👉 Mon p''tit Dépanneur vous explique pas à pas.

## Les deux types de compteurs d''eau

### 1. Le compteur d''eau « volume »

Il possède deux cadrans :

• **Chiffres blancs sur fond noir** → indiquent la consommation en m³ (c''est ce qui est facturé).

• **Chiffres blancs sur fond rouge** (ou rouges sur fond blanc) → indiquent les litres ou décilitres, utiles pour une lecture plus précise mais non utilisés pour la facturation.

🔎 **Exemple concret :**

Affichage : 05384256

• Les 4 premiers chiffres (0538) = 538 m³ consommés → ce sera le montant facturé.

• Les chiffres rouges (4256) = 425,6 litres consommés supplémentaires, soit 0,42 m³.

👉 **Votre consommation totale = 538,42 m³.**

### 2. Le compteur d''eau « vitesse »

Ce modèle affiche uniquement les m³ consommés (chiffres blancs sur fond noir).
Il est souvent accompagné de petits cadrans à aiguilles, qui mesurent plus finement :

• 1ère aiguille (gauche) → décilitres,

• 2ème → litres,

• 3ème → décalitres,

• 4ème (droite) → hectolitres.

🔎 **Exemple concret :**

• Le compteur indique 000356 → soit 356 m³ consommés.

• L''aiguille des litres est sur 7 → +7 litres.

• L''aiguille des décilitres est sur 3 → +0,3 litre.

👉 **Votre consommation totale = 356,307 m³.**

## Comment calculer sa consommation d''eau ?

• Relevez les chiffres noirs (m³) à une date précise.

• Relevez-les à nouveau plus tard (ex : un mois après).

• Faites la différence → vous obtenez la consommation en m³ sur la période.

💡 **Pour estimer le montant à payer :** multipliez votre consommation par le prix du m³ appliqué par votre fournisseur.

## Consommation moyenne et repères utiles

En France, la consommation moyenne est de **40 m³/an par personne** (soit 40 000 litres).
Voici quelques ordres d''idées :

• 🚽 WC → 6 à 12 litres par chasse,

• 🍽 Vaisselle à la main → 10 à 30 litres,

• 🧼 Lave-vaisselle → 20 à 40 litres,

• 🚿 Douche → 30 à 100 litres,

• 🛁 Bain → 75 à 200 litres,

• 👕 Lave-linge → 80 à 140 litres,

• 🚗 Lavage voiture → env. 200 litres,

• 🌱 Arrosage jardin → 1000 à 2000 litres/heure.

## Conclusion

Lire son compteur d''eau n''est pas si compliqué une fois que l''on comprend les cadrans.
Cela permet de suivre sa consommation, détecter les fuites et éviter les mauvaises surprises sur la facture.

📞 Besoin d''aide pour un diagnostic de fuite ou un contrôle ? Contactez Mon p''tit Dépanneur au **03 28 53 48 68**.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/lire-compteur-eau.webp',
  true,
  'Comment lire un compteur d''eau : guide et exemples concrets',
  'Découvrez comment lire un compteur d''eau (volume ou vitesse), interpréter les chiffres noirs et rouges, calculer votre consommation et vérifier vos factures.'
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
  ('Comment savoir si mon compteur indique des litres ou des m³ ?', 'Les chiffres sur fond noir indiquent toujours les m³. Les rouges (ou cadrans à aiguilles) précisent litres et décilitres.', 1),
  ('Quelle est la consommation d''eau moyenne par personne ?', 'Environ 40 m³/an, soit 110 litres par jour.', 2),
  ('Comment vérifier une fuite avec mon compteur ?', 'Relevez les chiffres le soir, ne consommez pas d''eau la nuit, comparez le matin : si le compteur a bougé, il y a une fuite.', 3),
  ('Puis-je lire mon compteur moi-même pour contrôler ma facture ?', 'Oui, c''est même conseillé pour comparer vos consommations aux relevés du fournisseur.', 4),
  ('Quelle différence entre compteur « volume » et compteur « vitesse » ?', 'Le volume affiche m³ + litres (chiffres noirs et rouges), le vitesse affiche uniquement les m³ et des cadrans à aiguilles pour le détail.', 5)
) AS faq(question, answer, position)
WHERE bp.slug = 'lecture-compteur-eau';