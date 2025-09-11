-- Insert blog post for bathroom renovation
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
  '48a41b25-8754-4ed0-a44a-85a358174394', -- Rénovation salle de bains service ID
  'Rénover sa salle de bains : douche ou baignoire ? | Mon P''tit Dépanneur',
  'renover-salle-bains-douche-baignoire',
  'Vous hésitez entre installer une douche ou une baignoire pour rénover votre salle de bains ? Avantages, inconvénients, conseils pratiques. On vous aide à choisir !',
  'Lorsqu''on rénove une salle de bains, le dilemme revient toujours : vaut-il mieux installer une douche moderne et pratique ou une baignoire élégante et relaxante ? La vérité, c''est qu''il n''y a pas de bon ou de mauvais choix. Tout dépend :

de la taille de la pièce,

de vos habitudes de vie,

et de vos besoins spécifiques (enfants, mobilité réduite, envie de confort…).

## La douche : gain de place et praticité

👉 Idéale pour les petites salles de bains (dès 70x70 cm).

Ses avantages :

🚿 Gain d''espace : parfaite pour optimiser les mètres carrés.

⚡ Rapidité : en 5 minutes, vous êtes prêt.

💧 Moins de consommation d''eau : environ 100 L, contre 150 à 250 L pour un bain.

👵 Accessibilité : receveurs extra-plats adaptés aux personnes âgées ou à mobilité réduite.

🎨 Sur mesure : formats carrés, rectangulaires, angulaires ou même XXL.

## La baignoire : confort et détente

👉 À privilégier dans une salle de bains spacieuse (minimum 70x140 cm).

Ses avantages :

🛁 Bien-être garanti : effet relaxant après une journée chargée.

👶 Pratique avec des enfants : l''heure du bain devient un jeu.

✨ Élément déco : les baignoires îlot (vintage ou design) deviennent de véritables pièces maîtresses.

🤲 Confort sensoriel : nouveaux matériaux doux, chauds, antibactériens.

## Alors, douche ou baignoire ?

Si vous vivez seul(e) ou menez une vie active → optez pour la douche.

Si vous avez de jeunes enfants ou que vous aimez les moments de détente → la baignoire est un must.

Si l''espace le permet → combinez les deux pour profiter des avantages de chacune.

## Conclusion

Douche ou baignoire, tout dépend de vos priorités. Chez Mon P''tit Dépanneur, nos experts plombiers et rénovateurs de salle de bains peuvent vous accompagner de A à Z : pose du carrelage, installation de douche, baignoire, sanitaires et meubles. Contactez-nous pour obtenir un devis gratuit.',
  '/blog-images/douche-baignoire.webp',
  true,
  NOW()
);

-- Get the blog post ID for FAQs
WITH new_blog_post AS (
  SELECT id FROM blog_posts WHERE slug = 'renover-salle-bains-douche-baignoire'
)
-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  new_blog_post.id,
  question,
  answer,
  position
FROM new_blog_post, (VALUES
  ('Quelle est la taille minimale pour installer une douche ?', 'Un receveur de 90x90 cm est confortable. Les modèles 70x70 cm existent mais sont étroits.', 1),
  ('Quelle est la taille minimale pour installer une baignoire ?', 'La taille classique est 70x140 cm. Une baignoire îlot demande environ 90 cm d''espace libre tout autour.', 2),
  ('Quelle solution consomme le moins d''eau ?', 'La douche consomme en moyenne 100 litres d''eau, contre 150 à 250 litres pour un bain. Mais au-delà de 10 minutes, la douche peut devenir plus consommatrice.', 3),
  ('Puis-je installer une douche et une baignoire dans la même salle de bains ?', 'Oui, si la surface est suffisante (au moins 8 à 10 m²), combiner douche et baignoire est idéal.', 4),
  ('Quelle solution est la plus adaptée aux personnes âgées ou à mobilité réduite ?', 'La douche à l''italienne avec receveur extra-plat est la plus sécurisée. Elle peut être équipée de barres de maintien et d''un siège.', 5)
) AS faqs(question, answer, position);

-- Add redirect
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/renover-salle-bains-douche-baignoire/', '/carnet/renover-salle-bains-douche-baignoire/', 301)
ON CONFLICT (from_path) DO NOTHING;