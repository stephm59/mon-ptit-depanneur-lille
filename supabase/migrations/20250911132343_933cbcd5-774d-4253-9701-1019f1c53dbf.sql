-- Insert blog post for SoluCalc adoucisseur eau CO2
INSERT INTO public.blog_posts (
  service_slug,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  meta_title,
  meta_description,
  published
) VALUES (
  'plomberie',
  'SoluCalc : l''adoucisseur d''eau au CO₂ alimentaire',
  'adoucisseur-eau-solucalc-co2',
  'Découvrez SoluCalc, l''alternative écologique aux adoucisseurs au sel. Fonctionnement au CO₂ alimentaire, sans rejet, sans sel. Installation et prix.',
  'Vous cherchez une alternative écologique et efficace aux adoucisseurs d''eau traditionnels au sel ? SoluCalc est une solution innovante, utilisée depuis 1998 en France et en Belgique, qui séduit de plus en plus de foyers.

Il fonctionne grâce à du CO₂ alimentaire, injecté directement dans l''eau, ce qui empêche le calcaire de s''accrocher dans vos canalisations. Résultat : une eau plus douce, saine, sans goût altéré, et sans sacs de sel à transporter ni stocker.

## Comment fonctionne SoluCalc ?

Le principe est simple :

- Le CO₂ (dioxyde de carbone), incolore et inoffensif, est injecté dans l''eau.
- Il se transforme en acide carbonique léger.
- Celui-ci modifie la structure du calcaire en bicarbonates de calcium et de magnésium, qui ne s''incrustent pas dans vos tuyaux.

👉 Le procédé est totalement sans danger pour la santé et même comparable à ce qui est utilisé dans les aquariums pour réguler le pH de l''eau.

## Les avantages d''un adoucisseur au CO₂

✅ **100 % de l''eau est utilisée** : pas de rejet ni de gaspillage d''eau (contrairement aux adoucisseurs à sel).

✅ **Respectueux de l''environnement** : le CO₂ injecté est recyclé par captage.

✅ **Sans sel** : plus de sacs lourds à transporter, ni de goût salé dans l''eau.

✅ **Préserve vos canalisations** : moins de dépôts, plus de longévité pour vos appareils (chaudière, lave-linge, robinetterie…).

✅ **Confort au quotidien** : une eau plus douce pour la peau, le linge et la vaisselle.

## Combien coûte SoluCalc ?

💰 **Prix d''achat** : entre 1 500 et 3 000 € (hors TVA et installation).

💨 **Consommable (CO₂)** : environ 200 € / an.

Même si l''investissement initial peut sembler élevé, l''économie est réelle à moyen terme car il n''y a pas de sel à acheter ni de rejet d''eau coûteux.

## Installation et entretien

L''installation doit être effectuée par un professionnel agréé SoluCalc afin de garantir un réglage optimal et une sécurité parfaite.

👉 Chez Mon P''tit Dépanneur, distributeur officiel de SoluCalc, nous assurons l''installation et la maintenance en région lilloise.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/solucalc.webp',
  'SoluCalc : l''adoucisseur d''eau au CO₂ (sans sel, écologique) | Mon P''tit Dépanneur',
  'Découvrez SoluCalc, l''adoucisseur d''eau au CO₂ alimentaire : sans sel, écologique et économique. Comment ça marche ? Prix, avantages et installation.',
  true
);

-- Get the blog post ID for FAQs
-- Insert FAQs for SoluCalc blog post
INSERT INTO public.blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES 
(
  (SELECT id FROM public.blog_posts WHERE slug = 'adoucisseur-eau-solucalc-co2'),
  'Quelle est la différence entre SoluCalc et un adoucisseur au sel ?',
  'Un adoucisseur au sel remplace le calcium et le magnésium par du sodium, ce qui modifie le goût de l''eau et rejette beaucoup d''eau salée. SoluCalc, lui, transforme simplement le calcaire grâce au CO₂, sans déchet ni sel.',
  1
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'adoucisseur-eau-solucalc-co2'),
  'L''eau adoucie avec SoluCalc est-elle potable ?',
  'Oui, le procédé utilise du CO₂ alimentaire, sans impact sur la santé. L''eau garde son goût naturel et reste parfaitement potable.',
  2
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'adoucisseur-eau-solucalc-co2'),
  'Est-ce efficace contre le tartre ?',
  'Oui. Le calcaire est transformé en bicarbonates solubles, ce qui empêche les dépôts dans vos canalisations, robinets et appareils électroménagers.',
  3
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'adoucisseur-eau-solucalc-co2'),
  'Quel est le prix d''un adoucisseur SoluCalc ?',
  'Le prix varie entre 1 500 et 3 000 € (hors installation). À cela s''ajoute le coût du CO₂, environ 200 € par an.',
  4
),
(
  (SELECT id FROM public.blog_posts WHERE slug = 'adoucisseur-eau-solucalc-co2'),
  'SoluCalc demande-t-il de l''entretien ?',
  'Très peu. Seul le remplacement de la bouteille de CO₂ est nécessaire, ce qui le rend plus simple qu''un adoucisseur au sel.',
  5
);

-- Insert redirect
INSERT INTO public.redirects (
  old_path,
  new_path,
  status_code
) VALUES (
  '/solucalc-adoucisseur-au-co2/',
  '/carnet/adoucisseur-eau-solucalc-co2',
  301
);