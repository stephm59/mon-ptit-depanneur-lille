UPDATE blog_posts 
SET content = REPLACE(content, 
  '## TL;DR (en 30 secondes)

Le bruit vient surtout du groupe extérieur (ventilateur + compresseur) et parfois des vibrations transmises au bâti.

3 leviers : implantation (emplacement, orientation du souffle), désolidarisation (silentblocs, socle), écrans acoustiques adaptés.

En cœur d''îlot à Lille : éviter les angles réverbérants, prévoir l''évacuation des condensats (hiver), et documenter le projet en copro (niveaux sonores jour/nuit).

', 
  ''
)
WHERE slug = 'bruit-pac-diagnostic-solutions';