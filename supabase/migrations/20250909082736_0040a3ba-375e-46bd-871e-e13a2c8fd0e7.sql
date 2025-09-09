-- OFFRES pour Lomme
with p as (
  select p.id from service_city_pages p
  join services s on s.id = p.service_id and s.slug='pompe-a-chaleur'
  join cities   c on c.id = p.city_id   and c.slug='lomme'
)
insert into service_city_offers (page_id, position, emoji, icon_name, title, description)
values
((select id from p),1,'🔍',null,'Étude & dimensionnement PAC','Étude adaptée aux contraintes urbaines, accès réduits et optimisation énergétique.'),
((select id from p),2,'🏗',null,'Installation PAC air/eau + ballon ECS','Pose en logements anciens, régulation performante et mise en service.'),
((select id from p),3,'♻️',null,'Remplacement de chaudière par PAC','Compatibilité radiateurs existants, solutions hybrides disponibles.'),
((select id from p),4,'🧪',null,'Optimisation circuit (équilibrage & désembouage)','Protection du système, amélioration du rendement à basse température.'),
((select id from p),5,'🧰',null,'Entretien & dépannage PAC','Contrat annuel, vérifications réglementaires et diagnostics.'),
((select id from p),6,'📝',null,'Aides & démarches administratives','Accompagnement MaPrimeRénov'', CEE et dossiers techniques.')
on conflict (page_id, position) do update
set emoji = excluded.emoji, icon_name = excluded.icon_name, title = excluded.title, description = excluded.description, updated_at = now();

-- OFFRES pour Lambersart
with p as (
  select p.id from service_city_pages p
  join services s on s.id = p.service_id and s.slug='pompe-a-chaleur'
  join cities   c on c.id = p.city_id   and c.slug='lambersart'
)
insert into service_city_offers (page_id, position, emoji, icon_name, title, description)
values
((select id from p),1,'🔍',null,'Étude & dimensionnement PAC','Étude personnalisée selon architecture locale et contraintes résidentielles.'),
((select id from p),2,'🏗',null,'Installation PAC air/eau + ballon ECS','Pose soignée en pavillons et résidences, réglages précis.'),
((select id from p),3,'♻️',null,'Remplacement de chaudière par PAC','Transition énergétique, compatibilité avec émetteurs existants.'),
((select id from p),4,'🧪',null,'Optimisation circuit (équilibrage & désembouage)','Préparation du réseau, protection et performance optimale.'),
((select id from p),5,'🧰',null,'Entretien & dépannage PAC','Maintenance préventive, contrôles obligatoires et interventions.'),
((select id from p),6,'📝',null,'Aides & conformité réglementaire','Montage dossiers prime, respect normes et autorisations.')
on conflict (page_id, position) do update
set emoji = excluded.emoji, icon_name = excluded.icon_name, title = excluded.title, description = excluded.description, updated_at = now();