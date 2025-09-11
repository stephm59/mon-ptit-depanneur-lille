-- Insert blog post for raccord diélectrique
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
  'cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f', -- Plombier service ID
  'Qu''est-ce qu''un raccord diélectrique ? | Mon P''tit Dépanneur',
  'raccord-dielectrique',
  'Découvrez l''utilité d''un raccord diélectrique : un petit élément essentiel pour éviter la corrosion et protéger vos installations de plomberie et chauffage.',
  '# Qu''est-ce qu''un raccord diélectrique et pourquoi est-il indispensable ?

Savez-vous à quoi sert un raccord diélectrique ?
Petit par la taille, mais essentiel pour vos installations, il joue un rôle clé dans la protection de vos équipements contre la corrosion. Dans cet article, nous vous expliquons son utilité, son fonctionnement et dans quels cas il est indispensable.

## Pourquoi utiliser un raccord diélectrique ?

Lorsque deux métaux différents (comme le cuivre, l''acier ou l''aluminium) sont reliés dans une installation de plomberie ou de chauffage, une réaction électrolytique peut apparaître. Résultat : oxydation prématurée, fuites et dégradation de vos équipements.

👉 Le raccord diélectrique agit comme une barrière isolante. Grâce à une zone interne en téflon, il empêche le contact direct entre les métaux et bloque la réaction électrochimique.

## Dans quels cas installer un raccord diélectrique ?

### Lors du remplacement ou de la rénovation de radiateurs

Anciennes installations souvent en fer.

Les nouveaux radiateurs en aluminium ou cuivre doivent être isolés du circuit existant pour éviter la corrosion.

### Lors du remplacement d''une chaudière, d''un ballon ou d''un cumulus

Selon les matériaux utilisés dans le réservoir et les canalisations, un raccord diélectrique doit être posé sur les arrivées d''eau chaude pour protéger durablement l''installation.

## Les avantages concrets

✅ Protège vos équipements (chaudière, ballon, radiateurs) contre la corrosion.
✅ Évite les fuites et les réparations coûteuses.
✅ Prolonge la durée de vie de toute l''installation.
✅ Installation simple et rapide par un professionnel.

## En résumé

Le raccord diélectrique est un petit investissement qui évite de gros problèmes. Discret, mais indispensable, il garantit la durabilité de vos installations de chauffage et de plomberie.

Vous avez un doute ou besoin d''une installation fiable ?
👉 Contactez Mon P''tit Dépanneur : nos plombiers expérimentés sauront sécuriser vos équipements avec des raccords adaptés et de qualité.',
  '/blog-images/raccord-dielectrique.webp',
  true,
  NOW()
);

-- Get the blog post ID for FAQs
WITH new_blog_post AS (
  SELECT id FROM blog_posts WHERE slug = 'raccord-dielectrique'
)
-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  new_blog_post.id,
  question,
  answer,
  position
FROM new_blog_post, (VALUES
  ('Est-ce obligatoire d''installer un raccord diélectrique ?', 'Oui, il est obligatoire dans certaines configurations (notamment sur les ballons d''eau chaude et chaudières) pour éviter la corrosion électrolytique. Sans lui, vous risquez d''abîmer vos installations beaucoup plus vite.', 1),
  ('Quels équipements nécessitent un raccord diélectrique ?', 'Il est principalement utilisé pour : Les ballons d''eau chaude électriques ou gaz (cumulus, chaudières). Les radiateurs neufs raccordés à des circuits anciens en fer. Toute installation où deux métaux différents (acier, cuivre, aluminium) sont en contact.', 2),
  ('Quelle est la durée de vie d''un raccord diélectrique ?', 'En moyenne, un raccord diélectrique dure 10 à 15 ans, soit l''équivalent de la durée de vie d''un ballon d''eau chaude. Il doit être contrôlé régulièrement et remplacé en cas de fuite ou de corrosion.', 3),
  ('Est-ce que je peux l''installer moi-même ?', 'En théorie, oui. Mais en pratique, une mauvaise pose peut annuler son efficacité et créer des fuites. Il est donc fortement recommandé de faire appel à un plombier qualifié.', 4),
  ('Combien coûte un raccord diélectrique ?', 'Le prix d''un raccord diélectrique varie entre 10 € et 30 € selon la taille et la marque. Mais il faut ajouter le coût de la pose, généralement inclus dans l''installation d''un ballon ou d''une chaudière.', 5),
  ('Que se passe-t-il si je n''en mets pas ?', 'Sans raccord diélectrique, la réaction électrolytique entre métaux différents provoque une corrosion accélérée, entraînant fuites, dégâts des eaux et remplacement prématuré de vos équipements.', 6),
  ('Comment savoir si mon installation en possède déjà un ?', 'Le raccord diélectrique est généralement un petit cylindre en laiton ou en acier, situé entre le ballon et le tuyau de sortie d''eau chaude. Un plombier pourra rapidement vérifier sa présence.', 7)
) AS faqs(question, answer, position);

-- Add redirect
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/raccord-dielectrique', '/carnet/raccord-dielectrique', 301)
ON CONFLICT (from_path) DO NOTHING;