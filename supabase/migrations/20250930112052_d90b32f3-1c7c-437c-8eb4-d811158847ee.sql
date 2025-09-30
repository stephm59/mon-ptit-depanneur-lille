-- Update the blog post content for climatisation-ne-refroidit-plus
UPDATE blog_posts 
SET content = REPLACE(
  REPLACE(
    content,
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur,votre plombier à Lille.',
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur, votre [installateur de climatisation à Lille](/climatisation-lille).'
  ),
  '03.66.06.00.68',
  '03 28 53 48 68'
)
WHERE slug = 'climatisation-ne-refroidit-plus';