-- Create testimonials for chauffagiste bondues
INSERT INTO public.testimonials (content, author_name, location, rating, published, service_id, city_id, created_at, updated_at)
SELECT
  content,
  author_name,
  location,
  5 as rating,
  true as published,
  s.id as service_id,
  c.id as city_id,
  now() as created_at,
  now() as updated_at
FROM public.services s, public.cities c, (VALUES
  ('Panne de chaudière en soirée. Mise en sécurité immédiate et réparation le lendemain matin. Très pro et rassurant.', 'Blandine', 'Montjoie'),
  ('Désembouage complet sur un grand réseau + équilibrage : chaleur homogène dans toute la maison.', 'Xavier', 'Ravennes-les-Francs'),
  ('Remplacement par une chaudière à condensation. Pose soignée, explications claires sur la programmation.', 'Héloïse', 'centre de Bondues'),
  ('Entretien annuel impeccable, attestation fournie et réglages optimisés pour baisser la consommation.', 'Damien', 'limite Mouvaux'),
  ('Intervention un samedi pour une fuite sur le circuit. Dépannage provisoire puis réparation définitive.', 'Agnès', 'secteur campagne'),
  ('Devis précis, délais respectés, chantier propre. Service client très réactif.', 'Romain', 'proche golf')
) AS testimonials_data(content, author_name, location)
WHERE s.slug = 'chauffagiste' AND c.slug = 'bondues';

-- Create FAQs for chauffagiste bondues
INSERT INTO public.service_city_faqs (service_id, city_id, position, question, answer, published, created_at, updated_at)
SELECT
  s.id as service_id,
  c.id as city_id,
  position,
  question,
  answer,
  true as published,
  now() as created_at,
  now() as updated_at
FROM public.services s, public.cities c, (VALUES
  (1, 'Vos délais d''intervention à Bondues (Montjoie, Ravennes-les-Francs, grandes propriétés) ?', 'En urgence, nous intervenons généralement sous 2 heures. Nous commençons par une mise en sécurité (contrôle gaz, ventilation, tirage) et visons une remise en route quand c''est possible. Pour les remplacements de pièces spécifiques, nous programmons un retour rapide. Notre organisation par secteurs réduit les temps de trajet même en période hivernale.'),
  (2, 'Quel est le coût d''un entretien annuel de chaudière à Bondues ?', 'Entre 120 et 160 € TTC selon l''appareil (gaz, fioul, condensation). L''entretien comprend : nettoyage brûleur/corps de chauffe, vérification des organes de sécurité, mesure de combustion et attestation obligatoire. Objectifs : sécurité, performance, durabilité et conformité vis-à-vis de l''assurance.'),
  (3, 'Votre approche pour les maisons de grande superficie aux réseaux longs ?', 'Nous réalisons un diagnostic hydraulique : pression, débits, pertes de charge, équilibrage par radiateur. Un désembouage peut être recommandé si l''eau est chargée. Nous ajustons les vannes thermostatiques et la courbe de chauffe pour une chaleur homogène à l''étage comme au rez-de-chaussée, tout en réduisant la consommation.'),
  (4, 'Remplacez-vous les chaudières anciennes par des modèles à condensation ?', 'Oui. Nous effectuons une étude de dimensionnement (surface, isolation, habitudes) pour sélectionner un modèle performant et compatible (radiateurs existants, ventouse/cheminée tubée). La prestation inclut la dépose/évacuation de l''ancien appareil, la mise en service et les réglages de base.'),
  (5, 'Proposez-vous des contrats d''entretien pour résidences et bailleurs à Bondues ?', 'Oui, des contrats annuels pour maisons individuelles et petites résidences : visite planifiée, priorité en cas de panne, et tarifs préférentiels sur certaines interventions. Coordination possible avec gardien/syndic pour limiter la gêne.'),
  (6, 'Que faire si des radiateurs restent tièdes dans une aile de la maison ?', 'C''est souvent un déséquilibre ou de l''embouage. Nous vérifions la pression statique, purgeons, rééquilibrons les débits et, si besoin, procédons à un désembouage. Résultat : montée en température plus rapide et confort homogène, avec baisse de la consommation.'),
  (7, 'Intervenez-vous le week-end en cas de panne à Bondues ?', 'Oui, permanence le samedi et parfois le dimanche pour les urgences (chaudière à l''arrêt, fuite). Les frais de week-end sont annoncés à l''avance. Nous sécurisons immédiatement et assurons un dépannage provisoire si une pièce spécifique doit être commandée.'),
  (8, 'Aides financières : suis-je éligible à Bondues pour remplacer ma chaudière ?', 'Selon votre situation, des aides (MaPrimeRénov'', primes énergie) peuvent s''appliquer pour passer à un modèle plus performant. Nous vous accompagnons sur l''éligibilité, les justificatifs et le calendrier, afin d''optimiser le budget et les délais.')
) AS faqs_data(position, question, answer)
WHERE s.slug = 'chauffagiste' AND c.slug = 'bondues';