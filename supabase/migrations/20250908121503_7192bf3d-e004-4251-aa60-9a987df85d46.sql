
do $$
declare
  v_service_id uuid;
  v_city_id uuid;
begin
  -- Service "plombier"
  select id into v_service_id
  from public.services
  where slug = 'plombier'
  limit 1;

  if v_service_id is null then
    raise exception 'Service "plombier" introuvable (slug = plombier).';
  end if;

  -- Ville "Marcq-en-Barœul" (tolère les 2 variantes de slug + fallback sur le nom)
  select id into v_city_id
  from public.cities
  where slug in ('marcq-en-baroeul','marcq-en-barœul')
     or name ilike 'Marcq-en-Baroeul'
     or name ilike 'Marcq-en-Barœul'
  limit 1;

  if v_city_id is null then
    raise exception 'Ville "Marcq-en-Barœul" introuvable (slug attendu: marcq-en-baroeul).';
  end if;

  -- Remplacer les FAQ locales existantes pour ce couple
  delete from public.service_city_faqs
  where service_id = v_service_id
    and city_id = v_city_id;

  -- Insérer les 8 nouvelles FAQ (positions 1 à 8)
  insert into public.service_city_faqs (service_id, city_id, position, published, question, answer) values
  (
    v_service_id, v_city_id, 1, true,
    'Pouvez-vous intervenir rapidement au Croisé-Laroche ou dans le Bourg de Marcq ?',
    'Oui, ces quartiers sont parmi les plus sollicités et nous y intervenons très régulièrement. Grâce à notre organisation par secteurs, un plombier peut être sur place en moins de deux heures pour les urgences (fuite, canalisation bouchée). Pour les interventions planifiées, comme le remplacement d’un ballon ou une rénovation de salle de bains, nous proposons un rendez-vous sous 48 h. Cette proximité avec Lille nous permet d’être réactifs, même aux heures de forte circulation sur les axes Clemenceau et République.'
  ),
  (
    v_service_id, v_city_id, 2, true,
    'Réalisez-vous le débouchage de canalisations dans les maisons de Plouich ou Rouges-Barres ?',
    'Oui, nous intervenons dans les pavillons récents comme dans les maisons anciennes de Plouich et des Rouges-Barres. Les canalisations de ces habitations présentent parfois des dépôts calcaires ou des affaissements. Nous utilisons des outils professionnels (furet électrique, pompe haute pression, caméra d’inspection) pour éliminer efficacement les bouchons. Notre priorité est d’éviter les dégâts dans les installations existantes et de rendre le réseau pleinement fonctionnel. Après chaque intervention, nous donnons des conseils pour prévenir de nouveaux engorgements.'
  ),
  (
    v_service_id, v_city_id, 3, true,
    'Prenez-vous en charge l’évacuation d’un ballon d’eau chaude usagé ?',
    'Oui, l’évacuation est incluse dans notre prestation. Lors du remplacement, nous procédons à la vidange, sécurisons l’appareil, puis assurons la dépose et l’évacuation de l’ancien ballon vers une filière de recyclage agréée. Nous proposons des modèles électriques et thermodynamiques adaptés aux besoins des familles marcquoises. L’installation est réalisée avec raccordements conformes et mise en service immédiate. Un certificat d’intervention est remis à chaque client, attestant de la conformité aux normes en vigueur.'
  ),
  (
    v_service_id, v_city_id, 4, true,
    'L’eau est-elle calcaire à Marcq-en-Barœul ? Faut-il un adoucisseur ?',
    'Oui, l’eau de Marcq est dure, ce qui entraîne tartre et dépôts dans les canalisations et les chauffe-eaux. Un adoucisseur permet de prolonger la durée de vie de vos installations, d’améliorer le confort quotidien et de réduire les traces sur la vaisselle et la robinetterie. Nous conseillons le modèle le plus adapté à la taille de votre foyer et assurons son installation ainsi que son entretien. Cela représente un investissement rentable sur le long terme.'
  ),
  (
    v_service_id, v_city_id, 5, true,
    'Proposez-vous des devis détaillés pour la rénovation de salles de bains à Marcq ?',
    'Oui, nous réalisons des devis gratuits et détaillés, avec plans et conseils personnalisés. Nous intervenons dans des maisons de caractère comme dans des appartements modernes. Les travaux comprennent la plomberie, l’électricité, la pose de sanitaires, et la coordination avec carreleurs et peintres. Nos clients du Croisé-Laroche et du Bourg apprécient particulièrement notre suivi “clé en main” et la propreté du chantier. Nous adaptons les solutions à vos contraintes d’espace et de budget.'
  ),
  (
    v_service_id, v_city_id, 6, true,
    'Intervenez-vous le samedi à Marcq-en-Barœul ?',
    'Oui, des créneaux sont disponibles le samedi pour les urgences (fuites, canalisations bouchées) ou pour les rendez-vous planifiés. Cette flexibilité est particulièrement utile pour les familles et les actifs qui ne peuvent pas se libérer en semaine. Nous communiquons toujours le tarif spécifique pour les interventions hors horaires classiques, afin de garantir une transparence totale.'
  ),
  (
    v_service_id, v_city_id, 7, true,
    'Travaillez-vous avec les assurances en cas de dégât des eaux à Marcq ?',
    'Oui, nous sommes agréés par de nombreuses compagnies (Macif, Gan, Groupama, Maaf…). Après un dégât des eaux, nous fournissons un devis clair, des photos et une facture détaillée. Nous savons aussi dialoguer avec les experts mandatés pour accélérer le remboursement. Cette prise en charge simplifie vos démarches et réduit votre stress dans une période déjà contraignante.'
  ),
  (
    v_service_id, v_city_id, 8, true,
    'Quels quartiers de Marcq-en-Barœul couvrez-vous ?',
    'Nous couvrons l’ensemble de Marcq : Bourg, Croisé-Laroche, Plouich, Pont, Rouges-Barres, ainsi que les zones proches de la Marque. Nous intervenons également dans les communes voisines : Wasquehal, La Madeleine, Lille et Mons-en-Barœul. Cette implantation locale nous permet d’assurer un service rapide et adapté à chaque type de logement, du pavillon familial à l’appartement en résidence.'
  );
end $$;
