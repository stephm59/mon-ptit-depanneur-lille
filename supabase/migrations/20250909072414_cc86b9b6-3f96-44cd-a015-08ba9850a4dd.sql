-- Créer la page service + ville "Pompe à chaleur Vieux-Lille"
INSERT INTO service_city_pages (
  service_id, 
  city_id, 
  meta_title,
  meta_description,
  h1,
  h2_intro,
  intro_description,
  cta_title,
  cta_subtitle,
  zones_text,
  published
) VALUES (
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur'),
  (SELECT id FROM cities WHERE slug = 'vieux-lille'),
  'Pompe à chaleur Vieux-Lille (installation, entretien, dépannage) | Mon p''tit Dépanneur',
  'Installation et entretien de pompes à chaleur au Vieux-Lille : étude, dimensionnement, pose, mise en service, dépannage. PAC air/eau et air/air. Aide MaPrimeRénov'' & CEE.',
  'Pompe à chaleur Vieux-Lille (installation, entretien, dépannage)',
  'PAC adaptées aux immeubles anciens et cours intérieures du Vieux-Lille.',
  'Depuis plus de 20 ans, Mon p''tit Dépanneur accompagne les habitants du Vieux-Lille pour l''étude, le dimensionnement, l''installation et l''entretien de pompes à chaleur air/eau (chauffage + ECS) et air/air (chauffage/rafraîchissement). Nous maîtrisons les contraintes locales : accès étroits, copropriétés, règles acoustiques et cours intérieures. Nos équipes gèrent la pose, la mise en service, l''optimisation hydraulique ainsi que l''accompagnement pour vos aides financières.',
  'Besoin d''un installateur PAC au Vieux-Lille ?',
  'Étude gratuite, installation soignée et entretien garanti.',
  'Vieux-Lille complet : rues Esquermoise, Gand, Royale, Basse, place du Concert, secteurs historiques et immeubles rénovés. Interventions aussi vers Centre, Saint-Maurice Pellevoisin et Vauban.',
  true
);

-- Créer les 6 offres pour cette page
INSERT INTO service_city_offers (page_id, title, description, emoji, position) VALUES
(
  (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'vieux-lille')),
  'Étude & dimensionnement PAC au Vieux-Lille',
  'Bilan des déperditions, choix air/eau ou air/air, puissance, loi d''eau et scénarios en copropriété.',
  '🔍',
  1
),
(
  (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'vieux-lille')),
  'Installation PAC air/eau + ballon ECS',
  'Pose propre en logement ancien, raccordements hydrauliques, régulation et mise en service.',
  '🏗',
  2
),
(
  (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'vieux-lille')),
  'Remplacement de chaudière par PAC',
  'Conversion gaz → PAC, vérification émetteurs (radiateurs fonte), solution bivalente si besoin.',
  '♻️',
  3
),
(
  (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'vieux-lille')),
  'Optimisation circuit (équilibrage & désembouage)',
  'Débits équilibrés, eau propre, meilleur SCOP à basse température.',
  '🧪',
  4
),
(
  (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'vieux-lille')),
  'Entretien & dépannage PAC',
  'Contrat annuel, contrôle étanchéité, dégivrage, régulation, pièces et fluides.',
  '🧰',
  5
),
(
  (SELECT id FROM service_city_pages WHERE service_id = (SELECT id FROM services WHERE slug = 'pompe-a-chaleur') AND city_id = (SELECT id FROM cities WHERE slug = 'vieux-lille')),
  'Aides & conformité copro',
  'Dossiers MaPrimeRénov''/CEE, notices acoustiques, plan d''implantation en cour, gestion condensats.',
  '📝',
  6
);