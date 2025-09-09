-- Add service city offers for renovation-salle-de-bain
-- Delete existing offers first
DELETE FROM service_city_offers 
WHERE page_id IN (
  SELECT id FROM service_city_pages 
  WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain')
);

-- Insert all offers for all cities
INSERT INTO service_city_offers (page_id, position, title, description, icon_name, emoji)
VALUES
  -- Lille offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lille'), 1, 'Douche à l''italienne', 'Création ou remplacement avec étanchéité parfaite, receveur extra-plat, parois sur mesure.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lille'), 2, 'Baignoire & balnéo', 'Installation de baignoire classique, îlot ou balnéo avec habillage esthétique.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lille'), 3, 'Mobilier & rangements', 'Meubles suspendus, vasques doubles, colonnes de rangement intégrées.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lille'), 4, 'Carrelage & faïence', 'Pose de carrelage mural et sol, mosaïques décoratives, joints hydrofuges.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lille'), 5, 'Accessibilité & sécurité', 'Adaptation PMR : barres d''appui, sièges de douche, sol antidérapant.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lille'), 6, 'Éclairage & ventilation', 'Spots LED étanches, VMC silencieuse, miroirs lumineux.', '', '💡'),

  -- Vieux-Lille offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'vieux-lille'), 1, 'Douches compactes italiennes', 'Solutions gain de place avec receveurs extra-plats, étanchéité renforcée et parois discrètes.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'vieux-lille'), 2, 'Baignoires asymétriques', 'Modèles compacts adaptés aux appartements anciens, combinés baignoire-douche.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'vieux-lille'), 3, 'Meubles design', 'Mobilier suspendu et sur mesure, optimisé pour petites surfaces.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'vieux-lille'), 4, 'Carrelage chic & patrimonial', 'Carrelages métro, faïences élégantes, pose respectueuse du bâti ancien.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'vieux-lille'), 5, 'Accessibilité copropriétés', 'Solutions PMR adaptées aux appartements anciens et petites salles de bains.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'vieux-lille'), 6, 'Éclairage intégré', 'Spots LED basse conso, miroirs rétroéclairés, ventilation discrète.', '', '💡'),

  -- Villeneuve-d'Ascq offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'villeneuve-d-ascq'), 1, 'Douches modernes', 'Douches spacieuses ou compactes, adaptées aux familles et étudiants.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'villeneuve-d-ascq'), 2, 'Baignoires familiales', 'Installation de baignoires classiques ou combinées douche-bain.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'villeneuve-d-ascq'), 3, 'Mobilier pratique', 'Meubles sous-vasques, colonnes, rangements optimisés.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'villeneuve-d-ascq'), 4, 'Carrelages variés', 'Grès cérame, faïences modernes, mosaïques décoratives.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'villeneuve-d-ascq'), 5, 'Accessibilité PMR', 'Adaptations sécurisées pour seniors et étudiants à mobilité réduite.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'villeneuve-d-ascq'), 6, 'Éclairage & ventilation', 'Éclairage LED, ventilation renforcée pour appartements étudiants.', '', '💡'),

  -- Marcq-en-Barœul offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'marcq-en-baroeul'), 1, 'Douche italienne design', 'Grand receveur, parois transparentes, finitions haut de gamme.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'marcq-en-baroeul'), 2, 'Baignoire balnéo', 'Baignoires balnéo ou îlot pour confort et relaxation.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'marcq-en-baroeul'), 3, 'Mobilier suspendu', 'Meubles contemporains, doubles vasques, rangements intégrés.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'marcq-en-baroeul'), 4, 'Carrelage haut de gamme', 'Faïence grand format, mosaïque décorative, finitions premium.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'marcq-en-baroeul'), 5, 'Accessibilité optimisée', 'Douche sécurisée, barres, sièges escamotables pour seniors.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'marcq-en-baroeul'), 6, 'Éclairage LED', 'Éclairage encastré, miroirs rétroéclairés, VMC silencieuse.', '', '💡'),

  -- Bondues offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'bondues'), 1, 'Douches spacieuses', 'Douche italienne grand format, receveur carrelé, parois haut de gamme.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'bondues'), 2, 'Baignoires îlot', 'Baignoires centrales ou balnéo, parfaites pour grandes salles de bains.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'bondues'), 3, 'Mobilier sur mesure', 'Meubles adaptés aux grandes pièces, avec finitions premium.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'bondues'), 4, 'Carrelage premium', 'Marbre, pierre naturelle, faïence design grand format.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'bondues'), 5, 'Accessibilité luxe', 'Solutions sécurisées avec finitions esthétiques pour seniors.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'bondues'), 6, 'Éclairage architectural', 'Lignes LED intégrées, miroirs haut de gamme, ventilation optimisée.', '', '💡'),

  -- La Madeleine offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'la-madeleine'), 1, 'Douche gain de place', 'Douches compactes pour petits appartements et studios.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'la-madeleine'), 2, 'Baignoires compactes', 'Solutions asymétriques et combinées pour petits espaces.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'la-madeleine'), 3, 'Mobilier adapté', 'Meubles suspendus, colonnes de rangement étroites, optimisation.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'la-madeleine'), 4, 'Carrelages modernes', 'Faïence design, carrelage métro, mosaïque décorative.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'la-madeleine'), 5, 'Accessibilité copro', 'Douche PMR compacte, barres de maintien, sièges escamotables.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'la-madeleine'), 6, 'Éclairage & ventilation', 'LED économiques, miroirs lumineux, VMC performante.', '', '💡'),

  -- Lambersart offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lambersart'), 1, 'Douche italienne élégante', 'Receveur extra-plat, parois haut de gamme, étanchéité parfaite.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lambersart'), 2, 'Baignoire îlot', 'Installation dans maisons bourgeoises, mise en valeur des volumes.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lambersart'), 3, 'Mobilier raffiné', 'Meubles design adaptés aux intérieurs bourgeois et modernes.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lambersart'), 4, 'Carrelages nobles', 'Carrelage grand format, pierre naturelle, mosaïque artistique.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lambersart'), 5, 'Accessibilité haut de gamme', 'Adaptations PMR esthétiques et fonctionnelles.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lambersart'), 6, 'Éclairage raffiné', 'Miroirs rétroéclairés, spots étanches, VMC discrète.', '', '💡'),

  -- Saint-André-lez-Lille offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'saint-andre-lez-lille'), 1, 'Douches pratiques', 'Douches italiennes optimisées pour maisons mitoyennes.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'saint-andre-lez-lille'), 2, 'Baignoires compactes', 'Solutions adaptées aux petits espaces et appartements.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'saint-andre-lez-lille'), 3, 'Mobilier fonctionnel', 'Meubles modulaires pour optimiser les surfaces réduites.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'saint-andre-lez-lille'), 4, 'Carrelage esthétique', 'Carrelage moderne, faïence décorative, finitions soignées.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'saint-andre-lez-lille'), 5, 'Accessibilité sécurisée', 'Douches PMR, barres, sols antidérapants pour seniors.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'saint-andre-lez-lille'), 6, 'Éclairage & VMC', 'LED basse conso, ventilation efficace pour maisons mitoyennes.', '', '💡'),

  -- Lomme offers
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lomme'), 1, 'Douche italienne moderne', 'Receveur plat, parois sur mesure, pose rapide.', '', '🚿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lomme'), 2, 'Baignoire familiale', 'Baignoire classique ou combinée pour familles lommoises.', '', '🛁'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lomme'), 3, 'Mobilier pratique', 'Meubles suspendus, colonnes, rangements pour optimiser l''espace.', '', '🪞'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lomme'), 4, 'Carrelage durable', 'Grès cérame, faïence pratique, mosaïques modernes.', '', '🧱'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lomme'), 5, 'Accessibilité PMR', 'Douche sécurisée, barres, sièges pliants, sols antidérapants.', '', '♿'),
  ((SELECT scp.id FROM service_city_pages scp 
    JOIN services s ON s.id = scp.service_id 
    JOIN cities c ON c.id = scp.city_id 
    WHERE s.slug = 'renovation-salle-de-bain' AND c.slug = 'lomme'), 6, 'Éclairage & confort', 'Éclairage LED, miroirs lumineux, VMC silencieuse.', '', '💡');