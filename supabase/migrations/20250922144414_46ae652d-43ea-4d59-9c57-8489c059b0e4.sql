INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  bp.id,
  faq.question,
  faq.answer,
  faq.position
FROM blog_posts bp,
(VALUES 
  ('Un simple nettoyage de filtres suffit-il ?', 'Non. L''évaporateur et le bac à condensats doivent être nettoyés et désinfectés pour éviter odeurs et surconsommation.', 1),
  ('Pourquoi ai-je de l''eau sous l''unité intérieure ?', 'Souvent un condensat obstrué ou une pompe de relevage fatiguée. L''entretien vérifie et remet en état le circuit.', 2),
  ('Ma clim devient plus bruyante, est-ce normal ?', 'Avec le temps, encrassement et silentblocs tassés augmentent le bruit. Un contrôle et un écran absorbant si nécessaire règlent souvent le problème.', 3),
  ('L''entretien réduit-il la consommation électrique ?', 'Oui. Échangeurs propres et consignes adaptées diminuent les heures à haut régime.', 4),
  ('Je peux désinfecter moi-même ?', 'Vous pouvez rafraîchir (sprays grand public), mais un pro utilise des produits/techniques adaptés aux matériaux et à la sécurité (pas de dégâts ni d''inhalation à risque).', 5),
  ('Combien d''entretiens par an ?', '1 minimum ; 2 si clim réversible utilisée l''été et l''hiver.', 6),
  ('Faut-il changer les filtres ?', 'Selon modèle : lavables (on nettoie) ou jetables (on remplace). Le technicien vous dira la référence et la fréquence.', 7),
  ('Quelle période idéale ?', 'Printemps (avant chaleur) et éventuellement début d''automne (avant chauffage mi-saison).', 8),
  ('L''entretien est-il obligatoire en copro ?', 'Pas systémique, mais recommandé et parfois demandé par le syndic pour limiter pannes/nuisances.', 9),
  ('Et les mauvaises odeurs ?', 'Elles partent avec un vrai nettoyage évaporateur + bac + ligne de condensats et, si besoin, une désinfection ciblée.', 10)
) AS faq(question, answer, position)
WHERE bp.slug = 'entretien-clim-checklist-pro';