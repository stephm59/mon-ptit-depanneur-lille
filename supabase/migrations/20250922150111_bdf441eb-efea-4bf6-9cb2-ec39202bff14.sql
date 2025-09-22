UPDATE blog_posts 
SET 
  content = REPLACE(
    content, 
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur,votre plombier à Lille.',
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur, installateur de climatisation à Lille.'
  ),
  updated_at = now()
WHERE slug = 'entretien-clim-checklist-pro';