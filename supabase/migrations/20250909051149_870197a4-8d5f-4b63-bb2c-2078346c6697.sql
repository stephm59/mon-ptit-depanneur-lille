-- Create FAQs for chauffagiste marcq-en-baroeul
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
  (1, 'Vos délais d''intervention au Croisé-Laroche et au Bourg ?', 'En urgence, nous intervenons sous 2 heures dans Marcq (Croisé-Laroche, Bourg, Plouich, Pont, Rouges-Barres). Nous commençons par une mise en sécurité (contrôles gaz, ventilation, tirage) puis réparons ou programmons un remplacement de pièce. En période froide, nous priorisons les foyers sans chauffage ni eau chaude.'),
  (2, 'Quel est le coût d''un entretien annuel à Marcq-en-Barœul ?', 'Comptez 120 à 160 € TTC selon l''appareil (gaz, fioul, condensation). L''entretien inclut nettoyage du brûleur/corps de chauffe, réglages, contrôles sécurité/combustion et attestation pour l''assurance. C''est indispensable pour la sécurité, la durabilité et les performances.'),
  (3, 'Remplacez-vous des chaudières anciennes par des modèles à condensation ?', 'Oui. Nous réalisons une étude de dimensionnement (surface, isolation, habitudes) pour choisir un modèle performant, compatible avec vos radiateurs et conduits (ventouse/cheminée tubée). La prestation comprend la dépose/évacuation de l''ancien appareil et la mise en service. Devis clair et délais annoncés.'),
  (4, 'Intervenez-vous dans les maisons familiales de Plouich et Rouges-Barres ?', 'Oui, fréquemment. Ces habitations peuvent présenter des réseaux longs et parfois emboués. Nous vérifions la pression, purgeons les radiateurs, proposons un désembouage si nécessaire et rééquilibrons les débits. Résultat : montée en température plus rapide et consommation en baisse.'),
  (5, 'Proposez-vous des contrats d''entretien pour bailleurs/syndics à Marcq ?', 'Oui, contrats annuels pour maisons, appartements et résidences : visite planifiée, priorité en cas de panne, tarifs préférentiels sur certaines interventions. Coordination avec gardiens/syndics pour limiter la gêne dans les parties communes.'),
  (6, 'Ma chaudière est dans une cuisine exiguë : avez-vous des modèles adaptés ?', 'Oui, nous installons des modèles compacts à condensation (faible emprise, faible niveau sonore) adaptés aux cuisines/celliers exigus. Nous soignons l''intégration (évacuations, prises, habillage) et expliquons les bons réglages pour allier confort et économies.'),
  (7, 'Intervenez-vous le week-end en cas de panne à Marcq ?', 'Oui, permanence le samedi et parfois le dimanche pour les urgences (chaudière à l''arrêt, fuite). Tarifs de week-end communiqués à l''avance. Mise en sécurité immédiate et, si besoin, dépannage provisoire avant la réparation définitive en semaine.'),
  (8, 'Aides financières : suis-je éligible pour un remplacement de chaudière ?', 'Selon votre situation, vous pouvez bénéficier d''aides (ex. MaPrimeRénov'', primes énergie). Nous vous guidons sur l''éligibilité, les justificatifs et le calendrier pour optimiser budget et délais, et vous aider à sélectionner un modèle éligible.')
) AS faqs_data(position, question, answer)
WHERE s.slug = 'chauffagiste' AND c.slug = 'marcq-en-baroeul';