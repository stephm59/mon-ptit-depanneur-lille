-- Create redirects table if it doesn't exist
CREATE TABLE IF NOT EXISTS public.redirects (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  from_path TEXT NOT NULL UNIQUE,
  to_path TEXT NOT NULL,
  status_code INTEGER NOT NULL DEFAULT 301,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS on redirects table
ALTER TABLE public.redirects ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access to redirects
CREATE POLICY "Redirects are publicly readable" 
ON public.redirects 
FOR SELECT 
USING (true);

-- Create blog post FAQs table if it doesn't exist
CREATE TABLE IF NOT EXISTS public.blog_post_faqs (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  blog_post_id UUID NOT NULL REFERENCES public.blog_posts(id) ON DELETE CASCADE,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  position SMALLINT DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS on blog post FAQs table
ALTER TABLE public.blog_post_faqs ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access to blog post FAQs
CREATE POLICY "Blog post FAQs are publicly readable" 
ON public.blog_post_faqs 
FOR SELECT 
USING (true);

-- Create the blog post
INSERT INTO public.blog_posts (
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at,
  service_id
) VALUES (
  'Chaudière, chauffe-eau électrique ou gaz : lequel choisir ?',
  'choisir-chaudiere-ou-chauffe-eau',
  'Entre chaudière, chauffe-eau électrique et chauffe-eau au gaz, il n''est pas toujours facile de s''y retrouver. Chaque système a ses avantages et ses limites.',
  'Besoin d''eau chaude au quotidien 💧 ? Entre chaudière, chauffe-eau électrique et chauffe-eau au gaz, il n''est pas toujours facile de s''y retrouver. Chaque système a ses avantages et ses limites.

Chez Mon p''tit Dépanneur, on vous explique clairement les différences pour vous aider à faire le bon choix.

## 1. La chaudière : eau chaude + chauffage

**Usage idéal** : si vous avez besoin d''eau chaude sanitaire et de chauffage central (radiateurs, plancher chauffant).

**Fonctionnement** : la chaudière chauffe l''eau via un brûleur gaz (ou fioul) et alimente à la fois vos robinets et vos radiateurs.

**Avantages** :
✔️ deux fonctions en un seul appareil,
✔️ rendements très élevés avec les modèles à condensation,
✔️ économies jusqu''à 30 % sur la facture de gaz.

**Inconvénients** : installation plus lourde (nécessite un raccordement au gaz) et coût d''achat supérieur.

## 2. Le chauffe-eau au gaz : uniquement pour l''eau chaude

**Usage idéal** : si vous ne voulez chauffer que l''eau sanitaire (cuisine, salle de bains).

**Fonctionnement** : l''eau est chauffée instantanément via un brûleur gaz naturel, butane ou propane.

**Avantages** :
✔️ chauffe rapide et sans limite de volume,
✔️ coût de fonctionnement plus bas que l''électricité,
✔️ appareil compact.

**Inconvénients** :
❌ nécessite un raccordement gaz ou des bouteilles,
❌ capacité limitée en litres/minute (5 à 15 L/min).

## 3. Le chauffe-eau électrique (cumulus) : simple et polyvalent

**Usage idéal** : si vous n''avez pas accès au gaz ou pour une résidence secondaire.

**Fonctionnement** : un ballon stocke l''eau chaude et la maintient à température.

**Avantages** :
✔️ installation rapide et peu coûteuse,
✔️ compact, s''installe partout (vertical ou horizontal),
✔️ peu d''entretien.

**Inconvénients** :
❌ capacité limitée (50 L par personne en moyenne),
❌ temps de chauffe parfois long (1 à 6h),
❌ coût de l''électricité supérieur au gaz.

## Conclusion

👉 En résumé :

**Chaudière** = eau chaude + chauffage, idéale pour une maison.

**Chauffe-eau au gaz** = eau chaude illimitée, pratique si vous avez déjà le gaz.

**Chauffe-eau électrique** = simple et polyvalent, parfait sans gaz ou pour un usage ponctuel.

Besoin d''aide pour choisir et installer votre équipement ?
Appelez Mon p''tit Dépanneur au 03 28 53 48 68 : nos chauffagistes vous conseillent selon votre logement et vos habitudes.',
  '/blog-images/comparatif-chaudiere.webp',
  true,
  now(),
  (SELECT id FROM public.services WHERE slug = 'chauffage' LIMIT 1)
);

-- Insert FAQs for the blog post
INSERT INTO public.blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES 
(
  (SELECT id FROM public.blog_posts WHERE slug = 'choisir-chaudiere-ou-chauffe-eau'),
  'Quelle est la différence entre une chaudière et un chauffe-eau ?',
  'La chaudière chauffe à la fois l''eau sanitaire et le chauffage central, alors que le chauffe-eau ne produit que de l''eau chaude sanitaire.',
  1
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'choisir-chaudiere-ou-chauffe-eau'),
  'Quel système est le plus économique ?',
  'En usage intensif, la chaudière gaz à condensation est la plus rentable. Le chauffe-eau électrique revient souvent plus cher à long terme.',
  2
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'choisir-chaudiere-ou-chauffe-eau'),
  'Quelle capacité de chauffe-eau électrique prévoir ?',
  'Comptez environ 50 litres par personne et par jour. Exemple : 200 L pour une famille de 4.',
  3
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'choisir-chaudiere-ou-chauffe-eau'),
  'Combien de temps dure un chauffe-eau électrique ?',
  'En moyenne 10 à 15 ans, selon la qualité, la dureté de l''eau et l''entretien.',
  4
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'choisir-chaudiere-ou-chauffe-eau'),
  'Le gaz est-il toujours plus avantageux que l''électricité ?',
  'Pas toujours. Si votre consommation est faible ou si c''est pour une résidence secondaire, le chauffe-eau électrique peut être plus pratique.',
  5
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'choisir-chaudiere-ou-chauffe-eau'),
  'Peut-on installer soi-même une chaudière ou un chauffe-eau ?',
  'Non. Ces équipements nécessitent l''intervention d''un professionnel qualifié pour respecter les normes de sécurité et garantir une installation durable.',
  6
);

-- Add redirection from old URL to new URL
INSERT INTO public.redirects (
  from_path,
  to_path,
  status_code,
  created_at
) VALUES (
  '/chaudiere-chauffe-eau-electrique-ou-gaz',
  '/carnet/choisir-chaudiere-ou-chauffe-eau',
  301,
  now()
);