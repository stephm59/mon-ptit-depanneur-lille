-- Créer les 6 témoignages pour Pompe à chaleur Vieux-Lille
INSERT INTO testimonials (
  author_name,
  content,
  rating,
  location,
  service_id,
  city_id,
  published
) VALUES 
(
  'Élisa',
  'Remplacement de ma chaudière gaz par une PAC air/eau. Pose en cour intérieure, silence maîtrisé. Conso en baisse.',
  5,
  'rue de Gand',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  true
),
(
  'Thomas',
  'Dimensionnement précis : radiateurs fonte conservés, confort OK par temps froid. Réglages pédagogiques.',
  5,
  'place du Concert',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  true
),
(
  'Manon',
  'Contrat d''entretien clair : vérif régulation, loi d''eau ajustée et contrôle étanchéité.',
  4,
  'rue Esquermoise',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  true
),
(
  'Julien',
  'Dépannage en janvier (givre). Correction du dégivrage + repositionnement sonde : plus de coupures.',
  5,
  'rue Royale',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  true
),
(
  'Camille',
  'PAC + ballon ECS installés, délais tenus, documentation fournie pour le syndic.',
  5,
  'rue Basse',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  true
),
(
  'Romain',
  'Désembouage + équilibrage après pose : température homogène, PAC plus silencieuse.',
  4,
  'secteur Cathédrale',
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  true
);

-- Créer les 8 FAQ pour Pompe à chaleur Vieux-Lille
INSERT INTO service_city_faqs (
  service_id,
  city_id,
  question,
  answer,
  position,
  published
) VALUES
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'PAC air/eau ou air/air : que privilégier dans le Vieux-Lille ?',
  'Air/eau si vous voulez chauffer via radiateurs/plan cher + ECS ; air/air pour chauffage/rafraîchissement sans ECS, adapté aux surfaces modestes.',
  1,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Une PAC est-elle efficace dans les immeubles anciens ?',
  'Oui si dimensionnement rigoureux, basse température et réglages adaptés. Les radiateurs fonte peuvent convenir avec désembouage et équilibrage.',
  2,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Où placer l''unité extérieure avec des cours étroites ?',
  'En cour intérieure ou façade non exposée aux chambres, sur plots antivibratiles, avec dégagement d''air et gestion des condensats. Écrans acoustiques possibles si besoin.',
  3,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Quelles démarches en copropriété du Vieux-Lille ?',
  'Nous préparons un dossier : fiche technique/bruit, schéma d''implantation, évacuations, gestion condensats. Présentation en AG et échanges avec le syndic.',
  4,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Bruit : risque pour le voisinage ?',
  'Nous choisissons des unités silencieuses, optimisons l''orientation, ajoutons plots/écrans si nécessaire et respectons les seuils réglementaires.',
  5,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Conserver mes radiateurs en fonte ?',
  'Souvent oui. On vise une température de départ la plus basse possible, avec désembouage + équilibrage et, si besoin, remplacement de quelques émetteurs.',
  6,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Entretien : obligatoire ou recommandé ?',
  'Recommandé, et obligatoire au-delà d''un seuil de fluide. Contrôle étanchéité, régulation, dégivrage, échangeurs et circulateur pour fiabilité et économies.',
  7,
  true
),
(
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Quelles aides (MaPrimeRénov'', CEE) et comment en profiter ?',
  'Nous vérifions l''éligibilité, fournissons les devis normalisés et attestations, et aidons au dossier pour maximiser les aides.',
  8,
  true
);