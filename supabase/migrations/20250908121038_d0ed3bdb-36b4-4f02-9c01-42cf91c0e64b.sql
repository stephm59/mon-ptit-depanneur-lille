
-- FAQ locales : Plombier × Villeneuve-d’Ascq
-- On identifie les IDs via les slugs publiés, on supprime l’existant pour ce couple, puis on insère les 8 nouvelles entrées.

WITH svc AS (
  SELECT id FROM public.services WHERE slug = 'plombier' AND published = true LIMIT 1
),
cty AS (
  SELECT id FROM public.cities WHERE slug = 'villeneuve-d-ascq' AND published = true LIMIT 1
),
del AS (
  DELETE FROM public.service_city_faqs
  WHERE service_id = (SELECT id FROM svc)
    AND city_id   = (SELECT id FROM cty)
  RETURNING id
)
INSERT INTO public.service_city_faqs (service_id, city_id, position, published, question, answer)
VALUES
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 1, true,
    'Intervenez-vous dans les résidences étudiantes des campus Pont-de-Bois et Cité Scientifique ?',
    'Oui, nous travaillons régulièrement dans les résidences universitaires et appartements étudiants. Les urgences les plus fréquentes concernent des ballons d’eau chaude défaillants, des fuites de robinetterie ou des canalisations engorgées. Nous adaptons notre logistique aux bâtiments collectifs : coordination avec le gardien, respect des règles d’accès, intervention rapide pour limiter la gêne aux autres locataires. Nous privilégions des solutions économiques et efficaces, adaptées à la vie étudiante, tout en garantissant un travail conforme et durable.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 2, true,
    'Quels types de ballons d’eau chaude installez-vous à Villeneuve-d’Ascq ?',
    'Nous proposons une gamme complète : ballons électriques classiques (50 à 300 L), modèles thermodynamiques pour réduire la consommation d’énergie, et versions compactes idéales pour studios étudiants. Dans les maisons familiales d’Annappes, Ascq ou Brigode, nous recommandons des modèles de 200 à 300 L, adaptés aux foyers nombreux. Nos plombiers assurent la pose, le raccordement électrique et hydraulique, ainsi que l’évacuation de l’ancien appareil. Un certificat de conformité est remis à chaque installation.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 3, true,
    'L’eau est-elle calcaire à Villeneuve-d’Ascq ? Faut-il un adoucisseur ?',
    'Oui, comme dans la plupart de la métropole lilloise, l’eau de Villeneuve-d’Ascq est réputée dure. Les dépôts de calcaire réduisent la durée de vie des chauffe-eaux, encrassent la robinetterie et détériorent les appareils électroménagers. Installer un adoucisseur permet de prolonger la durée de vie des équipements, de réduire les traces blanches sur la vaisselle et d’améliorer le confort (peau plus douce, linge plus souple). Nous conseillons le modèle adapté à votre foyer et assurons son installation, mise en service et entretien annuel.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 4, true,
    'Combien coûte un débouchage de canalisation à Villeneuve-d’Ascq ?',
    'Le tarif dépend du type de canalisation et de la complexité du bouchon. Pour un évier ou un lavabo, le prix se situe entre 110 et 150 € TTC. Pour un WC ou une canalisation principale nécessitant un furet électrique ou une pompe haute pression, le coût varie entre 180 et 250 € TTC. Dans certains cas (réseaux collectifs des résidences étudiantes), une inspection caméra est recommandée. Dans tous les cas, nous établissons un devis clair et sans surprise avant d’intervenir.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 5, true,
    'Réalisez-vous des rénovations complètes de salles de bains à Villeneuve-d’Ascq ?',
    'Oui, nous proposons des rénovations clés en main. Cela inclut la plomberie (réseaux d’alimentation et d’évacuation), l’électricité (prises, éclairages, VMC), et la coordination avec carreleurs et peintres. Nous travaillons sur tout type de logement : studios étudiants, maisons familiales, appartements modernes. Nos équipes accompagnent la conception (plan 2D/3D, choix des équipements), puis réalisent les travaux dans les délais annoncés. Le devis est gratuit et détaillé, avec des conseils adaptés à votre espace et à votre budget.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 6, true,
    'Êtes-vous disponibles le week-end pour les urgences à Villeneuve-d’Ascq ?',
    'Oui, nous avons des équipes de garde les samedis et dimanches pour les urgences : fuites d’eau, engorgements sévères, ballon en panne. Selon le type d’intervention, nous assurons une mise en sécurité immédiate, puis programmons une réparation définitive. Les demandes peuvent être faites par téléphone ou via notre site, et nous faisons toujours en sorte de limiter l’attente. Les frais d’intervention en dehors des heures de bureau sont communiqués à l’avance pour plus de transparence.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 7, true,
    'Travaillez-vous avec les assurances en cas de dégât des eaux à Villeneuve-d’Ascq ?',
    'Oui, nous sommes agréés par une vingtaine de compagnies (Macif, Maaf, Gan, Groupama, etc.). Nous fournissons devis, factures et photos des dégâts pour constituer un dossier solide. Nos équipes peuvent également expliquer à l’assureur les travaux effectués. Grâce à notre expérience, nous savons comment accélérer les procédures et limiter vos démarches. Cela rassure nos clients, qu’ils soient étudiants locataires ou propriétaires de maisons familiales.'
  ),
  (
    (SELECT id FROM svc), (SELECT id FROM cty), 8, true,
    'Dans quels quartiers de Villeneuve-d’Ascq intervenez-vous ?',
    'Nous couvrons l’ensemble de la commune : Hôtel-de-Ville, Triolo, Pont-de-Bois, Annappes, Ascq, Brigode, Résidences étudiantes, Château et Prés. Nos interventions s’étendent également aux communes limitrophes : Mons-en-Barœul, Wasquehal, Croix, Lezennes et Lille. Cette proximité nous permet de proposer un service rapide et adapté à la diversité des logements ascquois, des appartements modernes aux maisons traditionnelles.'
  );
