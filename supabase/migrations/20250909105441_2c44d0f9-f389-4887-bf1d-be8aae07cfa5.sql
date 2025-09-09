-- Insert service city offers for climatisation
WITH page_data AS (
  SELECT scp.id as page_id, c.slug as city_slug
  FROM service_city_pages scp
  JOIN services s ON s.id = scp.service_id
  JOIN cities c ON c.id = scp.city_id
  WHERE s.slug = 'climatisation'
)
INSERT INTO service_city_offers (page_id, position, title, description, icon_name, emoji)
SELECT 
  pd.page_id,
  1,
  'Étude & dimensionnement clim',
  CASE pd.city_slug
    WHEN 'lille' THEN 'Choix mono/multi-split ou gainable, puissance, implantation intérieure/extérieure, acoustique.'
    WHEN 'vieux-lille' THEN 'Solutions compactes, contraintes façades/cours, acoustique maîtrisée.'
    WHEN 'villeneuve-d-ascq' THEN 'Maisons, résidences étudiantes, open spaces campus.'
    WHEN 'marcq-en-baroeul' THEN 'Croisé-Laroche, Bourg, Plouich : parcours de liaisons optimisés.'
    WHEN 'bondues' THEN 'Dimensionnement pièces volumineuses, dépendances, bureaux.'
    WHEN 'la-madeleine' THEN 'Solutions compactes, passages minimaux, esthétique préservée.'
    WHEN 'lambersart' THEN 'Implantation discrète, respect boiseries, parcours de gaines.'
    WHEN 'saint-andre-lez-lille' THEN 'Implantation en cour, parcours discrets, acoustique maîtrisée.'
    WHEN 'lomme' THEN 'Délivrance, Bourg, Mitterie, Mont-à-Camp : choix adapté.'
  END,
  '',
  '🔍'
FROM page_data pd
UNION ALL
SELECT 
  pd.page_id,
  2,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Installation & mise en service'
    WHEN 'vieux-lille' THEN 'Pose discrète & finitions'
    WHEN 'villeneuve-d-ascq' THEN 'Installation multi-split'
    WHEN 'marcq-en-baroeul' THEN 'Pose mono/multi-split'
    WHEN 'bondues' THEN 'Multi-split & gainable'
    WHEN 'la-madeleine' THEN 'Pose en cour/toiture'
    WHEN 'lambersart' THEN 'Installation soignée'
    WHEN 'saint-andre-lez-lille' THEN 'Pose mono/multi-split'
    WHEN 'lomme' THEN 'Installation & mise en service'
  END,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Percements soignés, passages de liaisons, tests étanchéité, paramétrage.'
    WHEN 'vieux-lille' THEN 'Unité ext. en cour, percements minimaux, goulottes peintes.'
    WHEN 'villeneuve-d-ascq' THEN 'Distribution multi-pièces, équilibrage débits, câblage propre.'
    WHEN 'marcq-en-baroeul' THEN 'Implantation ext. discrète, plots antivibratiles, finitions.'
    WHEN 'bondues' THEN 'Distribution homogène, longueurs de liaisons maîtrisées.'
    WHEN 'la-madeleine' THEN 'Fixations sécurisées, goulottes peintes, anti-vibratiles.'
    WHEN 'lambersart' THEN 'Percements propres, finitions, gainable possible.'
    WHEN 'saint-andre-lez-lille' THEN 'Fixations, évacuation condensats, finitions propres.'
    WHEN 'lomme' THEN 'Percements soignés, liaisons propres, tests.'
  END,
  '',
  '🏗'
FROM page_data pd
UNION ALL
SELECT 
  pd.page_id,
  3,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Multi-split & gainable'
    WHEN 'vieux-lille' THEN 'Mono/multi-split silencieux'
    WHEN 'villeneuve-d-ascq' THEN 'Clim gainable (option)'
    WHEN 'marcq-en-baroeul' THEN 'Gainable & design intérieur'
    WHEN 'bondues' THEN 'Implantation extérieure jardin'
    WHEN 'la-madeleine' THEN 'Mono/multi-split silencieux'
    WHEN 'lambersart' THEN 'Confort multi-pièces'
    WHEN 'saint-andre-lez-lille' THEN 'Distribution pièce par pièce'
    WHEN 'lomme' THEN 'Confort multi-pièces'
  END,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Confort multi-pièces, distribution équilibrée, finitions discrètes.'
    WHEN 'vieux-lille' THEN 'Sélection d''unités low-noise, orientation anti-nuisances.'
    WHEN 'villeneuve-d-ascq' THEN 'Confort discret, bouches plafond, atténuation acoustique.'
    WHEN 'marcq-en-baroeul' THEN 'Bouches plafond/mural discrètes, esthétique soignée.'
    WHEN 'bondues' THEN 'Discrétion visuelle/sonore, cages et plots adaptés.'
    WHEN 'la-madeleine' THEN 'Sélection low-noise, orientation anti-nuisances.'
    WHEN 'lambersart' THEN 'Multi-split équilibré, silencieux prioritaire.'
    WHEN 'saint-andre-lez-lille' THEN 'Multi-split efficace, confort homogène.'
    WHEN 'lomme' THEN 'Multi-split équilibré, orientation silencieuse.'
  END,
  '',
  CASE pd.city_slug
    WHEN 'lille' THEN '🧩'
    WHEN 'vieux-lille' THEN '🔇'
    WHEN 'villeneuve-d-ascq' THEN '🧩'
    WHEN 'marcq-en-baroeul' THEN '🧩'
    WHEN 'bondues' THEN '🌿'
    WHEN 'la-madeleine' THEN '🔇'
    WHEN 'lambersart' THEN '🧩'
    WHEN 'saint-andre-lez-lille' THEN '🧩'
    WHEN 'lomme' THEN '🧩'
  END
FROM page_data pd
UNION ALL
SELECT 
  pd.page_id,
  4,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Entretien annuel & hygiène'
    WHEN 'vieux-lille' THEN 'Entretien & désinfection'
    WHEN 'villeneuve-d-ascq' THEN 'Entretien saisonnier'
    WHEN 'marcq-en-baroeul' THEN 'Entretien & hygiène d''air'
    WHEN 'bondues' THEN 'Entretien premium'
    WHEN 'la-madeleine' THEN 'Entretien & désinfection'
    WHEN 'lambersart' THEN 'Entretien annuel'
    WHEN 'saint-andre-lez-lille' THEN 'Entretien & hygiène'
    WHEN 'lomme' THEN 'Entretien annuel'
  END,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Nettoyage filtres/évaporateurs, désinfection, contrôle frigorifique R32.'
    WHEN 'vieux-lille' THEN 'Hygiène d''air intérieur, contrôle condensats et bac.'
    WHEN 'villeneuve-d-ascq' THEN 'Nettoyage filtres, contrôle pressions, désinfection.'
    WHEN 'marcq-en-baroeul' THEN 'Désinfection échangeurs, contrôle condensats.'
    WHEN 'bondues' THEN 'Hygiène, performance, contrôle frigorifique/documentation.'
    WHEN 'la-madeleine' THEN 'Hygiène d''air, contrôle bac condensats, pressions.'
    WHEN 'lambersart' THEN 'Nettoyage/ désinfection, contrôle pressions.'
    WHEN 'saint-andre-lez-lille' THEN 'Filtres, évaporateurs, contrôle pressions.'
    WHEN 'lomme' THEN 'Hygiène d''air, désinfection, contrôle frigorifique.'
  END,
  '',
  '🧰'
FROM page_data pd
UNION ALL
SELECT 
  pd.page_id,
  5,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Dépannage en période chaude'
    WHEN 'vieux-lille' THEN 'Dépannage express été'
    WHEN 'villeneuve-d-ascq' THEN 'Dépannage rapide'
    WHEN 'marcq-en-baroeul' THEN 'Dépannage été'
    WHEN 'bondues' THEN 'Dépannage prioritaire'
    WHEN 'la-madeleine' THEN 'Dépannage rapide été'
    WHEN 'lambersart' THEN 'Dépannage priorisé'
    WHEN 'saint-andre-lez-lille' THEN 'Dépannage été'
    WHEN 'lomme' THEN 'Dépannage rapide été'
  END,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Diagnostic rapide, fuites, cartes, ventilateurs, remise en service.'
    WHEN 'vieux-lille' THEN 'Priorisation saison chaude, pièces courantes en stock.'
    WHEN 'villeneuve-d-ascq' THEN 'Diagnostic pannes (fuite, carte, ventilateur), remise en service.'
    WHEN 'marcq-en-baroeul' THEN 'Intervention priorisée, pièces usuelles.'
    WHEN 'bondues' THEN 'Diagnostic complet, réparation rapide en saison.'
    WHEN 'la-madeleine' THEN 'Diagnostic et remise en service, pièces courantes.'
    WHEN 'lambersart' THEN 'Intervention rapide en fortes chaleurs.'
    WHEN 'saint-andre-lez-lille' THEN 'Diagnostic fuites/cartes, remise en service.'
    WHEN 'lomme' THEN 'Diagnostic/ réparation, réappro pièces si besoin.'
  END,
  '',
  '⚡'
FROM page_data pd
UNION ALL
SELECT 
  pd.page_id,
  6,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Copro & acoustique'
    WHEN 'vieux-lille' THEN 'Dossiers syndic'
    WHEN 'villeneuve-d-ascq' THEN 'Conformité & sécurité'
    WHEN 'marcq-en-baroeul' THEN 'Copro & conformité'
    WHEN 'bondues' THEN 'Élec & sécurité'
    WHEN 'la-madeleine' THEN 'Dossiers syndic'
    WHEN 'lambersart' THEN 'Acoustique & voisinage'
    WHEN 'saint-andre-lez-lille' THEN 'Voisinage & conformité'
    WHEN 'lomme' THEN 'Évacuation & électricité'
  END,
  CASE pd.city_slug
    WHEN 'lille' THEN 'Dossiers syndic, implantation en cour/toiture, plots antivibratiles.'
    WHEN 'vieux-lille' THEN 'Fiches techniques, acoustique, plans d''implantation.'
    WHEN 'villeneuve-d-ascq' THEN 'Évacuation condensats, disjoncteur adapté, normes en vigueur.'
    WHEN 'marcq-en-baroeul' THEN 'Dossiers syndic, acoustique, implantation cour/façade.'
    WHEN 'bondues' THEN 'Protections électriques dédiées, évacuation condensats.'
    WHEN 'la-madeleine' THEN 'Fiches techniques, acoustique, plans d''implantation.'
    WHEN 'lambersart' THEN 'Orientation/écrans, plots anti-vibratiles.'
    WHEN 'saint-andre-lez-lille' THEN 'Respect distances/bruit, dossiers syndic si besoin.'
    WHEN 'lomme' THEN 'Condensats, protections électriques adaptées.'
  END,
  '',
  CASE pd.city_slug
    WHEN 'lille' THEN '📝'
    WHEN 'vieux-lille' THEN '📝'
    WHEN 'villeneuve-d-ascq' THEN '📝'
    WHEN 'marcq-en-baroeul' THEN '📝'
    WHEN 'bondues' THEN '📝'
    WHEN 'la-madeleine' THEN '📝'
    WHEN 'lambersart' THEN '🔇'
    WHEN 'saint-andre-lez-lille' THEN '📝'
    WHEN 'lomme' THEN '📝'
  END
FROM page_data pd;