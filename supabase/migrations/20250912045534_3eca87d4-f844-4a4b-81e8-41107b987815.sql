-- Insert new blog post about mixer tap differences
INSERT INTO blog_posts (
  service_id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  meta_title,
  meta_description
) VALUES (
  (SELECT id FROM services WHERE slug = 'plomberie'),
  'Différence entre robinet mélangeur, mitigeur simple et mitigeur thermostatique',
  'difference-mitigeur-melangeur-thermostatique',
  'Mélangeur, mitigeur simple ou mitigeur thermostatique ? Découvrez leurs différences, avantages, inconvénients et prix pour choisir le bon robinet.',
  'Tous les robinets ne se valent pas ! Mélangeur traditionnel, mitigeur moderne ou mitigeur thermostatique… chacun a ses spécificités.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/mitigeurs.webp',
  true,
  'Différences entre robinet mélangeur, mitigeur simple et thermostatique',
  'Mélangeur, mitigeur simple ou thermostatique ? Découvrez leurs différences, avantages, prix et usages pour bien choisir votre robinet. Conseils Mon p''tit Dépanneur.'
);

-- Insert blog post FAQs
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) 
SELECT 
  bp.id,
  faq.question,
  faq.answer,
  faq.position
FROM blog_posts bp,
(VALUES 
  ('Quelle est la différence entre un mélangeur et un mitigeur ?', 'Le mélangeur possède deux commandes séparées (chaud/froid), tandis que le mitigeur a une seule manette pour tout régler.', 1),
  ('Le mitigeur simple consomme-t-il moins d''eau ?', 'Oui, il est conçu pour réduire la consommation et éviter les réglages longs et répétitifs.', 2),
  ('Pourquoi choisir un mitigeur thermostatique ?', 'Pour plus de confort (température stable), de sécurité (anti-brûlures) et des économies d''eau.', 3),
  ('Quel robinet coûte le moins cher ?', 'Le robinet mélangeur, à partir de 10 €.', 4),
  ('Où installer un mitigeur thermostatique ?', 'Il est parfait pour la douche et la baignoire, mais existe aussi pour les lavabos haut de gamme.', 5),
  ('Quelle est la durée de vie moyenne d''un mitigeur ?', 'Environ 10 à 15 ans, selon la qualité et l''entretien.', 6)
) AS faq(question, answer, position)
WHERE bp.slug = 'difference-mitigeur-melangeur-thermostatique';