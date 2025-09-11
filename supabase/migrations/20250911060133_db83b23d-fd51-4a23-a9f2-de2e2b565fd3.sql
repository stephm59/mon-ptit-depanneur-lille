-- Créer le service "vitre" s'il n'existe pas
INSERT INTO services (name, slug, description, published)
VALUES ('Vitre', 'vitre', 'Remplacement et réparation de vitrages', true)
ON CONFLICT (slug) DO NOTHING;

-- Créer l'article de blog sur les gaz dans les vitrages
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
  (SELECT id FROM services WHERE slug = 'vitre'),
  'Gaz dans les vitrages : pourquoi et quels avantages ?',
  'gaz-dans-vitrages-quelle-utilite',
  'Découvrez pourquoi vos fenêtres contiennent du gaz (argon, krypton, xénon) et comment cela améliore l''isolation thermique et acoustique de votre logement.',
  'Vous avez peut-être entendu dire que certaines fenêtres contiennent… du gaz ! Cela peut sembler surprenant, mais c''est une technique courante pour améliorer l''isolation thermique et acoustique de votre logement. Dans cet article, Mon P''tit Dépanneur vous explique pourquoi ces gaz (argon, krypton, xénon) sont utilisés et quels avantages ils apportent.

## Pourquoi injecter du gaz dans les vitrages ?

Dans les fenêtres à double ou triple vitrage, l''air est remplacé par un gaz spécial. L''objectif est simple : limiter les pertes de chaleur et renforcer l''isolation.

👉 Ces gaz (appelés gaz nobles) sont incolores, inodores et non toxiques.
👉 Ils sont plus denses que l''air, ce qui ralentit les mouvements de convection et réduit les déperditions thermiques.

**Résultat** : des fenêtres plus performantes et un meilleur confort au quotidien.

## Quels gaz sont utilisés ?

• **L''argon** : le plus répandu, car il offre un excellent rapport qualité/prix.

• **Le krypton** : plus performant que l''argon, surtout pour les triples vitrages, mais plus coûteux.

• **Le xénon** : très efficace mais très cher, réservé aux vitrages haut de gamme.

## Les avantages des vitrages au gaz

✅ **Meilleure isolation thermique** : vous gardez la chaleur en hiver et la fraîcheur en été.
✅ **Confort acoustique** : les ondes sonores passent plus difficilement.
✅ **Économies d''énergie** : moins besoin de chauffer ou de climatiser → factures réduites.
✅ **Moins de condensation** : le gaz, combiné à une bonne étanchéité, limite l''apparition de buée.
✅ **Sécurité et écologie** : l''argon est totalement sûr et déjà présent dans l''atmosphère.

## Y a-t-il des inconvénients ?

Le seul point à surveiller est la durée de vie : le gaz finit par s''échapper très lentement (environ 10 % sur 20 ans). Mais si vos fenêtres sont bien fabriquées et bien scellées, cette perte est minime et n''affecte pas leurs performances.

## Le secret d''une isolation réussie

**Attention** : le gaz seul ne suffit pas. L''efficacité dépend aussi :

• du type de verre choisi (faible émissivité, protection solaire, etc.),
• du matériau du bâti (bois, PVC, aluminium, ou mixte),
• et bien sûr d''une pose professionnelle.

C''est l''équilibre entre tous ces éléments qui garantit une isolation optimale.

## En conclusion

Les vitrages au gaz, surtout avec de l''argon, représentent aujourd''hui la norme pour une maison confortable et économe en énergie. Si vous envisagez de remplacer vos fenêtres, faites appel à un professionnel pour bénéficier de produits de qualité, bien scellés et correctement installés.

👉 Chez Mon P''tit Dépanneur, nous vous accompagnons dans vos projets de rénovation pour améliorer votre confort et réduire vos factures. **Contactez-nous !**',
  '/blog-images/gaz-vitre.webp',
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
  (SELECT id FROM blog_posts WHERE slug = 'gaz-dans-vitrages-quelle-utilite'),
  'Pourquoi met-on du gaz dans le double vitrage ?',
  'Pour améliorer l''isolation thermique et acoustique. Les gaz nobles comme l''argon sont plus denses que l''air, ce qui limite les pertes de chaleur.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'gaz-dans-vitrages-quelle-utilite'),
  'Quel est le meilleur gaz pour les vitrages ?',
  'L''argon est le plus courant grâce à son excellent rapport qualité/prix. Le krypton et le xénon offrent de meilleures performances mais sont plus chers.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'gaz-dans-vitrages-quelle-utilite'),
  'Le gaz dans les fenêtres est-il dangereux ?',
  'Non, il s''agit de gaz inertes, incolores, inodores et non toxiques. En cas de fuite, il n''y a aucun risque pour la santé ou l''environnement.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'gaz-dans-vitrages-quelle-utilite'),
  'Le gaz s''échappe-t-il avec le temps ?',
  'Oui, mais très lentement (environ 10 % sur 20 ans). Avec une bonne qualité de fabrication et un joint bien étanche, les performances restent stables.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'gaz-dans-vitrages-quelle-utilite'),
  'Changer mes fenêtres au gaz va-t-il réduire ma facture ?',
  'Oui, une meilleure isolation réduit les besoins en chauffage et en climatisation, ce qui se traduit par des économies d''énergie significatives.',
  5
);

-- Créer la redirection de l'ancienne URL vers la nouvelle
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/gaz-dans-vitrages-quelle-utilite', '/carnet/gaz-dans-vitrages-quelle-utilite', 301);