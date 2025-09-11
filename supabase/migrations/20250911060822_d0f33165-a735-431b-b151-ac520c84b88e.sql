-- Create service "Serrure" if it doesn't exist
INSERT INTO services (name, slug, description, published)
VALUES ('Serrure', 'serrure', 'Installation, réparation et sécurisation de serrures', true)
ON CONFLICT (slug) DO NOTHING;

-- Insert the blog post
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
  'Comment augmenter la sécurité de sa porte d''entrée ?',
  'augmenter-securite-porte',
  'Découvrez nos conseils pour sécuriser votre porte : cylindre de sécurité, double serrure, alarme intégrée ou porte blindée.',
  'Vous souhaitez renforcer la sécurité de votre porte d''entrée mais vous ne savez pas par où commencer ? Entre cambriolages et tentatives d''intrusion, il est normal de vouloir protéger efficacement son logement. Voici les principales solutions pour sécuriser votre maison ou appartement.

## 1. Renforcer la serrure existante avec un cylindre de sécurité

La serrure est la première cible des cambrioleurs. Un cylindre classique se perce ou se crochette en quelques secondes. En installant un cylindre de sécurité certifié (anti-perçage, anti-crochetage, anti-bumping), vous augmentez considérablement la résistance de votre porte.

👉 **Résultat** : un cambrioleur mettra beaucoup plus de temps et fera du bruit, ce qui décourage la plupart d''entre eux.

## 2. Installer une deuxième serrure

Ajouter une seconde serrure double le temps nécessaire pour forcer la porte. Vous pouvez aussi opter pour un système avec passe-partout (une seule clé pour les deux serrures), pratique et plus sûr.

👉 **Résultat** : environ 40 minutes pour un cambrioleur équipé d''outils électriques.

## 3. Installer un système de détection anticipée

Certaines serrures modernes intègrent un système d''alarme. Dès qu''un intrus tente de manipuler la serrure, une sirène se déclenche et vous pouvez même être alerté par SMS ou appel.

👉 **Résultat** : le cambrioleur est repéré avant même d''ouvrir la porte, et prend la fuite dans la majorité des cas.

## 4. Passer à une porte blindée ou de sécurité

Si votre logement est situé dans une zone sensible ou si vous souhaitez un maximum de tranquillité, l''installation d''une porte blindée est la meilleure option.

👉 **Résultat** : un cambrioleur mettra jusqu''à 2 heures pour la forcer, avec des outils lourds et bruyants.

## 5. Protéger une résidence secondaire contre le squat

Si vous possédez une maison de vacances ou un logement vide, le risque de squat est réel. Dans ce cas, renforcer la serrure ou installer une porte blindée permet d''éviter le remplacement frauduleux de votre serrure par des squatteurs.

## En résumé

Le choix dépend de votre situation :

- **Appartements en ville** → cylindre de sécurité + deuxième serrure
- **Maisons isolées** → serrure sécurisée + porte blindée  
- **Résidences secondaires** → systèmes anti-squat renforcés

Et bien sûr, si vous préférez confier l''installation à des experts, l''équipe de Mon P''tit Dépanneur est là pour vous conseiller et sécuriser votre logement.

📞 **Contactez-nous au 03 28 53 48 68 pour un devis gratuit.**',
  '/blog-images/securite-porte.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'serrure')
);

-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
VALUES 
  (
    (SELECT id FROM blog_posts WHERE slug = 'augmenter-securite-porte'),
    'Comment savoir si ma serrure est sécurisée ?',
    'Une serrure sécurisée doit être certifiée A2P (1 à 3 étoiles) et résister aux techniques d''effraction courantes (perçage, crochetage, bumping).',
    1
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'augmenter-securite-porte'),
    'Est-ce que deux serrures valent mieux qu''une ?',
    'Oui. Deux serrures de qualité augmentent fortement le temps nécessaire pour ouvrir une porte, ce qui décourage la majorité des cambrioleurs.',
    2
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'augmenter-securite-porte'),
    'Une porte blindée est-elle indispensable ?',
    'Pas toujours. Pour un appartement en étage, une serrure renforcée peut suffire. En revanche, pour une maison ou une résidence isolée, la porte blindée est fortement conseillée.',
    3
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'augmenter-securite-porte'),
    'Combien coûte le renforcement d''une porte ?',
    'Un cylindre de sécurité coûte entre 100 et 300 €, une serrure complète entre 300 et 700 €, et une porte blindée à partir de 1 500 €.',
    4
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'augmenter-securite-porte'),
    'Puis-je installer moi-même un cylindre ou une serrure ?',
    'Certains cylindres se remplacent facilement, mais pour une installation sécurisée (porte blindée, système d''alarme intégré), mieux vaut faire appel à un professionnel.',
    5
  );

-- Add redirect
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/augmenter-securite-porte', '/carnet/augmenter-securite-porte', 301);