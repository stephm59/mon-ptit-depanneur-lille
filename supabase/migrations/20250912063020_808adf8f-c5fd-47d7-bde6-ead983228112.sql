-- Associer les articles de blog restants aux services appropriés

-- Articles de plomberie -> service Plombier
UPDATE blog_posts SET service_id = 'cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f' WHERE slug IN (
  'variation-temperatures-plomberie',
  'difference-mitigeur-melangeur-thermostatique',
  'comment-reparer-fuites-eau',
  'fuite-groupe-securite-chauffe-eau',
  'role-tuyauterie-plomberie',
  'mitigeur-thermostatique-fonctionnement-avantages',
  'installer-adoucisseur',
  'vase-expansion-sanitaire',
  'cintrage'
);

-- Articles de chauffage -> service Chauffage
UPDATE blog_posts SET service_id = 'e2d8cffd-bf35-477a-b150-de5697b23ba8' WHERE slug IN (
  'guide-entretien-ballon-eau-chaude',
  'regulation-chauffage'
);