-- Create testimonials for Pompe à chaleur Villeneuve-d'Ascq
INSERT INTO public.testimonials (
  service_id, city_id, author_name, location, content, rating, published
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  testimonial.author_name,
  testimonial.location,
  testimonial.content,
  testimonial.rating,
  true as published
FROM public.services s, public.cities c
CROSS JOIN (
  VALUES 
    ('Catherine', 'Flers-Bourg', 'Remplacement de chaudière par une PAC air/eau. Bonne intégration, confort thermique retrouvé, consommation réduite.', 5),
    ('Hugo', 'campus universitaire', 'Installation rapide dans une résidence étudiante, bruit extérieur contrôlé, PAC bien dimensionnée.', 5),
    ('Émilie', 'Annappes', 'Entretien complet avec ajustement de la régulation et conseils pratiques. Service fiable.', 5),
    ('Rachid', 'Brigode', 'Dépannage rapide en janvier : problème de givre réglé avec déplacement de la sonde extérieure.', 5),
    ('Sophie', 'Triolo', 'Pose PAC + ballon ECS : installation propre, délais respectés, bonnes explications de l''installateur.', 5),
    ('Paul', 'Hôtel de Ville', 'Optimisation circuit (désembouage + équilibrage) : radiateurs homogènes, PAC plus silencieuse.', 5)
) testimonial(author_name, location, content, rating)
WHERE s.slug = 'pompe-a-chaleur' AND c.slug = 'villeneuve-d-ascq';

-- Create FAQs for Pompe à chaleur Villeneuve-d'Ascq
INSERT INTO public.service_city_faqs (
  service_id, city_id, question, answer, position, published
)
SELECT 
  s.id as service_id,
  c.id as city_id,
  faq.question,
  faq.answer,
  faq.position,
  true as published
FROM public.services s, public.cities c
CROSS JOIN (
  VALUES 
    ('Quelle PAC est la plus adaptée à Villeneuve-d''Ascq (air/eau ou air/air) ?', 'Air/eau si vous souhaitez chauffer avec radiateurs ou plancher + ECS ; air/air si chauffage/rafraîchissement suffisent (sans ECS), adaptée aux logements compacts.', 1),
    ('La PAC est-elle efficace lors des hivers à Villeneuve-d''Ascq ?', 'Oui, si bien dimensionnée et installée avec une régulation adaptée. Les pics de froid peuvent être couverts par un appoint ou une solution hybride.', 2),
    ('La PAC peut-elle s''installer en résidence étudiante ou en copropriété ?', 'Oui. Nous réalisons les dossiers pour le syndic : bruit, implantation, notices techniques, conformité. Solutions silencieuses et compactes pour éviter les nuisances.', 3),
    ('Je possède des radiateurs en fonte : sont-ils compatibles ?', 'Oui, avec une bonne étude hydraulique, un désembouage et un équilibrage. Les PAC modernes fonctionnent en basse température, mais un remplacement partiel peut être recommandé.', 4),
    ('Quelles économies espérer avec une PAC à Villeneuve-d''Ascq ?', 'Selon isolation et usage, les économies peuvent atteindre 30 à 50 % par rapport au gaz/fioul. Nous simulons votre cas avec un SCOP adapté à votre logement.', 5),
    ('Quelles aides financières disponibles ?', 'Les habitants de Villeneuve-d''Ascq peuvent prétendre à MaPrimeRénov'' et aux primes CEE. Nous vous guidons dans le montage des dossiers et fournissons tous les justificatifs nécessaires.', 6),
    ('Faut-il un contrat d''entretien annuel ?', 'Oui, recommandé et parfois obligatoire selon la charge en fluide. Nous vérifions étanchéité, courbe de chauffe, dégivrage, circulateur et régulation.', 7),
    ('Où placer l''unité extérieure dans les quartiers de Villeneuve-d''Ascq ?', 'Dans une cour, un jardin ou sur un balcon technique. Nous veillons au respect des normes acoustiques locales et à la bonne gestion des condensats en hiver.', 8)
) faq(question, answer, position)
WHERE s.slug = 'pompe-a-chaleur' AND c.slug = 'villeneuve-d-ascq';