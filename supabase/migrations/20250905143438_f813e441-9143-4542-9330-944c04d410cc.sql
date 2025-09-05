-- Import service_city_faqs with proper foreign key mapping - First 20 FAQs
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT 
  s.id as service_id,
  c.id as city_id,
  faqs.position,
  faqs.question,
  faqs.answer,
  faqs.published
FROM (VALUES 
  ('plombier', 'lille', 1, 'Comment se déroule une réparation de fuite d''eau à Lille ?', 'Localisation de la fuite, réparation immédiate si possible et devis clair pour les réparations lourdes.', true),
  ('plombier', 'lille', 2, 'Quel est le délai moyen pour un débouchage de canalisation à Lille ?', 'Généralement sous 2h pour les urgences, selon accessibilité et type de canalisation.', true),
  ('plombier', 'lille', 3, 'Combien coûte le remplacement d''un ballon d''eau chaude à Lille ?', 'Dépend du modèle et de la capacité (ex. 200–500€ HT + pose). Devis précis après diagnostic.', true),
  ('plombier', 'lille', 4, 'Pourquoi installer un adoucisseur d''eau à Lille ?', 'Pour limiter le calcaire, protéger les canalisations et allonger la durée de vie des appareils.', true),
  ('plombier', 'lille', 5, 'Faites-vous des devis pour la rénovation complète d''une salle de bains à Lille ?', 'Oui, devis détaillé et gratuit (plomberie, électricité, carrelage).', true),
  ('plombier', 'lille', 6, 'Intervenez-vous le week-end et les jours fériés à Lille ?', 'Oui, selon disponibilités de nos équipes de garde.', true),
  ('plombier', 'lille', 7, 'Travaillez-vous avec les assurances en cas de dégât des eaux à Lille ?', 'Oui, entreprise agréée par de nombreuses compagnies. Aide à la paperasse.', true),
  ('plombier', 'lille', 8, 'Dans quelles zones autour de Lille intervenez-vous ?', 'Tous les quartiers de Lille et communes voisines (La Madeleine, Lambersart, Mons-en-Barœul, Saint-André-lez-Lille, Villeneuve-d''Ascq, Marcq-en-Barœul, Lomme, Loos).', true),
  ('plombier', 'vieux-lille', 1, 'Pouvez-vous intervenir rapidement dans le Vieux-Lille ?', 'Oui, créneaux express possibles selon la charge, y compris en centre historique.', true),
  ('plombier', 'vieux-lille', 2, 'Le débouchage abîme-t-il les finitions ?', 'Non, nous travaillons proprement et protégeons les lieux avant intervention.', true),
  ('plombier', 'vieux-lille', 3, 'Remplacez-vous les ballons d''eau chaude en habitat ancien ?', 'Oui, nous adaptons la pose aux contraintes de l''immeuble et de la pièce.', true),
  ('plombier', 'vieux-lille', 4, 'Faites-vous de petites réparations (robinetterie, joints) ?', 'Oui, interventions efficaces et garanties.', true),
  ('plombier', 'vieux-lille', 5, 'Proposez-vous des solutions gain de place pour la salle de bains ?', 'Oui, étude et devis pour douches, meubles compacts, optimisation de l''espace.', true),
  ('plombier', 'vieux-lille', 6, 'Peut-on obtenir un devis avant déplacement ?', 'Oui, estimation téléphonique puis devis détaillé après diagnostic si nécessaire.', true),
  ('plombier', 'vieux-lille', 7, 'Prenez-vous en charge la relation assurance ?', 'Oui, devis/facture/photos fournis pour dossier.', true),
  ('plombier', 'vieux-lille', 8, 'Quelles zones couvrez-vous autour du Vieux-Lille ?', 'Centre-Ville, Esplanade, La Madeleine, Vauban-Esquermes.', true),
  ('plombier', 'villeneuve-d-ascq', 1, 'Intervenez-vous sur les campus et résidences étudiantes ?', 'Oui, dans le respect des règles des résidences.', true),
  ('plombier', 'villeneuve-d-ascq', 2, 'Débouchage : quels équipements utilisez-vous ?', 'Furet électrique, pompe haute pression, au besoin inspection.', true),
  ('plombier', 'villeneuve-d-ascq', 3, 'Remplacez-vous les ballons d''eau chaude rapidement ?', 'Oui, selon stock et accès au local technique.', true),
  ('plombier', 'villeneuve-d-ascq', 4, 'L''adoucisseur est-il utile à Villeneuve-d''Ascq ?', 'Oui, utile contre le calcaire sur le réseau local.', true)
) AS faqs(service_slug, city_slug, position, question, answer, published)
JOIN services s ON s.slug = faqs.service_slug
JOIN cities c ON c.slug = faqs.city_slug
ON CONFLICT (service_id, city_id, position) DO UPDATE SET 
  question = EXCLUDED.question,
  answer = EXCLUDED.answer,
  published = EXCLUDED.published,
  updated_at = now();