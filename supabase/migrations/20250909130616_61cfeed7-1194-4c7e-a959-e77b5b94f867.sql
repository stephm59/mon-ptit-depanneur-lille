-- Mettre à jour le slug du service "renovation-salle-de-bain" vers "renovation-salle-de-bains"
UPDATE services 
SET 
  slug = 'renovation-salle-de-bains',
  name = 'Rénovation salle de bains',
  updated_at = now()
WHERE slug = 'renovation-salle-de-bain';

-- Mettre à jour les éventuelles références dans blog_posts si elles existent
UPDATE blog_posts 
SET service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bains')
WHERE service_id = (SELECT id FROM services WHERE slug = 'renovation-salle-de-bain');