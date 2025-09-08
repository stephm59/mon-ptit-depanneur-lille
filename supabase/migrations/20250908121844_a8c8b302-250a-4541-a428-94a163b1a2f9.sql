
DO $$
DECLARE
  v_service uuid;
  v_city uuid;
BEGIN
  -- Récupération des IDs
  SELECT id INTO v_service FROM public.services WHERE slug = 'plombier' AND published = true LIMIT 1;
  SELECT id INTO v_city FROM public.cities WHERE slug = 'bondues' AND published = true LIMIT 1;

  IF v_service IS NULL THEN
    RAISE EXCEPTION 'Service "plombier" introuvable ou non publié';
  END IF;

  IF v_city IS NULL THEN
    RAISE EXCEPTION 'Ville "Bondues" introuvable ou non publiée';
  END IF;

  -- Remplacement des FAQ existantes pour ce couple
  DELETE FROM public.service_city_faqs
  WHERE service_id = v_service AND city_id = v_city;

  -- Insertion des 8 nouvelles FAQ (positions 1 à 8)
  INSERT INTO public.service_city_faqs (service_id, city_id, position, published, question, answer) VALUES
  (
    v_service, v_city, 1, true,
    'Pouvez-vous intervenir rapidement dans les quartiers résidentiels de Bondues, comme Montjoie ou Ravennes-les-Francs ?',
    'Oui, nous sommes régulièrement appelés dans ces secteurs composés de grandes maisons familiales et de pavillons récents. Grâce à notre proximité, un plombier peut intervenir sous 2 heures pour une urgence (fuite, canalisation bouchée). Pour les interventions programmées, nous proposons un rendez-vous sous 24 à 48 h. Nos véhicules sont équipés pour gérer la plupart des réparations dès la première visite, ce qui réduit les délais et évite des déplacements multiples.'
  ),
  (
    v_service, v_city, 2, true,
    'Les canalisations enterrées posent-elles des difficultés particulières à Bondues ?',
    'Oui, dans certaines propriétés spacieuses, les réseaux d’évacuation sont longs et parfois enterrés depuis plusieurs décennies. Ils peuvent être obstrués par des racines, des dépôts calcaires ou des affaissements de terrain. Nous utilisons des équipements adaptés : caméra d’inspection pour localiser le bouchon, pompe haute pression pour déboucher sans dégrader les conduites. Si un remplacement est nécessaire, nous proposons des solutions de rénovation partielle plutôt que de lourds travaux.'
  ),
  (
    v_service, v_city, 3, true,
    'Quel est le prix moyen d’un remplacement de ballon d’eau chaude à Bondues ?',
    'Le prix dépend de la capacité et du type de ballon. Pour une famille de 4 personnes, un ballon de 200 L coûte entre 250 et 600 € TTC, pose incluse. Cela comprend la dépose, l’évacuation de l’ancien appareil et l’installation d’un nouveau modèle conforme aux normes actuelles. Nous proposons également des ballons thermodynamiques, plus économes en énergie, adaptés aux grandes maisons. Un devis détaillé est toujours fourni avant travaux.'
  ),
  (
    v_service, v_city, 4, true,
    'Faut-il installer un adoucisseur à Bondues ?',
    'Oui, l’eau est calcaire à Bondues comme dans toute la métropole. Le tartre use prématurément les chauffe-eaux, encrasse la robinetterie et diminue l’efficacité des appareils électroménagers. Un adoucisseur prolonge la durée de vie de vos installations, réduit les traces sur la vaisselle et améliore le confort quotidien. Nous proposons des modèles adaptés aux grandes familles et assurons leur mise en service ainsi que leur entretien annuel.'
  ),
  (
    v_service, v_city, 5, true,
    'Réalisez-vous des rénovations de salles de bains dans les grandes maisons de Bondues ?',
    'Oui, nous avons l’habitude de travailler sur des chantiers de rénovation complète. Cela inclut la plomberie (réseaux, arrivées, évacuations), mais aussi la coordination avec carreleurs, électriciens et menuisiers. Nos clients apprécient nos solutions sur mesure : douches à l’italienne spacieuses, baignoires balnéo, rangements optimisés. Nous proposons des devis détaillés avec plans et accompagnement dans le choix des matériaux. L’objectif est d’allier esthétique, confort et durabilité.'
  ),
  (
    v_service, v_city, 6, true,
    'Êtes-vous disponibles le samedi ou le dimanche à Bondues ?',
    'Oui, nous assurons des interventions de garde le samedi, et parfois le dimanche en cas d’urgence (fuite, ballon en panne). Nos équipes sont organisées pour répondre rapidement, même en dehors des horaires classiques. Les tarifs de week-end sont communiqués à l’avance, pour une transparence totale. Cette flexibilité est particulièrement utile aux familles qui ne peuvent se libérer en semaine.'
  ),
  (
    v_service, v_city, 7, true,
    'Travaillez-vous avec les assurances en cas de dégât des eaux à Bondues ?',
    'Oui, nous sommes agréés par de nombreuses compagnies d’assurance (Maaf, Macif, Gan, Groupama). Après un dégât des eaux, nous fournissons devis, photos et facture détaillée. Nous savons également dialoguer avec l’expert mandaté par votre assurance. Cela permet d’accélérer la prise en charge et de limiter les avances de frais pour nos clients.'
  ),
  (
    v_service, v_city, 8, true,
    'Quelles zones de Bondues couvrez-vous ?',
    'Nous intervenons dans tous les quartiers : centre, Montjoie, Ravennes-les-Francs, Vertu-Couture, ainsi que dans les résidences situées en lisière de campagne. Nous couvrons également les communes voisines : Mouvaux, Marcq-en-Barœul, Roncq et Wambrechies. Cette implantation locale nous permet d’assurer des interventions rapides, qu’il s’agisse d’une urgence ou d’un chantier programmé.'
  );
END
$$ LANGUAGE plpgsql;
