-- Insert service city offers for vitrier
WITH service_data AS (
  SELECT s.id as service_id, c.id as city_id, p.id as page_id, c.slug
  FROM services s
  CROSS JOIN cities c
  INNER JOIN service_city_pages p ON p.service_id = s.id AND p.city_id = c.id
  WHERE s.slug = 'vitrier' 
  AND c.slug IN ('lille', 'vieux-lille', 'villeneuve-d-ascq', 'marcq-en-baroeul', 'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme')
)
INSERT INTO service_city_offers (page_id, position, title, description, icon_name, emoji)
SELECT 
  sd.page_id,
  offer_data.position,
  offer_data.title,
  offer_data.description,
  offer_data.icon_name,
  offer_data.emoji
FROM service_data sd
CROSS JOIN (
  VALUES 
  (1, 'Dépannage vitrerie urgent', 'Intervention rapide 24h/7j pour mise en sécurité immédiate après bris de glace, effraction ou accident', 'Clock', '🚨'),
  (2, 'Remplacement de vitres', 'Remplacement de vitres simples ou doubles, sur mesure avec verre standard, sécurisé ou acoustique', 'Square', '🔧'),
  (3, 'Double vitrage & isolation', 'Installation de double vitrage pour améliorer isolation thermique et phonique, réduction des nuisances sonores', 'Shield', '🏠'),
  (4, 'Baies vitrées & grandes surfaces', 'Pose de baies vitrées coulissantes, fixes ou oscillo-battantes adaptées à votre habitat', 'Maximize2', '🚪'),
  (5, 'Miroirs & miroiterie décorative', 'Fabrication et pose de miroirs sur mesure, crédences en verre, tablettes et éléments décoratifs', 'Sparkles', '✨'),
  (6, 'Vitrage sécurisé & anti-effraction', 'Installation de verres feuilletés, trempés ou retardateurs d'effraction pour sécuriser votre domicile', 'Lock', '🛡️')
) AS offer_data(position, title, description, icon_name, emoji);