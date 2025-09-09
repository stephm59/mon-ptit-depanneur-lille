-- FAQ pour Lomme
insert into service_city_faqs (service_id, city_id, position, question, answer, published)
select s.id, c.id, f.pos, f.q, f.a, true
from services s
join cities   c on c.slug='lomme'
join lateral ( values
  (1,'Quelle PAC choisir à Lomme (logement ancien vs récent) ?','Air/eau recommandée pour raccordement radiateurs/plancher ; air/air pour appartements sans circuit eau chaude centralisé.'),
  (2,'Contraintes urbaines : comment procéder ?','Étude d''implantation selon accès, mitoyenneté et réglementation acoustique communale ; coordination avec syndic si nécessaire.'),
  (3,'Où installer l''unité extérieure en ville ?','Cour, balcon ou façade arrière avec plots anti-vibrations ; respect distances et nuisances sonores pour le voisinage.'),
  (4,'Chauffage existant : peut-on conserver ?','Souvent compatible après désembouage du circuit ; ajustement loi d''eau et remplacement ponctuel d''émetteurs obsolètes.'),
  (5,'Entretien d''une PAC : que prévoir ?','Maintenance annuelle recommandée ; contrôle étanchéité obligatoire selon puissance et type de fluide frigorigène.'),
  (6,'Économies attendues à Lomme ?','Réduction significative vs chaudière gaz/fioul grâce au rendement élevé ; suivi post-installation pour optimisation.'),
  (7,'Délais de réalisation ?','Après validation technique, installation généralement sur 1-2 journées selon complexité du chantier.'),
  (8,'Aides financières : prise en charge ?','Accompagnement complet : éligibilité, constitution dossiers MaPrimeRénov''/CEE, suivi administratif.')
) as f(pos,q,a) on true
where s.slug='pompe-a-chaleur'
on conflict (service_id, city_id, position) do update
set question = excluded.question, answer = excluded.answer, published = excluded.published, updated_at = now();

-- FAQ pour Lambersart
insert into service_city_faqs (service_id, city_id, position, question, answer, published)
select s.id, c.id, f.pos, f.q, f.a, true
from services s
join cities   c on c.slug='lambersart'
join lateral ( values
  (1,'Quelle PAC pour un pavillon lambersartois ?','Air/eau privilégiée pour maisons avec circuit de chauffage central ; dimensionnement selon isolation et surface.'),
  (2,'Autorisations et contraintes locales ?','Respect du PLU et des règles de copropriété ; nous gérons les démarches administratives et techniques.'),
  (3,'Implantation de l''unité extérieure ?','Jardin ou cour avec dégagement suffisant ; traitement acoustique et esthétique selon environnement résidentiel.'),
  (4,'Rénovation énergétique globale ?','PAC intégrable dans projet global ; synergie avec isolation, ventilation et autres équipements performants.'),
  (5,'Maintenance et suivi technique ?','Entretien préventif annuel ; télésurveillance possible et intervention rapide en cas de dysfonctionnement.'),
  (6,'Retour sur investissement ?','Amortissement moyen 8-12 ans selon situation ; économies immédiates et valorisation du bien immobilier.'),
  (7,'Planning d''installation ?','Planification selon disponibilités ; pose généralement réalisée en 1-2 jours ouvrés.'),
  (8,'Financement et aides publiques ?','Montage complet des dossiers de subventions ; accompagnement jusqu''au versement des primes.')
) as f(pos,q,a) on true
where s.slug='pompe-a-chaleur'
on conflict (service_id, city_id, position) do update
set question = excluded.question, answer = excluded.answer, published = excluded.published, updated_at = now();