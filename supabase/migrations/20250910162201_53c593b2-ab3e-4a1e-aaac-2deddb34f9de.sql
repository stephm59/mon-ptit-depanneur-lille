INSERT INTO blog_posts (
  slug,
  title,
  excerpt,
  content,
  cover_image_url,
  service_id,
  published,
  published_at
) VALUES (
  'types-tuyauterie',
  'Quels sont les différents types de tuyauterie ? | Mon P''tit Dépanneur',
  'Cuivre, PVC, PER, multicouche… Découvrez les principaux types de tuyauterie, leurs avantages et leurs utilisations pour vos installations domestiques.',
  'Les différents types de tuyauterie : guide pratique

Pas d''installation sans tuyaux ! 💧 Souvent négligée, la tuyauterie est pourtant essentielle pour la plomberie, le chauffage ou encore le gaz. Et non, tous les tuyaux ne se valent pas : chaque matériau a ses usages et ses avantages.

Chez Mon p''tit Dépanneur, on vous aide à y voir clair. Voici les 8 grands types de tuyauterie que vous pouvez rencontrer dans une maison.

## 1. Tuyaux en fer

**Usage :** climatisation, réseaux incendie.

**Spécificité :** robustes mais lourds, souvent peints en rouge pour la sécurité.

## 2. Tuyaux en acier inoxydable

**Usage :** plomberie et chauffage.

**Avantage :** esthétiques, solides et durables.

**Assemblage :** à souder, à visser ou à compression.

## 3. Tuyaux en polyéthylène réticulé (PEX)

**Usage :** plomberie, chauffage, planchers chauffants.

**Avantage :** grande flexibilité, faciles à installer.

**Astuce :** versions avec barrière à l''oxygène pour éviter la corrosion.

## 4. Tuyaux en cuivre

**Usage :** eau potable, chauffage, gaz.

**Avantage :** fiables et durables.

**Inconvénient :** coût élevé et sensible à la corrosion.

## 5. Tuyaux en PVC

**Usage :** évacuations (eaux usées, eaux pluviales).

**Avantage :** légers, faciles à poser avec colle spéciale.

## 6. Tuyaux en polybutène (PB)

**Usage :** petites rénovations, eau chaude sanitaire.

**Avantage :** très souples et simples à installer.

**Limite :** peu adaptés aux hautes températures.

## 7. Tuyaux en polypropylène (PPR)

**Usage :** hôpitaux, écoles, bâtiments collectifs.

**Avantage :** longue durée de vie (50 ans), neutres et hygiéniques.

**Assemblage :** par thermofusion → solide et durable.

## 8. Tuyaux multicouches

**Usage :** installations modernes, chauffage haute température.

**Avantage :** excellent compromis entre prix, résistance et esthétique.

**Astuce :** cintrables et très fiables.

## Et les accessoires ?

Filtres, clapets anti-retour, vannes, siphons… Les raccords et accessoires complètent les tuyaux pour assurer une installation fonctionnelle et étanche.

## Conclusion

Le choix de la tuyauterie dépend de l''usage (eau potable, chauffage, gaz, évacuation) et du budget.
👉 Pour une installation fiable et durable, faites appel à un plombier qualifié. L''équipe Mon p''tit Dépanneur est à votre disposition pour vous conseiller et intervenir partout dans la région lilloise.',
  '/blog-images/types-tuyauterie.webp',
  (SELECT id FROM services WHERE name = 'Plombier' AND published = true LIMIT 1),
  true,
  now()
);