UPDATE blog_posts 
SET content = REPLACE(
  REPLACE(
    content,
    '<li><strong>Remise d''un rapport</strong> (photos, conseils d''entretien).</li>',
    ''
  ),
  '<li>On <strong>mesure avant/après</strong> (températures départ/retour, débits quand c''est possible).</li>',
  ''
)
WHERE id = 'd751c8b4-b039-49d3-a783-a0c20623979b';