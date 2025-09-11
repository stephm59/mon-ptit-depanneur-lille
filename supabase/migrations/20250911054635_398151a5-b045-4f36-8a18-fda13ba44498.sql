-- Créer le service "serrure" s'il n'existe pas
INSERT INTO services (name, slug, description, published)
VALUES ('Serrure', 'serrure', 'Dépannage et réparation de serrures', true)
ON CONFLICT (slug) DO NOTHING;

-- Créer l'article de blog sur les frais de serrurier
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
  (SELECT id FROM services WHERE slug = 'serrure'),
  'Frais de serrurier : locataire ou propriétaire, qui paie ?',
  'frais-serrurier-locataire-proprietaire',
  'Serrure cassée, clé perdue, porte claquée... Qui doit payer les frais de serrurier, le locataire ou le propriétaire ? Découvrez ce que dit la loi et nos conseils pratiques.',
  '# Frais de serrurier : locataire ou propriétaire, qui paie ?

Clé cassée, porte claquée, serrure bloquée… C''est une question que beaucoup de locataires (et de propriétaires !) se posent : qui doit payer les frais de serrurier ?

👉 La réponse dépend de la cause de la panne et de ce que prévoit la loi. Voyons cela en détail.

## Que dit la loi ?

La loi du 6 juillet 1989 (article 7) précise que :

• Le locataire doit assurer l''entretien courant et les petites réparations,
• Le propriétaire prend en charge les grosses réparations et le remplacement dû à la vétusté.

En clair : 
• si la serrure se bloque à cause d''un manque d''entretien ou d''une mauvaise utilisation → c''est au locataire de payer.
• Si la serrure est usée par le temps ou défectueuse → c''est au propriétaire d''assumer.

## Quelques cas concrets

🔑 **Perte ou vol de clés** → frais à la charge du locataire.

🚪 **Porte claquée accidentellement** → frais du locataire.

🔧 **Serrure grippée faute de lubrification** → frais du locataire.

⏳ **Serrure vétuste ou défectueuse** (usure normale) → frais du propriétaire.

🏠 **Serrure endommagée lors d''une effraction** → généralement pris en charge par l''assurance habitation (locataire ou propriétaire selon le contrat).

## Combien ça coûte ?

Le prix d''une intervention de serrurier varie selon la panne :

• **Dépannage simple** (porte claquée) : 90 à 150 €.
• **Remplacement d''un cylindre standard** : 100 à 250 €.
• **Serrure multipoints haut de gamme** : 300 à 600 €.

💡 **Astuce** : vérifiez toujours votre contrat d''assurance habitation. Certaines garanties couvrent les frais de serrurerie.

## Bonnes pratiques pour éviter les litiges

📑 **Vérifier l''état des serrures** lors de l''état des lieux d''entrée.

🛠️ **Entretenir régulièrement** (lubrification, resserrage des vis).

🤝 **Privilégier la transparence** : si vous êtes responsable, assumez → vous éviterez des conflits avec le propriétaire.

## En résumé

• **Locataire** : responsable de l''entretien courant et des clés.
• **Propriétaire** : responsable du remplacement dû à l''usure normale.
• **Assurance** : peut couvrir en cas d''effraction.

👉 Que vous soyez locataire ou propriétaire, si vous avez besoin d''une intervention rapide, l''équipe de Mon P''tit Dépanneur est disponible 7j/7 pour vous aider.

📞 **Appelez-nous au 03 28 53 48 68.**',
  '/blog-images/frais-serrure.webp',
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
  (SELECT id FROM blog_posts WHERE slug = 'frais-serrurier-locataire-proprietaire'),
  'Le locataire doit-il payer si la clé se casse dans la serrure ?',
  'Oui, car il s''agit d''une mauvaise utilisation ou d''un accident courant. Les frais sont donc à la charge du locataire.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'frais-serrurier-locataire-proprietaire'),
  'Qui paie si la serrure est vieille et ne fonctionne plus ?',
  'C''est au propriétaire de prendre en charge son remplacement, car il s''agit d''un défaut lié à la vétusté.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'frais-serrurier-locataire-proprietaire'),
  'En cas d''effraction, qui règle les frais ?',
  'Les frais sont généralement couverts par l''assurance habitation, qu''elle soit souscrite par le locataire ou le propriétaire selon le contrat.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'frais-serrurier-locataire-proprietaire'),
  'Une porte claquée avec les clés à l''intérieur : à qui revient la facture ?',
  'C''est au locataire de payer, car ce n''est pas lié à la vétusté de la serrure mais à un incident courant.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'frais-serrurier-locataire-proprietaire'),
  'Peut-on se faire rembourser les frais de serrurier ?',
  'Oui, si votre contrat d''assurance habitation inclut une garantie dépannage d''urgence, une partie ou la totalité des frais peut être prise en charge.',
  5
);

-- Créer la redirection de l'ancienne URL vers la nouvelle
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/frais-serrurier-locataire-proprietaire', '/carnet/frais-serrurier-locataire-proprietaire', 301);