-- Create testimonials for chauffagiste villeneuve-d-ascq
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
  ('Panne de chauffage dans mon studio. Le technicien est arrivé dans l''après-midi et a relancé la chaudière après un réglage. Service clair et efficace.', 'Mathilde', 'Pont-de-Bois'),
  ('Désembouage complet + purge des radiateurs : la maison chauffe mieux et plus vite. Conseils utiles pour programmer le thermostat.', 'Romain', 'Annappes'),
  ('Entretien annuel fait en 40 minutes, attestation fournie et vérifications complètes. Très pro.', 'Hajar', 'Cité scientifique'),
  ('Remplacement d''une vieille chaudière par un modèle à condensation. Pose propre, explications détaillées et mise en service le jour même.', 'Guillaume', 'Brigode'),
  ('Intervention un samedi matin pour une panne soudaine. Mise en sécurité puis changement de pièce le lundi. Communication parfaite.', 'Éva', 'Ascq'),
  ('Tarifs transparents, délais respectés. Le chauffagiste a aussi réglé mes vannes thermostatiques pour équilibrer le circuit.', 'Pierre', 'Flers-Bourg')
) AS testimonials_data(content, author_name, location)
WHERE s.slug = 'chauffagiste' AND c.slug = 'villeneuve-d-ascq';

-- Create FAQs for chauffagiste villeneuve-d-ascq
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
  (1, 'Quels sont vos délais pour dépanner une chaudière à Villeneuve-d''Ascq (campus, Annappes, Ascq) ?', 'En urgence, nous intervenons généralement sous 2 heures sur Villeneuve-d''Ascq. Nos équipes sont réparties par secteurs (Pont-de-Bois, Cité scientifique, Annappes/Ascq, Brigode) pour limiter les trajets. Nous commençons par une mise en sécurité (coupe-gaz, contrôle des fuites, vérification tirage/ventouse), puis effectuons la réparation ou programmons un remplacement de pièce si nécessaire.'),
  (2, 'Quel est le prix d''un entretien annuel de chaudière à Villeneuve-d''Ascq ?', 'L''entretien coûte en moyenne 120 à 160 € TTC selon le type d''appareil (gaz, fioul, condensation). Il comprend le nettoyage du brûleur et du corps de chauffe, le contrôle des organes de sécurité, la mesure de combustion et la remise de l''attestation obligatoire. Cet entretien est indispensable pour la sécurité, la durée de vie et la couverture assurance.'),
  (3, 'Intervenez-vous dans les résidences étudiantes et logements compacts ?', 'Oui. Nous avons l''habitude des espaces réduits, des accès par badge et des plannings serrés. Nous proposons des modèles compacts (condensation petite emprise) et des solutions économiques : réglages optimisés, programmation hebdo, robinets thermostatiques pour ne chauffer que les pièces occupées.'),
  (4, 'Remplacez-vous les anciennes chaudières par des modèles plus économes ?', 'Oui, avec étude du dimensionnement (surface, isolation, nombre d''occupants) pour éviter la sur-ou sous-puissance. Nous privilégions des chaudières à condensation performantes, compatibles avec l''existant (radiateurs, ventouse/conduit) et nous gérons l''évacuation de l''ancien appareil. Un devis détaillé précise matériel, main-d''œuvre et délais.'),
  (5, 'Proposez-vous des contrats d''entretien pour les bailleurs/syndics à Villeneuve-d''Ascq ?', 'Oui. Contrats annuels pour appartements, maisons et résidences : visite planifiée, priorité en cas de panne, tarifs préférentiels sur certaines interventions. Nous savons coordonner avec gardien/bailleur pour limiter la gêne dans les bâtiments collectifs.'),
  (6, 'Que faire si mes radiateurs chauffent mal malgré une chaudière récente ?', 'C''est souvent un souci d''équilibrage ou d''embouage. Nous vérifions la pression, purgeons les radiateurs, ajustons les débits et proposons un désembouage si l''eau est chargée. À la clé : meilleure montée en température, confort accru et conso en baisse.'),
  (7, 'Intervenez-vous le week-end en cas de panne de chauffage ?', 'Oui, nous assurons une permanence le samedi et parfois le dimanche pour les urgences (chaudière à l''arrêt, fuite sur circuit). Les frais de week-end sont communiqués à l''avance. Nous réalisons la mise en sécurité et, si besoin, un dépannage provisoire avant la réparation définitive en semaine.'),
  (8, 'Aides financières : puis-je en bénéficier pour remplacer ma chaudière à Villeneuve-d''Ascq ?', 'Selon votre situation, vous pouvez prétendre à des aides (ex. MaPrimeRénov'', primes énergie) pour remplacer une chaudière ancienne par un modèle plus performant. Nous vous guidons sur l''éligibilité, les pièces à fournir et le calendrier afin d''optimiser le budget et les délais du chantier.')
) AS faqs_data(position, question, answer)
WHERE s.slug = 'chauffagiste' AND c.slug = 'villeneuve-d-ascq';