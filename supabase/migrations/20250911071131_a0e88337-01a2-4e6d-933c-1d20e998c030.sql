-- Insert blog post for entretien chaudière
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
  'e2d8cffd-bf35-477a-b150-de5697b23ba8', -- Chauffage service ID
  'Pourquoi entretenir sa chaudière une fois par an ? | Mon P''tit Dépanneur',
  'pourquoi-entretenir-chaudiere',
  'Entretien annuel de chaudière : pourquoi est-ce obligatoire, en quoi consiste la révision, qui doit la réaliser, combien ça coûte et quels risques si on ne le fait pas ?',
  'Saviez-vous que l''entretien annuel de votre chaudière est obligatoire et qu''il peut vous éviter bien des ennuis ?
Sécurité, économies, longévité… On vous explique en détail pourquoi ce rendez-vous avec votre chauffagiste est indispensable.

## 🔧 À quoi sert la révision d''une chaudière ?

La révision annuelle ne consiste pas seulement à "jeter un œil" :

Elle garantit votre sécurité (détection des fuites de gaz, monoxyde de carbone…).

Elle améliore l''efficacité énergétique de votre appareil.

Elle prolonge sa durée de vie en évitant l''encrassement.

Elle permet d''être couvert par votre assurance en cas d''incident.

## 👨‍🔧 En quoi consiste l''entretien ?

Le technicien chauffagiste effectue plusieurs vérifications et réglages :

Contrôle de l''état général et étanchéité.

Nettoyage du brûleur.

Vérification de la pression et des réglages.

Mesure des émissions de gaz (dont le monoxyde de carbone).

Remplacement des pièces usées si nécessaire.

Contrôle de la ventilation et de l''évacuation des fumées.

À la fin, il vous remet une attestation d''entretien, que vous devez conserver au moins 2 ans.

## 📅 Quelle fréquence ?

Selon le décret n° 2009-649 du 9 juin 2009, l''entretien est obligatoire une fois par an, pour toutes les chaudières gaz, fioul, bois ou charbon d''une puissance inférieure à 70 kW.

## 💶 Combien ça coûte ?

Entretien annuel simple : 100 à 200 € en moyenne.

Contrat d''entretien avec dépannage inclus : entre 120 et 250 €, selon les options (dépannage prioritaire, pièces incluses, etc.).

## ⚠️ Que risque-t-on si on ne l''effectue pas ?

Perte d''efficacité (jusqu''à +15 % sur la consommation).

Risques de pannes ou d''accidents (intoxication, incendie).

Non-couverture par l''assurance en cas de sinistre.

Responsabilité engagée vis-à-vis du propriétaire (si vous êtes locataire).

## ✅ Le bon réflexe

Ne négligez pas cet entretien : un petit investissement chaque année, pour beaucoup de tranquillité.
👉 Chez Mon P''tit Dépanneur, nos chauffagistes certifiés RGE réalisent l''entretien et vous délivrent immédiatement l''attestation officielle.',
  '/blog-images/pourquoi-entretien-chaudiere.webp',
  true,
  NOW()
);

-- Get the blog post ID for FAQs
WITH new_blog_post AS (
  SELECT id FROM blog_posts WHERE slug = 'pourquoi-entretenir-chaudiere'
)
-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  new_blog_post.id,
  question,
  answer,
  position
FROM new_blog_post, (VALUES
  ('Est-ce que l''entretien annuel de la chaudière est obligatoire ?', 'Oui, la loi impose une révision annuelle pour toutes les chaudières individuelles de moins de 70 kW (gaz, fioul, bois, charbon).', 1),
  ('Qui doit payer l''entretien de la chaudière, le propriétaire ou le locataire ?', 'Dans un logement en location, c''est au locataire de s''en charger (sauf chaudière collective).', 2),
  ('Combien de temps dure l''entretien d''une chaudière ?', 'En général, 30 à 60 minutes, selon le type de chaudière et son état.', 3),
  ('Quels documents dois-je conserver après l''entretien ?', 'L''attestation d''entretien remise par le chauffagiste. Elle doit être gardée au moins 2 ans.', 4),
  ('Est-ce dangereux de ne pas entretenir sa chaudière ?', 'Oui, une chaudière mal entretenue peut provoquer des fuites de monoxyde de carbone, un gaz inodore mais mortel, en plus d''augmenter votre facture énergétique.', 5)
) AS faqs(question, answer, position);

-- Add redirect
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/pourquoi-entretenir-chaudiere/', '/carnet/pourquoi-entretenir-chaudiere/', 301)
ON CONFLICT (from_path) DO NOTHING;