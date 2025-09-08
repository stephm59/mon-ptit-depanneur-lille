
-- FAQ locales pour Plombier – La Madeleine
DO $$
DECLARE
  v_service uuid;
  v_city uuid;
BEGIN
  -- Récupérer l'ID du service "plombier"
  SELECT id INTO v_service
  FROM public.services
  WHERE slug = 'plombier' AND published = true
  LIMIT 1;

  IF v_service IS NULL THEN
    RAISE EXCEPTION 'Service "plombier" introuvable ou non publié';
  END IF;

  -- Récupérer l'ID de la ville "La Madeleine" (slug ou nom)
  SELECT id INTO v_city
  FROM public.cities
  WHERE published = true
    AND (slug = 'la-madeleine' OR name ILIKE 'La Madeleine')
  LIMIT 1;

  IF v_city IS NULL THEN
    RAISE EXCEPTION 'Ville "La Madeleine" introuvable ou non publiée (slug attendu: la-madeleine)';
  END IF;

  -- Remplacer les FAQs locales existantes pour ce couple (service, ville)
  DELETE FROM public.service_city_faqs
  WHERE service_id = v_service AND city_id = v_city;

  -- Insérer les 8 nouvelles FAQs (positions 1 à 8)
  INSERT INTO public.service_city_faqs (service_id, city_id, position, published, question, answer) VALUES
  (
    v_service, v_city, 1, true,
    'Pouvez-vous intervenir rapidement dans les immeubles proches de Lille-Europe et Saint-Maur ?',
    'Oui, notre proximité avec Lille nous permet d’intervenir en moins de deux heures dans les quartiers Saint-Maur, Botanique et autour de la gare Lille-Europe. Nous connaissons bien les contraintes des immeubles collectifs : stationnement limité, accès par digicode, ascenseurs parfois étroits. Nous nous coordonnons avec les gardiens ou les syndics pour simplifier l’intervention. En cas d’urgence, comme une fuite d’eau importante, nous commençons toujours par une mise en sécurité immédiate.'
  ),
  (
    v_service, v_city, 2, true,
    'Prenez-vous en charge l’entretien des colonnes montantes et des canalisations collectives ?',
    'Oui, nous travaillons régulièrement avec les syndics et bailleurs de La Madeleine. Les colonnes montantes des immeubles anciens nécessitent un suivi particulier : diagnostic d’usure, recherche de fuites encastrées, mise aux normes. Nous intervenons aussi sur les évacuations collectives obstruées, avec des techniques non destructives (pompe haute pression, inspection caméra). L’objectif est de garantir le confort de tous les résidents, en limitant l’interruption de l’eau.'
  ),
  (
    v_service, v_city, 3, true,
    'Quel est le prix moyen d’un débouchage dans un appartement à La Madeleine ?',
    'Le tarif dépend du type de canalisation et de l’accès. Pour un évier ou lavabo, comptez entre 110 et 150 € TTC. Pour un WC ou une colonne bouchée nécessitant un furet électrique ou un hydrocurage, le prix varie entre 180 et 250 € TTC. Nous privilégions toujours une méthode douce pour éviter d’endommager les conduites anciennes. Un devis clair est communiqué avant chaque intervention, sans frais cachés.'
  ),
  (
    v_service, v_city, 4, true,
    'L’eau est-elle calcaire à La Madeleine ? Faut-il un adoucisseur ?',
    'Oui, l’eau est dure à La Madeleine, ce qui entraîne tartre, dépôts dans les chauffe-eaux et traces blanches sur la vaisselle. L’installation d’un adoucisseur améliore le confort et protège vos installations. Nous recommandons particulièrement cet équipement dans les foyers équipés de ballons d’eau chaude électriques. Nos plombiers assurent l’installation, la mise en service et l’entretien régulier, afin de garantir un fonctionnement optimal et durable.'
  ),
  (
    v_service, v_city, 5, true,
    'Faites-vous des rénovations de salles de bains dans les appartements anciens de Saint-Maur ou du Botanique ?',
    'Oui, nous réalisons des rénovations complètes, adaptées aux contraintes des appartements anciens (murs porteurs, réseaux vétustes, ventilation insuffisante). Nous coordonnons tous les corps de métier : carreleurs, électriciens, peintres. Nous proposons des solutions sur mesure : douches à l’italienne compactes, rangements suspendus, robinetterie moderne et économe. Un devis détaillé est fourni gratuitement après une visite technique.'
  ),
  (
    v_service, v_city, 6, true,
    'Êtes-vous disponibles le samedi pour des interventions à La Madeleine ?',
    'Oui, nous proposons des créneaux de garde le samedi, notamment pour les urgences : fuites, canalisations bouchées, ballon en panne. Cette flexibilité permet aux habitants qui travaillent la semaine de bénéficier d’un service rapide. Les tarifs spécifiques au week-end sont toujours communiqués à l’avance pour plus de transparence.'
  ),
  (
    v_service, v_city, 7, true,
    'Travaillez-vous avec les assurances pour les sinistres à La Madeleine ?',
    'Oui, nous sommes agréés par de nombreuses compagnies (Maaf, Groupama, Macif, Gan). Après un dégât des eaux, nous fournissons devis, photos et facture détaillée pour faciliter la prise en charge. Nous aidons aussi nos clients à constituer un dossier conforme aux attentes de l’assureur, afin d’accélérer le remboursement.'
  ),
  (
    v_service, v_city, 8, true,
    'Quelles zones de La Madeleine couvrez-vous ?',
    'Nous intervenons dans tous les quartiers : Saint-Maur, Botanique, centre-ville, Berkem, ainsi que dans les zones proches de Marcq-en-Barœul et de Saint-André. Cette proximité nous permet de garantir une intervention rapide, qu’il s’agisse d’une urgence ou d’un chantier programmé.'
  );
END
$$;
