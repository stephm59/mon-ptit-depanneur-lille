-- Créer l'article de blog sur la garantie constructeur
INSERT INTO blog_posts (
  service_id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at
) VALUES (
  (SELECT id FROM services WHERE slug = 'chauffage'),
  'Garantie constructeur : pourquoi acheter auprès d''un fournisseur agréé ?',
  'garantie-constructeur-avantages',
  'Découvrez pourquoi la garantie constructeur est essentielle pour vos travaux de plomberie, chauffage ou salle de bains. Durée, conditions et avantages expliqués.',
  'Vous avez fait installer une chaudière, une nouvelle robinetterie ou refait votre salle de bains, et une pièce tombe en panne ?
👉 Pas de panique : c''est là qu''intervient la garantie constructeur, à condition d''avoir acheté vos produits auprès d''un fournisseur agréé.

Voyons pourquoi cette garantie est indispensable pour éviter les mauvaises surprises.

## Qu''est-ce que la garantie constructeur ?

La garantie constructeur est une promesse du fabricant assurant le bon fonctionnement du produit. En France, la loi impose que cette garantie soit communiquée au moment de l''achat (en ligne ou en magasin).

📅 **Durée** : généralement 1 à 2 ans (parfois plus selon les produits).

🔧 **Portée** : pièces de rechange, réparations, parfois remplacement.

💶 **Conditions** : certaines exclusions existent (usure normale, mauvaise utilisation…).

## Pourquoi passer par un fournisseur agréé ?

Acheter une pièce ou un appareil via un fournisseur officiel vous assure que :

✅ Votre garantie constructeur est valide.

✅ Les réparations sont prises en charge directement par le réseau agréé.

✅ Vous gagnez du temps : pas besoin de chercher un intermédiaire.

✅ Vous évitez les mauvaises surprises des pièces contrefaites ou non couvertes.

## Que contient une bonne garantie ?

Lorsque vous consultez la garantie d''un produit, regardez bien :

• La durée de validité (1 an, 2 ans, plus ?).
• Les pièces couvertes et celles exclues.
• Les frais éventuels (déplacement, main-d''œuvre…).
• La procédure d''activation (souvent via le fournisseur).
• Les coordonnées du service client du fabricant.

## Comment activer sa garantie ?

• **Contactez d''abord le fournisseur agréé** : il enclenche la procédure et envoie le produit en réparation si nécessaire.

• **Si besoin, contactez le fabricant directement** via les informations mentionnées sur votre garantie.

👉 **Attention** : avoir une garantie ne signifie pas un remboursement automatique. Le fabricant peut proposer d''abord une réparation avant un remplacement.

## Exemple concret

Un chauffe-eau acheté sur un site non agréé tombe en panne. **Résultat** : pas de prise en charge du fabricant, pièces introuvables, délai rallongé.

À l''inverse, en passant par un fournisseur agréé, le technicien active la garantie, commande la pièce d''origine et résout le problème en quelques jours.

## En résumé

La garantie constructeur est un atout **sécurité + tranquillité d''esprit** :

• Vous êtes certain que le produit est couvert.
• Vous bénéficiez d''un SAV officiel.
• Vous gagnez du temps en cas de panne.

Chez Mon P''tit Dépanneur, tous nos produits (plomberie, chauffage, salle de bains) sont fournis par des distributeurs agréés et bénéficient de leur garantie constructeur.

📞 **Besoin d''un conseil ou d''une installation ?** Appelez-nous au 03 28 53 48 68.',
  '/blog-images/garantie-constructeur.webp',
  true,
  now()
);

-- Créer les FAQs pour cet article
INSERT INTO blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES 
(
  (SELECT id FROM blog_posts WHERE slug = 'garantie-constructeur-avantages'),
  'Quelle est la durée classique d''une garantie constructeur ?',
  'En moyenne, une garantie constructeur dure entre 1 et 2 ans, mais certains fabricants proposent des extensions plus longues.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'garantie-constructeur-avantages'),
  'Si j''achète ma chaudière sur internet, la garantie est-elle valable ?',
  'Seulement si le site est un revendeur agréé par le fabricant. Sinon, vous risquez de ne pas être couvert par la garantie constructeur.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'garantie-constructeur-avantages'),
  'Que couvre la garantie constructeur ?',
  'La garantie couvre les défauts de fabrication ou de fonctionnement. Elle n''inclut pas l''usure normale ni les dommages liés à une mauvaise utilisation.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'garantie-constructeur-avantages'),
  'Puis-je demander un remboursement directement ?',
  'Pas toujours : le fabricant peut choisir de réparer le produit en premier lieu. Le remboursement intervient seulement si la réparation n''est pas possible.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'garantie-constructeur-avantages'),
  'Mon installateur doit-il être agréé pour activer la garantie ?',
  'Oui, l''installation doit être réalisée par un professionnel qualifié, et parfois certifié RGE, pour garantir la validité de la garantie constructeur.',
  5
);

-- Créer la redirection de l'ancienne URL vers la nouvelle
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/avantages-garantie-constructeur', '/carnet/garantie-constructeur-avantages', 301);