-- Créer les pages service-city pour chauffagiste et vitrier
-- D'abord, récupérer les IDs des services et villes nécessaires

-- Pages chauffagiste pour toutes les villes
INSERT INTO service_city_pages (
  service_id, 
  city_id, 
  published, 
  meta_title, 
  meta_description, 
  h1, 
  h2_intro, 
  intro_description, 
  zones_text, 
  cta_title, 
  cta_subtitle,
  published_at
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  CONCAT('Chauffagiste ', c.name, ' (installation, entretien, dépannage) | Mon p''tit Dépanneur') as meta_title,
  CONCAT('Chauffagiste professionnel à ', c.name, ' : installation chaudière, entretien, dépannage, remplacement. Intervention rapide. Devis gratuit. Garantie travaux.') as meta_description,
  CONCAT('Chauffagiste ', c.name, ' (installation, entretien, dépannage)') as h1,
  CONCAT('Solutions de chauffage complètes pour ', c.name, ' et alentours.') as h2_intro,
  CONCAT('Mon p''tit Dépanneur intervient à ', c.name, ' pour tous vos besoins en chauffage : installation de chaudières (gaz, fioul, électrique), entretien annuel obligatoire, dépannage d''urgence et remplacement. Nos chauffagistes qualifiés assurent un service rapide et professionnel avec garantie sur tous les travaux.') as intro_description,
  CONCAT(c.name, ' et communes limitrophes : intervention dans tous les quartiers et zones résidentielles.') as zones_text,
  CONCAT('Besoin d''un chauffagiste à ', c.name, ' ?') as cta_title,
  'Intervention rapide, devis gratuit et travaux garantis.' as cta_subtitle,
  now() as published_at
FROM services s, cities c 
WHERE s.slug = 'chauffagiste' AND c.published = true;

-- Pages vitrier pour toutes les villes  
INSERT INTO service_city_pages (
  service_id, 
  city_id, 
  published, 
  meta_title, 
  meta_description, 
  h1, 
  h2_intro, 
  intro_description, 
  zones_text, 
  cta_title, 
  cta_subtitle,
  published_at
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  CONCAT('Vitrier ', c.name, ' (remplacement, réparation vitre) | Mon p''tit Dépanneur') as meta_title,
  CONCAT('Vitrier professionnel à ', c.name, ' : remplacement vitre cassée, double vitrage, miroiterie. Intervention d''urgence. Devis gratuit. Assurance prise en charge.') as meta_description,
  CONCAT('Vitrier ', c.name, ' (remplacement, réparation vitre)') as h1,
  CONCAT('Spécialiste du verre et vitrage pour ', c.name, ' et environs.') as h2_intro,
  CONCAT('Notre équipe de vitriers intervient rapidement à ', c.name, ' pour le remplacement de vitres cassées, l''installation de double vitrage, la pose de miroirs et tous travaux de miroiterie. Service d''urgence disponible 7j/7 avec prise en charge assurance et devis gratuit sur place.') as intro_description,
  CONCAT(c.name, ' et alentours : intervention rapide dans tous les secteurs de la ville.') as zones_text,
  CONCAT('Besoin d''un vitrier à ', c.name, ' ?') as cta_title,
  'Intervention d''urgence, devis gratuit et assurance acceptée.' as cta_subtitle,
  now() as published_at
FROM services s, cities c 
WHERE s.slug = 'vitrier' AND c.published = true;