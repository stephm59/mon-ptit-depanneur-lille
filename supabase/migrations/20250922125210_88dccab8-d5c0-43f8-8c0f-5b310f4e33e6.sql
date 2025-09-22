UPDATE blog_posts 
SET content = REPLACE(content, 
'TL;DR (1 minute)

Type de PAC en appartement : souvent air-air (clim réversible) en multi-split ; l''air-eau est plus rare (hydraulique, espace ballon, contraintes techniques).

Avant travaux : accord du propriétaire (si locataire) + autorisation de la copropriété (AG) dès qu''il y a percement de façade, pose en cour/terrasse ou impact visuel/sonore.

Dossier gagnant en AG : fiches techniques, niveaux sonores jour/nuit, plan/photomontage d''implantation, gestion des condensats, engagement d''entretien.

Implantation : éviter la recirculation d''air, silentblocs, écran acoustique absorbant si nécessaire, accès maintenance.

', '')
WHERE slug = 'installer-pac-appartement-lille';