-- Insert climatisation service first
INSERT INTO services (name, slug, description, published) 
VALUES ('Climatisation', 'climatisation', 'Installation et maintenance de systèmes de climatisation', true);

-- Now insert climatisation service-city pages
INSERT INTO service_city_pages (service_id, city_id, published, meta_title, meta_description, h1, h2_intro, intro_description, zones_text, cta_title, cta_subtitle, published_at)
SELECT 
  s.id as service_id,
  c.id as city_id,
  true as published,
  CASE c.slug
    WHEN 'lille' THEN 'Climatisation Lille (installation, entretien, dépannage) | Mon p''tit Dépanneur'
    WHEN 'vieux-lille' THEN 'Climatisation Vieux-Lille (pose discrète, copropriété) | Mon p''tit Dépanneur'
    WHEN 'villeneuve-d-ascq' THEN 'Climatisation Villeneuve-d''Ascq (logements & bureaux) | Mon p''tit Dépanneur'
    WHEN 'marcq-en-baroeul' THEN 'Climatisation Marcq-en-Barœul (maison & copro) | Mon p''tit Dépanneur'
    WHEN 'bondues' THEN 'Climatisation Bondues (grandes maisons & dépendances) | Mon p''tit Dépanneur'
    WHEN 'la-madeleine' THEN 'Climatisation La Madeleine (copro & maisons) | Mon p''tit Dépanneur'
    WHEN 'lambersart' THEN 'Climatisation Lambersart (maisons bourgeoises & pavillons) | Mon p''tit Dépanneur'
    WHEN 'saint-andre-lez-lille' THEN 'Climatisation Saint-André-lez-Lille (maisons mitoyennes) | Mon p''tit Dépanneur'
    WHEN 'lomme' THEN 'Climatisation Lomme (pavillons & appartements) | Mon p''tit Dépanneur'
  END as meta_title,
  CASE c.slug
    WHEN 'lille' THEN 'Installation de climatisation à Lille : mono/multi-split et gainable, étude d''implantation, pose, mise en service, entretien et dépannage. Respect acoustique & copro.'
    WHEN 'vieux-lille' THEN 'Climatisation au Vieux-Lille : solutions compactes et silencieuses, pose en cour intérieure, dossiers syndic, entretien et dépannage.'
    WHEN 'villeneuve-d-ascq' THEN 'Climatisation à Villeneuve-d''Ascq : mono/multi-split pour maisons, appartements et bureaux proches du campus. Pose, entretien, dépannage.'
    WHEN 'marcq-en-baroeul' THEN 'Climatisation à Marcq : mono/multi-split, gainable, implantation soignée (Croisé-Laroche, Bourg, Plouich). Entretien et dépannage.'
    WHEN 'bondues' THEN 'Climatisation à Bondues : multi-split et gainable pour grandes surfaces, dépendances et bureaux. Entretien et dépannage.'
    WHEN 'la-madeleine' THEN 'Climatisation à La Madeleine : solutions compactes pour copropriétés (Saint-Maur, Botanique) et maisons. Entretien et dépannage.'
    WHEN 'lambersart' THEN 'Climatisation à Lambersart : intégrations discrètes pour Canteleu, Pacot-Vandracq, Champ-de-Courses. Entretien & dépannage.'
    WHEN 'saint-andre-lez-lille' THEN 'Climatisation à Saint-André : mono/multi-split pour maisons mitoyennes, pose en cour, gestion acoustique. Entretien & dépannage.'
    WHEN 'lomme' THEN 'Climatisation à Lomme : mono/multi-split pour Délivrance, Bourg, Mitterie, Mont-à-Camp. Entretien & dépannage.'
  END as meta_description,
  CASE c.slug
    WHEN 'lille' THEN 'Climatisation Lille (installation, entretien, dépannage)'
    WHEN 'vieux-lille' THEN 'Climatisation Vieux-Lille (pose discrète, copropriété)'
    WHEN 'villeneuve-d-ascq' THEN 'Climatisation Villeneuve-d''Ascq (logements & bureaux)'
    WHEN 'marcq-en-baroeul' THEN 'Climatisation Marcq-en-Barœul (maison & copro)'
    WHEN 'bondues' THEN 'Climatisation Bondues (grandes maisons & dépendances)'
    WHEN 'la-madeleine' THEN 'Climatisation La Madeleine (copro & maisons)'
    WHEN 'lambersart' THEN 'Climatisation Lambersart (maisons bourgeoises & pavillons)'
    WHEN 'saint-andre-lez-lille' THEN 'Climatisation Saint-André-lez-Lille (maisons mitoyennes)'
    WHEN 'lomme' THEN 'Climatisation Lomme (pavillons & appartements)'
  END as h1,
  CASE c.slug
    WHEN 'lille' THEN 'Confort été comme hiver pour appartements et maisons lilloises.'
    WHEN 'vieux-lille' THEN 'Clims compactes et silencieuses adaptées aux immeubles anciens.'
    WHEN 'villeneuve-d-ascq' THEN 'Solutions confort pour maisons et résidences étudiantes.'
    WHEN 'marcq-en-baroeul' THEN 'Intégrations discrètes au Croisé-Laroche, Bourg, Plouich.'
    WHEN 'bondues' THEN 'Confort haut de gamme pour propriétés bonduoises.'
    WHEN 'la-madeleine' THEN 'Clims compactes et silencieuses pour la ville.'
    WHEN 'lambersart' THEN 'Intégrations discrètes et respect du bâti.'
    WHEN 'saint-andre-lez-lille' THEN 'Clims compactes pour centre, Sainte-Hélène et bords de Deûle.'
    WHEN 'lomme' THEN 'Confort d''été pour tous les quartiers de Lomme.'
  END as h2_intro,
  CASE c.slug
    WHEN 'lille' THEN 'Étude, dimensionnement et pose de climatisations à Lille : mono/multi-split et gainable. Gestion des contraintes urbaines (façades, cours intérieures, acoustique, copropriétés) et mise en service soignée. Contrats d''entretien et dépannage rapide.'
    WHEN 'vieux-lille' THEN 'Spécialistes du Vieux-Lille : mono/multi-split discrets, unités extérieures en cour, passages de liaisons soignés, gestion acoustique et dossiers pour les syndics. Entretien annuel et dépannage en saison chaude.'
    WHEN 'villeneuve-d-ascq' THEN 'Étude thermique légère, choix des unités, pose et mise en service. Interventions à Annappes, Brigode, Flers-Bourg, Triolo, hôtels et bureaux autour du campus. Entretien et dépannage en période estivale.'
    WHEN 'marcq-en-baroeul' THEN 'Étude d''implantation intérieure/extérieure, gestion acoustique, percements propres et évacuation des condensats. Dossiers syndic si besoin, contrats d''entretien et dépannage priorisé en été.'
    WHEN 'bondues' THEN 'Dimensionnement pour grandes pièces, distribution équilibrée, implantation extérieure discrète (jardin). Entretien annuel, hygiène des échangeurs, dépannage rapide en période chaude.'
    WHEN 'la-madeleine' THEN 'Implantation en cour ou toiture-terrasse, dossiers syndic (acoustique, esthétique), percements minimaux, gestion condensats. Entretien et désinfection des unités intérieures.'
    WHEN 'lambersart' THEN 'Choix d''unités silencieuses, percements soignés, gainables possibles, attention aux boiseries. Mise en service, entretien annuel, dépannage priorisé en été.'
    WHEN 'saint-andre-lez-lille' THEN 'Implantation extérieure en cour/jardin, plots antivibratiles, évacuation condensats. Passages de liaisons discrets, entretien saisonnier et dépannage rapide.'
    WHEN 'lomme' THEN 'Étude d''implantation, pose propre, gestion acoustique et condensats. Entretien annuel (désinfection filtres/évaporateurs) et dépannage priorisé en fortes chaleurs.'
  END as intro_description,
  CASE c.slug
    WHEN 'lille' THEN 'Lille : Vieux-Lille, Centre, Wazemmes, Vauban-Esquermes, Bois-Blancs, Fives, Saint-Maurice Pellevoisin, Moulins, Hellemmes, Lomme. Villes proches : La Madeleine, Lambersart, Mons-en-Barœul, Loos.'
    WHEN 'vieux-lille' THEN 'Vieux-Lille : rues Esquermoise, Royale, Basse, Gand, place du Concert, secteurs historiques et cours intérieures. Proximité Centre et Vauban.'
    WHEN 'villeneuve-d-ascq' THEN 'Villeneuve-d''Ascq : Annappes, Brigode, Flers-Bourg, Triolo, Hôtel de Ville, Résidences étudiantes du campus. Voisines : Wasquehal, Lezennes, Hellemmes.'
    WHEN 'marcq-en-baroeul' THEN 'Marcq-en-Barœul : Croisé-Laroche, Bourg, Plouich, Pont, Rouges-Barres, Hippodrome. Voisines : Wasquehal, La Madeleine, Lille.'
    WHEN 'bondues' THEN 'Bondues : Montjoie, Ravennes-les-Francs, centre, Vertu-Couture, secteurs de campagne, proche golf. Voisines : Mouvaux, Wambrechies, Roncq.'
    WHEN 'la-madeleine' THEN 'La Madeleine : Saint-Maur, Botanique, centre-ville, Berkem, Romarin ; proche Euralille, Marcq, Saint-André.'
    WHEN 'lambersart' THEN 'Lambersart : Canteleu, Pacot-Vandracq, Champ-de-Courses, Bourg ; proches Saint-André, La Madeleine, Lille (av. de Dunkerque).'
    WHEN 'saint-andre-lez-lille' THEN 'Saint-André-lez-Lille : centre, Sainte-Hélène, bords de Deûle, proche gare ; limites La Madeleine, Lambersart.'
    WHEN 'lomme' THEN 'Lomme : Délivrance, Bourg, Mitterie, Mont-à-Camp, Lomme-Campus ; proche Loos, Lambersart, Lille.'
  END as zones_text,
  CASE c.slug
    WHEN 'lille' THEN 'Besoin d''une clim à Lille ?'
    WHEN 'vieux-lille' THEN 'Une clim discrète au Vieux-Lille ?'
    WHEN 'villeneuve-d-ascq' THEN 'Besoin d''une clim à Villeneuve-d''Ascq ?'
    WHEN 'marcq-en-baroeul' THEN 'Votre projet clim à Marcq ?'
    WHEN 'bondues' THEN 'Besoin d''une clim à Bondues ?'
    WHEN 'la-madeleine' THEN 'Un installateur clim à La Madeleine ?'
    WHEN 'lambersart' THEN 'Une clim à Lambersart ?'
    WHEN 'saint-andre-lez-lille' THEN 'Votre clim à Saint-André ?'
    WHEN 'lomme' THEN 'Besoin d''une clim à Lomme ?'
  END as cta_title,
  CASE c.slug
    WHEN 'lille' THEN 'Devis gratuit, installation discrète et entretien garanti.'
    WHEN 'vieux-lille' THEN 'Étude sur place, respect de la copro et du voisinage.'
    WHEN 'villeneuve-d-ascq' THEN 'Installation rapide, entretien simplifié, SAV réactif.'
    WHEN 'marcq-en-baroeul' THEN 'Devis gratuit, pose soignée, appareils silencieux.'
    WHEN 'bondues' THEN 'Étude personnalisée, finitions premium.'
    WHEN 'la-madeleine' THEN 'Respect copropriété, pose propre, SAV local.'
    WHEN 'lambersart' THEN 'Étude gratuite, pose haut de gamme.'
    WHEN 'saint-andre-lez-lille' THEN 'Pose rapide, appareils silencieux, SAV fiable.'
    WHEN 'lomme' THEN 'Devis gratuit, intervention locale rapide.'
  END as cta_subtitle,
  '2025-09-09T09:00:00Z'::timestamp with time zone as published_at
FROM services s, cities c
WHERE s.slug = 'climatisation' AND c.slug IN ('lille', 'vieux-lille', 'villeneuve-d-ascq', 'marcq-en-baroeul', 'bondues', 'la-madeleine', 'lambersart', 'saint-andre-lez-lille', 'lomme');