
DO $$
DECLARE
  v_service_id uuid;
  v_city_id uuid;
BEGIN
  -- Récupérer l'ID du service "plombier"
  SELECT id INTO v_service_id
  FROM public.services
  WHERE slug = 'plombier'
  LIMIT 1;

  IF v_service_id IS NULL THEN
    RAISE EXCEPTION 'Service avec slug % introuvable', 'plombier';
  END IF;

  -- Récupérer l'ID de la ville "lomme"
  SELECT id INTO v_city_id
  FROM public.cities
  WHERE slug = 'lomme'
  LIMIT 1;

  IF v_city_id IS NULL THEN
    RAISE EXCEPTION 'Ville avec slug % introuvable', 'lomme';
  END IF;

  -- Supprimer les anciennes FAQs locales pour ce couple (service, ville)
  DELETE FROM public.service_city_faqs
  WHERE service_id = v_service_id
    AND city_id = v_city_id;

  -- Insérer les nouvelles FAQs locales (positions 1 à 8)
  INSERT INTO public.service_city_faqs (service_id, city_id, position, published, question, answer)
  VALUES
    (v_service_id, v_city_id, 1, true,
     'Pouvez-vous intervenir rapidement dans les pavillons de la Délivrance ?',
     'Oui, nous intervenons fréquemment dans ce quartier pavillonnaire. En cas d’urgence (fuite, canalisation bouchée), un plombier peut être sur place sous deux heures. Pour les travaux programmés (remplacement de ballon, rénovation de salle de bains), nous proposons des rendez-vous sous 48 h. Nous connaissons bien la configuration des maisons de la Délivrance, ce qui nous permet d’adapter nos interventions avec efficacité et respect des lieux.'),
    (v_service_id, v_city_id, 2, true,
     'Combien de temps faut-il pour déboucher une canalisation à Lomme ?',
     'En moyenne, une intervention dure entre 30 minutes et 1 heure, selon l’accès et la gravité du bouchon. Pour un évier ou lavabo, un débouchage simple suffit. Pour des canalisations principales ou des WC fortement engorgés, nous utilisons des méthodes plus avancées comme le furet électrique ou l’hydrocurage. Une inspection caméra peut être proposée pour identifier les causes profondes (affaissement, calcaire, racines).'),
    (v_service_id, v_city_id, 3, true,
     'Proposez-vous des ballons d’eau chaude adaptés aux familles lommoises ?',
     'Oui, nous proposons une gamme de ballons électriques de 100 à 300 L, adaptés aux besoins des familles comme des couples. Dans les pavillons familiaux, un modèle de 200 à 300 L est recommandé. Nous assurons la dépose, l’évacuation et l’installation du nouveau ballon avec mise en service immédiate. Pour les logements plus compacts, nous conseillons des modèles horizontaux ou thermodynamiques pour optimiser l’espace et réduire la consommation énergétique.'),
    (v_service_id, v_city_id, 4, true,
     'L’eau est-elle calcaire à Lomme ? Faut-il un adoucisseur ?',
     'Oui, l’eau de la métropole lilloise est dure. Cela entraîne du tartre dans les canalisations, une usure prématurée des ballons d’eau chaude et des traces sur la robinetterie. Installer un adoucisseur permet de protéger vos installations, de réduire la consommation énergétique de votre chauffe-eau et d’améliorer le confort quotidien. Nous proposons des modèles adaptés à toutes tailles de foyers, avec installation complète et entretien annuel.'),
    (v_service_id, v_city_id, 5, true,
     'Faites-vous des rénovations de salles de bains dans les maisons mitoyennes de Lomme ?',
     'Oui, nous intervenons souvent dans les maisons mitoyennes où l’espace est limité. Nous proposons des solutions optimisées : douches à l’italienne compactes, meubles suspendus, WC gain de place. Nous refaisons les réseaux d’alimentation et d’évacuation si nécessaire, tout en coordonnant les autres corps de métier (carreleurs, électriciens, peintres). Nous proposons des devis gratuits et détaillés pour adapter le projet à vos besoins et à votre budget.'),
    (v_service_id, v_city_id, 6, true,
     'Êtes-vous disponibles le samedi pour des interventions à Lomme ?',
     'Oui, nous proposons des interventions le samedi, principalement pour les urgences (fuites, engorgements, ballon en panne). Nos équipes sont organisées pour assurer un service continu, même en dehors des horaires de bureau. Les tarifs de week-end sont communiqués à l’avance afin de garantir une totale transparence.'),
    (v_service_id, v_city_id, 7, true,
     'Travaillez-vous avec les assurances après un dégât des eaux à Lomme ?',
     'Oui, nous sommes agréés par de nombreuses compagnies (Macif, Maaf, Groupama, Gan). Après un dégât des eaux, nous fournissons devis, photos et facture détaillée. Nous pouvons également échanger avec l’expert mandaté par l’assurance afin d’accélérer la prise en charge et de réduire vos démarches.'),
    (v_service_id, v_city_id, 8, true,
     'Quelles zones de Lomme couvrez-vous ?',
     'Nous intervenons dans tous les quartiers : Bourg, Délivrance, Mitterie, Mont-à-Camp. Nous couvrons également les communes limitrophes : Loos, Capinghem, Lambersart et Lille. Cette proximité nous permet de proposer des interventions rapides, qu’il s’agisse d’une urgence ou d’un projet planifié.');
END $$;
