-- First, create the "Vitre" service if it doesn't exist
INSERT INTO services (name, slug, description, published) 
VALUES ('Vitre', 'vitre', 'Installation et réparation de vitrages', true)
ON CONFLICT (slug) DO NOTHING;

-- Create the blog post about types of vitrages
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
  'Les différents types de vitrages : simple, double ou triple, lequel choisir ?',
  'type-vitrages',
  'Simple, double ou triple vitrage ? Découvrez leurs différences, avantages, inconvénients et lequel est le plus adapté à votre logement.',
  '## Pourquoi bien choisir son vitrage ?

Les vitrages jouent un rôle clé dans le confort d''une maison. Ils influencent non seulement la luminosité, mais aussi l''isolation thermique et acoustique, la sécurité, et même la valeur de votre bien immobilier.

Aujourd''hui, on distingue trois grandes familles de vitrages : le simple vitrage, le double vitrage et le triple vitrage. Chacun a ses avantages, ses limites et ses usages. Voyons ça ensemble 👇

## 1. Le simple vitrage : l''ancienne génération

Le simple vitrage est constitué… d''une seule vitre, souvent épaisse de 4 à 6 mm.

🔧 Ses caractéristiques :

Très faible isolation thermique (perte de chaleur importante).

Isolation acoustique quasi inexistante.

Très peu utilisé dans les logements récents, on le retrouve surtout dans les anciennes maisons ou dépendances.

❌ Pourquoi l''éviter ?
Un logement en simple vitrage peut perdre jusqu''à 30 % de sa chaleur par les fenêtres. Résultat : factures d''énergie plus élevées et confort réduit.

## 2. Le double vitrage : le standard actuel

C''est le vitrage le plus répandu en France aujourd''hui. Il est composé de deux vitres séparées par une lame d''air ou de gaz isolant (souvent de l''argon).

✅ Ses avantages :

Excellente isolation thermique (jusqu''à 2 à 3 fois plus performante que le simple vitrage).

Meilleure isolation acoustique.

Réduction de la condensation.

Valorisation immobilière (impact positif sur le DPE – diagnostic de performance énergétique).

💡 Astuce : privilégiez le double vitrage à faible émissivité (traitement spécial du verre qui réfléchit la chaleur) pour encore plus d''économies.

## 3. Le triple vitrage : le haut de gamme isolation

Le triple vitrage est constitué de trois vitres et deux lames de gaz isolant.

🏠 Ses points forts :

Isolation thermique exceptionnelle (jusqu''à 35 % plus performante que le double vitrage).

Très bon confort acoustique.

Intéressant dans les régions très froides ou les maisons neuves bien isolées (BBC, passives).

⚠️ Ses limites :

Plus cher que le double vitrage.

Plus lourd (charnières et cadres renforcés nécessaires).

Pas toujours pertinent pour des habitations anciennes, car l''investissement ne sera pas forcément rentable.

## Alors, lequel choisir ?

Pour une rénovation standard : le double vitrage est le meilleur compromis confort/prix.

Pour une maison neuve en climat froid : le triple vitrage peut valoir le coup.

Pour les dépendances ou locaux non chauffés : un vitrage simple peut suffire.

👉 Dans tous les cas, le choix du vitrage doit être réfléchi avec le type de menuiserie (PVC, bois, alu) et l''orientation de vos fenêtres.',
  '/blog-images/type-vitres.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'vitre')
);

-- Get the blog post ID for FAQs
DO $$
DECLARE
  blog_post_id_var uuid;
BEGIN
  SELECT id INTO blog_post_id_var FROM blog_posts WHERE slug = 'type-vitrages';
  
  -- Insert FAQs for this blog post
  INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
  (blog_post_id_var, 'Quelle est la différence entre double vitrage et double vitrage à faible émissivité ?', 'Le vitrage à faible émissivité dispose d''un traitement spécial qui renvoie la chaleur vers l''intérieur, réduisant encore plus les pertes énergétiques.', 1),
  (blog_post_id_var, 'Le triple vitrage est-il toujours utile ?', 'Pas forcément. Si la maison est mal isolée par ailleurs, mieux vaut commencer par renforcer l''isolation des murs et de la toiture avant d''investir dans du triple vitrage.', 2),
  (blog_post_id_var, 'Quel est le coût moyen d''un changement de fenêtres ?', 'En moyenne, comptez entre 150 et 250 € par m² pour du double vitrage, et entre 250 et 400 € par m² pour du triple vitrage (hors frais de pose).', 3);
END $$;

-- Add redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/type-vitrages', '/carnet/type-vitrages', 301);