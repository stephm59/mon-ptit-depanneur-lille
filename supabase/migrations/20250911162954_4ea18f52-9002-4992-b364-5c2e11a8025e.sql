-- Insert the blog post about water heaters
INSERT INTO blog_posts (
  slug, 
  title, 
  content, 
  excerpt, 
  meta_title, 
  meta_description, 
  cover_image_url, 
  published, 
  published_at,
  service_id
) VALUES (
  'chauffe-eau',
  'Itinéraire de l''eau dans un chauffe-eau',
  'Vous vous demandez comment l''eau circule dans un chauffe-eau électrique (aussi appelé cumulus) ? Bonne question ! Pour comprendre, il faut d''abord connaître la composition et le fonctionnement de cet appareil indispensable à la production d''eau chaude sanitaire.

👉 Mon p''tit Dépanneur vous explique simplement l''itinéraire de l''eau dans un chauffe-eau.

## Qu''est-ce qu''un chauffe-eau électrique ?

Le chauffe-eau est un réservoir qui chauffe et stocke de l''eau chaude sanitaire pour les besoins du foyer (douche, vaisselle, lessive).
Il existe plusieurs types de chauffe-eaux, mais le plus courant reste le chauffe-eau électrique à accumulation.

## De quoi est-il composé ?

Un chauffe-eau électrique comprend plusieurs éléments essentiels :

**La cuve émaillée** : réservoir de stockage de l''eau.

**La résistance** : réchauffe l''eau (peut être blindée ou stéatite).

**Le thermostat (aquastat)** : régule la température.

**L''anode** : protège la cuve de la corrosion.

**Le groupe de sécurité** : évite la surpression en évacuant un peu d''eau.

**Le contacteur jour/nuit** : optimise la consommation d''électricité.

**Le disjoncteur** : protège l''appareil.

## Le principe de stratification

Le chauffe-eau fonctionne grâce à la stratification :

L''eau froide entre par le bas de la cuve.

La résistance la chauffe.

L''eau chaude, plus légère, monte naturellement vers le haut.

👉 Résultat : les couches d''eau se superposent, avec de l''eau très chaude en haut et de l''eau froide en bas.

## L''itinéraire de l''eau dans un chauffe-eau

**Arrivée de l''eau froide** → elle pénètre par l''entrée située en bas du réservoir.

**Chauffage** → la résistance chauffe progressivement l''eau.

**Stratification** → l''eau chaude remonte en haut de la cuve, l''eau froide reste en bas.

**Puisage** → la canne de puisage prélève l''eau chaude disponible en haut du ballon.

**Renouvellement** → chaque litre d''eau chaude utilisé est remplacé par un litre d''eau froide, qui sera à son tour chauffé.

👉 C''est un cycle continu : le ballon se remplit, chauffe, stocke et délivre de l''eau chaude selon vos besoins.

## Conclusion

L''itinéraire de l''eau dans un chauffe-eau n''est pas si compliqué : l''eau froide entre en bas, elle chauffe, puis monte en haut du réservoir avant d''être utilisée.

👉 Besoin d''un entretien, d''un remplacement ou d''une réparation de chauffe-eau ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68.',
  'Vous vous demandez comment l''eau circule dans un chauffe-eau électrique ? Mon p''tit Dépanneur vous explique simplement l''itinéraire de l''eau dans un chauffe-eau.',
  'Chauffe-eau : fonctionnement et itinéraire de l''eau (guide simple)',
  'Découvrez l''itinéraire de l''eau dans un chauffe-eau : fonctionnement, stratification, pièces principales et conseils pratiques avec Mon p''tit Dépanneur.',
  '/blog-images/chauffe-eau.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'chauffage' LIMIT 1)
);

-- Insert FAQs for the water heater blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
(
  (SELECT id FROM blog_posts WHERE slug = 'chauffe-eau'),
  'Quelle est la durée de vie d''un chauffe-eau électrique ?',
  'En moyenne 10 à 15 ans, selon la qualité de la cuve, l''eau (calcaire) et l''entretien.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'chauffe-eau'),
  'Quelle température idéale régler sur un chauffe-eau ?',
  'Entre 55 °C et 60 °C : assez chaud pour éviter les bactéries, mais sans surconsommation.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'chauffe-eau'),
  'Pourquoi mon chauffe-eau coule-t-il par le groupe de sécurité ?',
  'C''est normal : il évacue un peu d''eau lors de la chauffe pour limiter la pression. Si le débit est trop important, il peut être défectueux.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'chauffe-eau'),
  'Quelle différence entre chauffe-eau blindé et stéatite ?',
  'Blindé : résistance en contact direct avec l''eau (moins cher mais sensible au calcaire). Stéatite : résistance protégée dans un fourreau (mieux pour les eaux calcaires).',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'chauffe-eau'),
  'Quelle est la capacité idéale d''un chauffe-eau ?',
  '50 L → 1 adulte, 100 L → 2 adultes, 150 L → 2 adultes + 1 enfant, 200 L → famille de 4 personnes.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'chauffe-eau'),
  'Comment entretenir un chauffe-eau ?',
  'Il est recommandé de détartrer et vérifier l''anode tous les 2 à 3 ans, surtout dans les régions à eau calcaire.',
  6
);

-- Add redirect from /chauffe-eau to /carnet/chauffe-eau
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/chauffe-eau', '/carnet/chauffe-eau', 301);