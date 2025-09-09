-- OFFRES POUR LOMME
with p as (
  select p.id from service_city_pages p
  join services s on s.id = p.service_id and s.slug='pompe-a-chaleur'
  join cities   c on c.id = p.city_id   and c.slug='lomme'
)
insert into service_city_offers (page_id, position, emoji, icon_name, title, description)
values
((select id from p),1,'🔍',null,'Étude & dimensionnement PAC','Analyse thermique adaptée aux contraintes urbaines lommaises et optimisation énergétique.'),
((select id from p),2,'🏗',null,'Installation PAC air/eau + ballon ECS','Pose en logement compact, gestion des accès réduits et mise en service complète.'),
((select id from p),3,'♻️',null,'Remplacement de chaudière par PAC','Transition énergétique avec conservation du réseau existant si compatible.'),
((select id from p),4,'🧪',null,'Optimisation circuit (équilibrage & désembouage)','Préparation du système pour performances optimales à basse température.'),
((select id from p),5,'🧰',null,'Entretien & dépannage PAC','Maintenance préventive et interventions rapides, contrats personnalisés.'),
((select id from p),6,'📝',null,'Aides & conformité urbaine','Accompagnement administratif, dossiers MaPrimeRénov''/CEE et autorisations.')
on conflict (page_id, position) do update
set emoji = excluded.emoji, icon_name = excluded.icon_name, title = excluded.title, description = excluded.description, updated_at = now();

-- FAQ POUR LOMME
insert into service_city_faqs (service_id, city_id, position, question, answer, published)
select s.id, c.id, f.pos, f.q, f.a, true
from services s
join cities   c on c.slug='lomme'
join lateral ( values
  (1,'Quelle PAC pour un logement lommois (Marais/Bourg) ?','Air/eau pour chauffage central + ECS ; air/air multisplit pour appartements sans circuit eau, efficace en rénovation.'),
  (2,'Contraintes d''accès en centre-ville : solutions ?','Planification logistique adaptée, matériel compact, coordination avec syndics et riverains pour installation sans gêne.'),
  (3,'Implantation en zone urbaine dense : où placer l''unité ?','Cour, balcon renforcé ou façade arrière, avec plots antivibratiles et respect des distances réglementaires.'),
  (4,'Ancien chauffage au gaz : compatibilité PAC ?','Souvent possible après diagnostic circuit, désembouage et ajustement des températures de fonctionnement.'),
  (5,'Maintenance en ville : fréquence et prestations ?','Visite annuelle recommandée, nettoyage échangeurs, contrôle étanchéité et optimisation des réglages.'),
  (6,'Performances en hiver : à quoi s''attendre ?','COP stable même par -7°C, confort maintenu avec appoint électrique ponctuel si nécessaire.'),
  (7,'Délais installation en logement lommois ?','Entre 1 et 3 jours selon configuration, préparation circuit et contraintes d''accès urbain.'),
  (8,'Financement et aides locales disponibles ?','MaPrimeRénov'', CEE, éco-PTZ : nous gérons l''éligibilité et les démarches administratives.')
) as f(pos,q,a) on true
where s.slug='pompe-a-chaleur'
on conflict (service_id, city_id, position) do update
set question = excluded.question, answer = excluded.answer, published = excluded.published, updated_at = now();

-- OFFRES POUR LAMBERSART
with p as (
  select p.id from service_city_pages p
  join services s on s.id = p.service_id and s.slug='pompe-a-chaleur'
  join cities   c on c.id = p.city_id   and c.slug='lambersart'
)
insert into service_city_offers (page_id, position, emoji, icon_name, title, description)
values
((select id from p),1,'🔍',null,'Étude & dimensionnement PAC','Évaluation personnalisée selon type d''habitat lambersartois et besoins énergétiques.'),
((select id from p),2,'🏗',null,'Installation PAC air/eau + ballon ECS','Pose soignée en pavillon ou résidence, intégration architecturale et mise en service.'),
((select id from p),3,'♻️',null,'Remplacement de chaudière par PAC','Modernisation énergétique avec option hybride selon émetteurs existants.'),
((select id from p),4,'🧪',null,'Optimisation circuit (équilibrage & désembouage)','Conditionnement du réseau pour rendement maximal et confort optimal.'),
((select id from p),5,'🧰',null,'Entretien & dépannage PAC','Suivi technique régulier, interventions préventives et dépannage prioritaire.'),
((select id from p),6,'📝',null,'Aides & conseil rénovation','Montage dossiers subventions, conseils techniques et suivi réglementaire.')
on conflict (page_id, position) do update
set emoji = excluded.emoji, icon_name = excluded.icon_name, title = excluded.title, description = excluded.description, updated_at = now();

-- FAQ POUR LAMBERSART
insert into service_city_faqs (service_id, city_id, position, question, answer, published)
select s.id, c.id, f.pos, f.q, f.a, true
from services s
join cities   c on c.slug='lambersart'
join lateral ( values
  (1,'PAC air/eau ou air/air à Lambersart ?','Air/eau pour maisons avec radiateurs/plancher + ECS ; air/air pour rafraîchissement estival et chauffage ciblé.'),
  (2,'Réglementations locales : démarches nécessaires ?','Déclaration préalable possible selon implantation, nous conseillons et accompagnons les démarches administratives.'),
  (3,'Choix emplacement unité extérieure ?','Jardin, terrasse ou façade non exposée aux pièces de nuit, avec accès maintenance et respect du voisinage.'),
  (4,'Radiateurs existants : faut-il changer ?','Évaluation case par case : souvent compatibles après optimisation circuit et réglage loi d''eau adaptée.'),
  (5,'Entretien obligatoire pour une PAC ?','Visite annuelle recommandée et contrôle étanchéité selon réglementation, maintenance préventive conseillée.'),
  (6,'Économies réelles vs chauffage actuel ?','Réduction 40-60% vs électrique, 20-40% vs gaz selon isolation, avec confort thermique amélioré.'),
  (7,'Temps d''installation en pavillon ?','Généralement 2-3 jours : préparation, pose, raccordements et mise en service avec formation utilisateur.'),
  (8,'Aides financières : montants et conditions ?','MaPrimeRénov'' jusqu''à 4000€, CEE et éco-PTZ : simulation personnalisée et accompagnement complet.')
) as f(pos,q,a) on true
where s.slug='pompe-a-chaleur'
on conflict (service_id, city_id, position) do update
set question = excluded.question, answer = excluded.answer, published = excluded.published, updated_at = now();