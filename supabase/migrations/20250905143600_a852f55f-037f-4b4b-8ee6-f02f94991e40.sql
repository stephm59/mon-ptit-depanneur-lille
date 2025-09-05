-- Add remaining FAQs (continuing from where we left off)
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
SELECT 
  s.id as service_id,
  c.id as city_id,
  faqs.position,
  faqs.question,
  faqs.answer,
  faqs.published
FROM (VALUES 
  ('plombier', 'villeneuve-d-ascq', 5, 'Faites-vous des rénovations de salle de bains clés en main ?', 'Oui, coordination carrelage/électricité incluse.', true),
  ('plombier', 'villeneuve-d-ascq', 6, 'Intervenez-vous le week-end ?', 'Oui, selon disponibilités.', true),
  ('plombier', 'villeneuve-d-ascq', 7, 'Accompagnez-vous les dossiers d''assurance ?', 'Oui, documents fournis pour prise en charge.', true),
  ('plombier', 'villeneuve-d-ascq', 8, 'Zones couvertes à Villeneuve-d''Ascq ?', 'Hôtel-de-Ville, Triolo, Pont-de-Bois, Annappes, Ascq + communes voisines (Mons-en-Barœul, Hellemmes, Wasquehal, Croix, Lezennes, Lille).', true),
  ('plombier', 'marcq-en-baroeul', 1, 'Pouvez-vous intervenir au Croisé-Laroche rapidement ?', 'Oui, créneaux express selon la charge.', true),
  ('plombier', 'marcq-en-baroeul', 2, 'Le débouchage crée-t-il des salissures ?', 'Nous protégeons les lieux et travaillons proprement.', true),
  ('plombier', 'marcq-en-baroeul', 3, 'Remplacement de ballon : prenez-vous l''évacuation de l''ancien ?', 'Oui, c''est compris dans la prestation.', true),
  ('plombier', 'marcq-en-baroeul', 4, 'L''adoucisseur est-il pertinent à Marcq ?', 'Oui, pour limiter le tartre et protéger vos équipements.', true),
  ('plombier', 'marcq-en-baroeul', 5, 'Rénovation de salle de bains : gérez-vous la coordination ?', 'Oui, devis clair et coordination des corps d''état.', true),
  ('plombier', 'marcq-en-baroeul', 6, 'Interventions le samedi ?', 'Oui, selon disponibilités.', true),
  ('plombier', 'bondues', 1, 'Pouvez-vous intervenir le jour même à Bondues ?', 'Oui, selon créneaux disponibles.', true),
  ('plombier', 'bondues', 2, 'Débouchage évier/WC : durée moyenne ?', 'Souvent < 1h selon l''accès et la nature du bouchon.', true),
  ('plombier', 'la-madeleine', 1, 'Pouvez-vous intervenir rapidement à La Madeleine ?', 'Oui, proximité Lille = délais courts.', true),
  ('plombier', 'la-madeleine', 2, 'Débouchage en immeuble : possible ?', 'Oui, en respectant les règles de copropriété.', true),
  ('plombier', 'lambersart', 1, 'Intervention sous 2h à Lambersart ?', 'Possible selon charge et créneau.', true),
  ('plombier', 'lambersart', 2, 'Débouchage : dégâts à prévoir ?', 'Non, méthode non destructive.', true),
  ('plombier', 'saint-andre-lez-lille', 1, 'Pouvez-vous venir rapidement à Saint-André ?', 'Oui, créneaux express selon charge.', true),
  ('plombier', 'saint-andre-lez-lille', 2, 'Débouchage : quels équipements ?', 'Furet électrique, pompe HP.', true),
  ('plombier', 'lomme', 1, 'Intervention rapide à Lomme ?', 'Oui, selon créneau.', true),
  ('plombier', 'lomme', 2, 'Débouchage : durée ?', 'Souvent < 1h selon bouchon.', true)
) AS faqs(service_slug, city_slug, position, question, answer, published)
JOIN services s ON s.slug = faqs.service_slug
JOIN cities c ON c.slug = faqs.city_slug;