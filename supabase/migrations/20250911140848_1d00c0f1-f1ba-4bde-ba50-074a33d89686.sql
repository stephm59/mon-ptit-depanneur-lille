-- Create new blog post about installing water softeners
INSERT INTO blog_posts (
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at,
  meta_title,
  meta_description,
  service_id
) VALUES (
  'Pourquoi installer un adoucisseur d''eau chez soi ?',
  'installer-adoucisseur',
  'Découvrez pourquoi installer un adoucisseur d''eau est indispensable : lutte contre le calcaire, économies d''énergie, confort et durabilité des appareils.',
  '## Qu''est-ce qu''un adoucisseur d''eau ?

Un adoucisseur est un appareil qui réduit la dureté de l''eau en éliminant le calcium et le magnésium. Résultat : une eau plus douce, plus agréable, et des installations protégées contre le tartre.

## Les avantages d''un adoucisseur d''eau

### Économies et protection des équipements

- **Économies d''énergie** : moins de calcaire dans les canalisations et appareils = moins de consommation pour chauffer l''eau
- **Appareils protégés** : lave-linge, lave-vaisselle, chaudière, ballon d''eau chaude… tous durent plus longtemps
- **Moins de produits ménagers** : économies sur lessive, shampoing et produits anticalcaires

### Confort au quotidien

- **Peau & cheveux plus doux** : fini les démangeaisons et la sécheresse
- **Textiles plus souples** : serviettes moelleuses, linge qui garde ses couleurs
- **Maison plus facile à nettoyer** : robinets et vitres sans dépôts blanchâtres

## L''inconvénient à connaître

L''eau adoucie contient plus de sodium. Pour les personnes sensibles (hypertension), il est conseillé d''ajouter un osmoseur pour l''eau de boisson.

## Les différents types d''adoucisseurs d''eau

### Adoucisseur avec sel
Échange d''ions calcium/magnésium contre sodium. Très efficace et éprouvé.

### Adoucisseur sans sel
Transforme les minéraux en cristaux non incrustants (aragonite). Plus écologique, mais surtout conditionneur plutôt qu''adoucisseur.

## Et à Lille ?

Dans la région lilloise, l''eau est particulièrement dure (forte teneur en calcaire). Installer un adoucisseur est donc un vrai confort au quotidien… et une économie à long terme.

## Contactez un professionnel

Un adoucisseur doit être bien dimensionné et réglé pour être efficace. L''équipe de Mon P''tit Dépanneur, spécialisée en plomberie, vous conseille et installe l''appareil adapté à votre logement.',
  '/blog-images/installer-adoucisseur.webp',
  true,
  NOW(),
  'Pourquoi installer un adoucisseur d''eau ? | Mon P''tit Dépanneur',
  'Découvrez pourquoi installer un adoucisseur d''eau est indispensable à Lille et dans le Nord : lutte contre le calcaire, économies d''énergie, confort et durabilité des appareils.',
  (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1)
);

-- Create redirect from old URL to new blog URL
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/installer-adoucisseur', '/carnet/installer-adoucisseur', 301);

-- Add FAQ entries for this blog post
INSERT INTO blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES 
(
  (SELECT id FROM blog_posts WHERE slug = 'installer-adoucisseur' LIMIT 1),
  'Quelle est la durée de vie d''un adoucisseur d''eau ?',
  'Un adoucisseur bien entretenu dure entre 15 et 20 ans. L''essentiel est de vérifier régulièrement les réglages et de faire un contrôle annuel.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'installer-adoucisseur' LIMIT 1),
  'Combien coûte l''installation d''un adoucisseur d''eau ?',
  'Le prix dépend du type choisi (avec ou sans sel) et de la taille du foyer. Comptez entre 1 200 € et 3 000 € installation comprise.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'installer-adoucisseur' LIMIT 1),
  'Un adoucisseur change-t-il le goût de l''eau ?',
  'Non, l''eau reste potable et agréable à boire. Certaines personnes sensibles au sodium peuvent compléter avec un osmoseur pour l''eau de boisson.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'installer-adoucisseur' LIMIT 1),
  'Faut-il entretenir un adoucisseur d''eau ?',
  'Oui : nettoyage du bac à sel (si modèle avec sel), vérification des réglages, remplacement de certaines pièces tous les 5-10 ans.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'installer-adoucisseur' LIMIT 1),
  'Est-ce vraiment utile dans la région lilloise ?',
  'Absolument : Lille et le Nord sont connus pour avoir une eau très calcaire. Installer un adoucisseur, c''est protéger vos installations et gagner en confort au quotidien.',
  5
);