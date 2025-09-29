-- Update the green gas article with requested changes
UPDATE blog_posts 
SET content = REPLACE(
  REPLACE(
    content,
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur,votre plombier à Lille.',
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur, votre <a href="/chauffagiste-lille">chauffagiste à Lille</a>.'
  ),
  '<p>On l''appelle « gaz vert », « biométhane », parfois « gaz renouvelable ». Sur l''affiche, c''est local, circulaire et bas-carbone. Dans la vraie vie, il y a des forces (déchets valorisés, production locale) et des limites (volumes, coûts, fuites de méthane, disponibilité des intrants). Voici le guide clair pour comprendre, décider et éviter les idées reçues.</p>',
  '<p>On l''appelle « gaz vert », « biométhane », parfois « gaz renouvelable ». Sur l''affiche, c''est local, circulaire et bas-carbone. Dans la vraie vie, il y a des forces (déchets valorisés, production locale) et des limites (volumes, coûts, fuites de méthane, disponibilité des intrants). Voici le guide clair pour comprendre, décider et éviter les idées reçues.</p>'
),
updated_at = now()
WHERE slug = 'gaz-vert-biomethane-lille';