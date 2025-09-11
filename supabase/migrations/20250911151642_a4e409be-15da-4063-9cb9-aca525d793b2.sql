-- Insert FAQs for the pompe à chaleur blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
((SELECT id FROM blog_posts WHERE slug = 'avantages-inconvenients-pompe-chaleur'), 'La pompe à chaleur est-elle rentable ?', 'Oui, sur le long terme. Même si l''investissement de départ est élevé, les économies d''énergie peuvent réduire vos factures de chauffage de 30 à 60 %.', 1),
((SELECT id FROM blog_posts WHERE slug = 'avantages-inconvenients-pompe-chaleur'), 'Quelle est la durée de vie d''une pompe à chaleur ?', 'En moyenne, 15 à 20 ans, à condition d''un entretien régulier.', 2),
((SELECT id FROM blog_posts WHERE slug = 'avantages-inconvenients-pompe-chaleur'), 'Une pompe à chaleur fait-elle du bruit ?', 'L''unité extérieure peut générer un léger bruit (ventilateur, compresseur), mais les modèles récents sont de plus en plus silencieux.', 3),
((SELECT id FROM blog_posts WHERE slug = 'avantages-inconvenients-pompe-chaleur'), 'Peut-on installer une pompe à chaleur dans une maison ancienne ?', 'Oui, mais il faut vérifier l''isolation. Une maison mal isolée réduira les performances de la PAC.', 4),
((SELECT id FROM blog_posts WHERE slug = 'avantages-inconvenients-pompe-chaleur'), 'Quelle différence entre PAC air-air et air-eau ?', 'Air-air : chauffe directement l''air (idéal pour clim réversible). Air-eau : chauffe de l''eau pour radiateurs, plancher chauffant et ballon d''eau chaude.', 5),
((SELECT id FROM blog_posts WHERE slug = 'avantages-inconvenients-pompe-chaleur'), 'Quelles aides financières pour une PAC ?', 'MaPrimeRénov'', Éco-prêt à taux zéro (éco-PTZ), Certificats d''économie d''énergie (CEE) - À condition de passer par un artisan RGE.', 6)
ON CONFLICT (blog_post_id, question) DO UPDATE SET
  answer = EXCLUDED.answer,
  position = EXCLUDED.position;