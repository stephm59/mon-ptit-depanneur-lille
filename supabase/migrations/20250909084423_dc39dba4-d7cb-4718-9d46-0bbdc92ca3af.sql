-- Créer les pages service_city_pages pour les 3 villes manquantes
INSERT INTO service_city_pages (service_id, city_id, meta_title, meta_description, h1, h2_intro, intro_description, cta_title, cta_subtitle, zones_text, published, published_at)
SELECT 
  s.id as service_id,
  c.id as city_id,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'Pompe à chaleur Saint-André-lez-Lille (installation, entretien, dépannage) | Mon p''tit Dépanneur'
    WHEN c.slug = 'bondues' THEN 'Pompe à chaleur Bondues (installation, entretien, dépannage) | Mon p''tit Dépanneur'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'Pompe à chaleur Marcq-en-Barœul (installation, entretien, dépannage) | Mon p''tit Dépanneur'
  END as meta_title,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'PAC à Saint-André-lez-Lille : étude, dimensionnement, pose, mise en service, entretien et dépannage. Quartiers résidentiels, maisons et appartements. Aide MaPrimeRénov'' & CEE.'
    WHEN c.slug = 'bondues' THEN 'PAC à Bondues : étude, dimensionnement, pose, mise en service, entretien et dépannage. Résidences pavillonnaires et appartements. Aide MaPrimeRénov'' & CEE.'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'PAC à Marcq-en-Barœul : étude, dimensionnement, pose, mise en service, entretien et dépannage. Secteurs Croisé-Laroche, République. Aide MaPrimeRénov'' & CEE.'
  END as meta_description,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'Pompe à chaleur Saint-André-lez-Lille (installation, entretien, dépannage)'
    WHEN c.slug = 'bondues' THEN 'Pompe à chaleur Bondues (installation, entretien, dépannage)'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'Pompe à chaleur Marcq-en-Barœul (installation, entretien, dépannage)'
  END as h1,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'PAC performantes et discrètes pour tous les quartiers de Saint-André-lez-Lille.'
    WHEN c.slug = 'bondues' THEN 'PAC adaptées aux résidences pavillonnaires et appartements bonduois.'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'PAC haute performance pour Croisé-Laroche, République et tous les secteurs marcquois.'
  END as h2_intro,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'Installation et maintenance de PAC en résidences et appartements andrésiens. Expertise des contraintes locales, optimisation énergétique et respect des réglementations acoustiques.'
    WHEN c.slug = 'bondues' THEN 'Installation et maintenance de PAC en maisons et appartements bonduois. Gestion des spécificités résidentielles, accès et optimisation énergétique selon le bâti local.'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'Installation et maintenance de PAC en maisons et appartements marcquois. Expertise des contraintes urbaines, optimisation hydraulique et accompagnement réglementaire complet.'
  END as intro_description,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'Besoin d''un installateur PAC à Saint-André-lez-Lille ?'
    WHEN c.slug = 'bondues' THEN 'Besoin d''un installateur PAC à Bondues ?'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'Besoin d''un installateur PAC à Marcq-en-Barœul ?'
  END as cta_title,
  'Étude gratuite, installation soignée et entretien garanti.' as cta_subtitle,
  CASE 
    WHEN c.slug = 'saint-andre-lez-lille' THEN 'Saint-André-lez-Lille : centre-ville, quartiers résidentiels ; proximité Lille, La Madeleine, Marquette-lez-Lille.'
    WHEN c.slug = 'bondues' THEN 'Bondues : centre, résidences pavillonnaires ; proximité Marcq-en-Barœul, Mouvaux, Tourcoing.'
    WHEN c.slug = 'marcq-en-baroeul' THEN 'Marcq-en-Barœul : Croisé-Laroche, République, Clemenceau, Lazare-Garreau ; proximité Lille, La Madeleine, Bondues.'
  END as zones_text,
  true as published,
  '2025-09-09 09:00:00+00:00'::timestamptz as published_at
FROM services s
CROSS JOIN cities c
WHERE s.slug = 'pompe-a-chaleur' 
  AND c.slug IN ('saint-andre-lez-lille', 'bondues', 'marcq-en-baroeul')
ON CONFLICT (service_id, city_id) DO UPDATE SET
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description,
  h1 = EXCLUDED.h1,
  h2_intro = EXCLUDED.h2_intro,
  intro_description = EXCLUDED.intro_description,
  cta_title = EXCLUDED.cta_title,
  cta_subtitle = EXCLUDED.cta_subtitle,
  zones_text = EXCLUDED.zones_text,
  published = EXCLUDED.published,
  published_at = EXCLUDED.published_at,
  updated_at = now();

-- Créer les offres de services pour chaque ville
INSERT INTO service_city_offers (page_id, position, emoji, title, description)
SELECT 
  scp.id as page_id,
  o.pos as position,
  o.emoji,
  o.title,
  o.description
FROM service_city_pages scp
JOIN services s ON scp.service_id = s.id
JOIN cities c ON scp.city_id = c.id
CROSS JOIN LATERAL ( VALUES
  (1, '🔍', 'Étude & dimensionnement PAC', 'Bilan thermique, choix technologique et dimensionnement adapté au bâti local.'),
  (2, '🏗', 'Installation PAC air/eau + ballon ECS', 'Pose complète, raccordements hydrauliques, régulation et mise en service.'),
  (3, '♻️', 'Remplacement chaudière par PAC', 'Conversion énergétique, vérification émetteurs et solutions hybrides.'),
  (4, '🧪', 'Optimisation circuit (équilibrage & désembouage)', 'Nettoyage circuit, équilibrage débits et optimisation rendement.'),
  (5, '🧰', 'Entretien & dépannage PAC', 'Maintenance préventive, contrôles réglementaires et interventions curatives.'),
  (6, '📝', 'Aides & démarches administratives', 'Accompagnement MaPrimeRénov'', CEE et conformité réglementaire.')
) AS o(pos, emoji, title, description)
WHERE s.slug = 'pompe-a-chaleur' 
  AND c.slug IN ('saint-andre-lez-lille', 'bondues', 'marcq-en-baroeul')
ON CONFLICT (page_id, position) DO UPDATE SET
  emoji = EXCLUDED.emoji,
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  updated_at = now();

-- Créer les FAQs pour Saint-André-lez-Lille
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT s.id, c.id, f.pos, f.q, f.a, true
FROM services s
JOIN cities c ON c.slug = 'saint-andre-lez-lille'
CROSS JOIN LATERAL ( VALUES
  (1, 'Quelle PAC pour un logement andrésien ?', 'Air/eau recommandée pour circuit radiateurs/plancher ; air/air pour appartements avec besoins limités en ECS.'),
  (2, 'Contraintes locales et autorisations ?', 'Respect PLU et règlement de copropriété ; gestion des démarches administratives et validation technique.'),
  (3, 'Où implanter l''unité extérieure ?', 'Jardin, cour ou balcon selon configuration ; traitement acoustique et respect distances réglementaires.'),
  (4, 'Compatibilité avec chauffage existant ?', 'Étude préalable du circuit ; désembouage et adaptation émetteurs si nécessaire pour optimiser rendement.'),
  (5, 'Entretien et maintenance PAC ?', 'Visite annuelle recommandée ; contrôles obligatoires selon puissance et suivi performance.'),
  (6, 'Économies et retour sur investissement ?', 'Réduction significative facture énergétique ; amortissement moyen selon isolation et usage.'),
  (7, 'Délais de réalisation du projet ?', 'Installation sur 1-2 jours après validation technique et administrative complète.'),
  (8, 'Aides financières disponibles ?', 'Accompagnement complet MaPrimeRénov''/CEE ; montage dossiers et suivi versements.')
) AS f(pos, q, a)
WHERE s.slug = 'pompe-a-chaleur'
ON CONFLICT (service_id, city_id, position) DO UPDATE SET
  question = EXCLUDED.question,
  answer = EXCLUDED.answer,
  published = EXCLUDED.published,
  updated_at = now();

-- Créer les FAQs pour Bondues
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT s.id, c.id, f.pos, f.q, f.a, true
FROM services s
JOIN cities c ON c.slug = 'bondues'
CROSS JOIN LATERAL ( VALUES
  (1, 'Quelle PAC choisir pour une maison bonduoise ?', 'PAC air/eau privilégiée pour maisons avec circuit chauffage ; dimensionnement selon surface et isolation.'),
  (2, 'Réglementation et contraintes locales ?', 'Respect du PLU bonduois ; coordination syndic et gestion nuisances acoustiques pour le voisinage.'),
  (3, 'Installation unité extérieure en résidence ?', 'Jardin ou terrasse avec dégagements suffisants ; solutions esthétiques et traitement phonique.'),
  (4, 'Rénovation énergétique globale ?', 'Intégration PAC dans projet complet ; synergie isolation, ventilation et autres équipements.'),
  (5, 'Suivi et maintenance technique ?', 'Entretien préventif annuel ; télésurveillance disponible et intervention rapide si dysfonctionnement.'),
  (6, 'Performances et économies attendues ?', 'COP optimisé selon climat local ; réduction substantielle consommation vs énergies fossiles.'),
  (7, 'Planning et durée des travaux ?', 'Planification personnalisée ; réalisation généralement sur 1-2 jours ouvrés selon complexité.'),
  (8, 'Financement et aides publiques ?', 'Montage complet dossiers subventions ; accompagnement jusqu''au versement des primes obtenues.')
) AS f(pos, q, a)
WHERE s.slug = 'pompe-a-chaleur'
ON CONFLICT (service_id, city_id, position) DO UPDATE SET
  question = EXCLUDED.question,
  answer = EXCLUDED.answer,
  published = EXCLUDED.published,
  updated_at = now();

-- Créer les FAQs pour Marcq-en-Barœul
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT s.id, c.id, f.pos, f.q, f.a, true
FROM services s
JOIN cities c ON c.slug = 'marcq-en-baroeul'
CROSS JOIN LATERAL ( VALUES
  (1, 'Quelle PAC pour le secteur marcquois ?', 'Air/eau recommandée pour maisons et grands appartements ; air/air pour logements sans circuit centralisé.'),
  (2, 'Contraintes urbaines à Marcq-en-Barœul ?', 'Gestion des accès, mitoyenneté et réglementation acoustique ; coordination professionnelle avec copropriétés.'),
  (3, 'Implantation optimale de l''unité extérieure ?', 'Cour, jardin ou balcon selon configuration ; respect environnement résidentiel et nuisances sonores.'),
  (4, 'Adaptation au chauffage existant ?', 'Diagnostic circuit hydraulique ; désembouage et optimisation émetteurs pour fonctionnement basse température.'),
  (5, 'Entretien PAC : que prévoir ?', 'Maintenance annuelle obligatoire selon puissance ; contrôles étanchéité et optimisation paramètres.'),
  (6, 'Retour sur investissement marcquois ?', 'Amortissement fonction isolation/usage ; économies immédiates et valorisation patrimoine immobilier.'),
  (7, 'Durée et organisation du chantier ?', 'Installation professionnelle sur 1-2 jours ; planification selon contraintes résidentielles.'),
  (8, 'Aides financières et démarches ?', 'Expertise complète éligibilité ; gestion administrative MaPrimeRénov''/CEE jusqu''au versement.')
) AS f(pos, q, a)
WHERE s.slug = 'pompe-a-chaleur'
ON CONFLICT (service_id, city_id, position) DO UPDATE SET
  question = EXCLUDED.question,
  answer = EXCLUDED.answer,
  published = EXCLUDED.published,
  updated_at = now();