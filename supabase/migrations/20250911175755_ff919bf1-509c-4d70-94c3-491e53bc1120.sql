-- Create blog post about tube bending (cintrage)
INSERT INTO blog_posts (
  slug,
  title,
  content,
  excerpt,
  cover_image_url,
  meta_title,
  meta_description,
  published,
  published_at,
  service_id
) VALUES (
  'cintrage',
  'Qu''est-ce qu''un cintrage et comment le réaliser ?',
  'Le cintrage est une opération qui consiste à déformer un tube ou une barre pour lui donner un angle ou un rayon précis. Cette technique est incontournable en plomberie, chauffage ou climatisation lorsqu''il faut adapter les tuyaux au réseau existant.

👉 Mon p''tit Dépanneur vous explique les différents types de cintrage, les outils nécessaires et les méthodes les plus utilisées.

## Les tubes en cuivre : à connaître avant de cintrer

Le cuivre est le matériau le plus fréquemment cintré en plomberie. On distingue :

• **Tube écroui** : rigide, vendu en barres (2 à 5 m)
• **Tube recuit** : semi-rigide, vendu en couronnes (20 à 50 m)
• **Tube gainé (pré-gainé)** : entouré d''une gaine PVC, utilisé pour planchers chauffants

👉 Le cintrage se fait principalement sur le cuivre recuit, plus souple.

## Les outils de cintrage

• **Pince à cintrer (ou cintrette)** : outil manuel avec galet, adapté aux petits diamètres
• **Cintreuse arbalète** : action mécanique ou hydraulique, ressemble à une arbalète
• **Cintreuse hydraulique / électro-hydraulique** : idéale pour gros diamètres, sans effort
• **Cintreuse à mandrin** : permet un cintrage précis des tubes fins sans les écraser
• **Cintreuse d''établi** : utilisée par les pros pour un cintrage régulier
• **Cintreuse électroportative** : polyvalente, efficace pour cuivre, multicouche et grands diamètres

## Les deux techniques de cintrage manuel

### 🔹 Le cintrage au sable fin

• **Boucher une extrémité** du tube
• **Remplir de sable sec** et tapoter pour le compacter
• **Chauffer au chalumeau** en tordant progressivement autour d''un gabarit
• **Vider le sable** et nettoyer le tube

👉 Technique traditionnelle, aujourd''hui réservée à des cas particuliers.

### 🔹 Le cintrage avec ressort

• **Choisir un ressort** adapté au diamètre du tube recuit
• **Glisser le tube** dedans
• **Courber progressivement** à la main
• **Retirer le ressort** une fois le cintrage terminé

👉 Simple, économique et efficace pour éviter l''ovalisation du tube.

## Ce qu''il faut maîtriser pour un cintrage réussi

Avant de plier, prenez en compte :

• **Le rayon de cintrage**
• **Le diamètre interne et externe** du tube
• **L''épaisseur et la résistance** du matériau
• **La longueur avant et après** cintrage
• **L''élasticité du cuivre**

⚠️ Un mauvais cintrage peut écraser le tube ou réduire son diamètre, entraînant des pertes de pression.

## Conclusion

Le cintrage est une opération délicate qui demande précision et méthode. Que vous utilisiez une pince, une cintreuse hydraulique ou un simple ressort, respectez toujours le rayon et l''angle pour éviter toute déformation.

👉 Pas sûr de réussir le cintrage seul ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68 : nos plombiers sont équipés pour un travail rapide, propre et sécurisé.',
  'Le cintrage consiste à déformer un tube pour lui donner un angle précis. Découvrez les outils (pince, cintreuse), techniques (sable, ressort) et précautions à prendre.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/cintrage.webp',
  'Cintrage de tube : définition, techniques et outils',
  'Découvrez comment réaliser un cintrage de tube : outils (pince, cintreuse), méthodes (sable, ressort), précautions et conseils pratiques. Guide Mon p''tit Dépanneur.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'plomberie')
);

-- Create FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
(
  (SELECT id FROM blog_posts WHERE slug = 'cintrage'),
  'Qu''est-ce que le cintrage d''un tube ?',
  'C''est l''action de plier un tube (cuivre, acier, multicouche) pour lui donner un rayon ou un angle précis.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'cintrage'),
  'Quel tube choisir pour cintrer ?',
  'Le cuivre recuit est le plus adapté car il est semi-rigide et se cintre facilement.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'cintrage'),
  'Quels outils utiliser pour cintrer un tube de cuivre ?',
  'Selon le diamètre : pince à cintrer, cintreuse arbalète, cintreuse hydraulique ou ressort.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'cintrage'),
  'Quelle est la différence entre cintrage au sable et cintrage au ressort ?',
  'Au sable : on chauffe le tube rempli de sable compacté → plus technique. Au ressort : plus simple, manuel, sans chauffage.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'cintrage'),
  'Puis-je cintrer un tube moi-même ?',
  'Oui, pour de petits diamètres avec une pince ou un ressort. Pour des cintrages complexes, il vaut mieux confier à un pro.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'cintrage'),
  'Quels sont les risques d''un mauvais cintrage ?',
  'Écrasement du tube, réduction du débit d''eau, fuites ou fissures.',
  6
);