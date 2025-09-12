-- Associer les articles de blog aux services appropriés

-- Articles de plomberie -> service Plombier
UPDATE blog_posts SET service_id = 'cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f' WHERE slug IN (
  '7-astuces-deboucher-canalisations',
  'choisir-adoucisseur-eau',
  'au-secours-ma-chasse-deau-ne-fonctionne-plus',
  'comment-choisir-raccord',
  'deboucher-evier-bouche',
  'detecter-fuite-eau-maison',
  'lecture-compteur-eau',
  'nettoyer-canalisations',
  'prevenir-fuite-eau',
  'regler-reducteur-pression',
  'reparer-fuite-eau-soi-meme',
  'conseils-preparer-canalisations-hiver',
  'fuite-vase-expansion-sanitaire',
  'role-tuyauterie-systeme-plomberie',
  'types-tuyauterie',
  'raccord-dielectrique',
  'variation-temperatures-canalisations'
);

-- Articles de chauffage/chauffe-eau -> service Chauffage  
UPDATE blog_posts SET service_id = 'e2d8cffd-bf35-477a-b150-de5697b23ba8' WHERE slug IN (
  'choisir-chauffe-eau',
  'solution-chauffage-ete',
  'thermostat-chauffage-sans-fil'
);

-- Articles de salle de bains -> service Rénovation salle de bains
UPDATE blog_posts SET service_id = '48a41b25-8754-4ed0-a44a-85a358174394' WHERE slug IN (
  'choisir-toilettes',
  'comment-choisir-colonne-douche', 
  'douche-baignoire-avantages-prix'
);

-- Articles généraux -> service Plombier (comme service principal)
UPDATE blog_posts SET service_id = 'cf03edcc-9452-44c2-a2f8-4eb0b2a2be8f' WHERE slug IN (
  'garantie-constructeur-biennale',
  'label-rge-importance-renovation'
);