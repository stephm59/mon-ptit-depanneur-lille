UPDATE blog_posts 
SET content = REPLACE(content, 
'Installer une PAC en appartement à Lille : règles de copro et bonnes pratiques

Vous habitez en appartement (Vieux-Lille, Vauban-Esquermes, Saint-Maurice Pellevoisin…) et vous envisagez une pompe à chaleur ? En copropriété, le projet se prépare : dossier clair, vote en AG, implantation soignée pour limiter le bruit et préserver les façades. Voici le guide simple pour avancer sereinement.', 
'Vous habitez en appartement (Vieux-Lille, Vauban-Esquermes, Saint-Maurice Pellevoisin…) et vous envisagez une pompe à chaleur ? En copropriété, le projet se prépare : dossier clair, vote en AG, implantation soignée pour limiter le bruit et préserver les façades. Voici le guide simple pour avancer sereinement.')
WHERE slug = 'installer-pac-appartement-lille';