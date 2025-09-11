-- Update the blog post content to replace the footer text with link
UPDATE blog_posts 
SET content = REPLACE(
  content,
  'Ce bon conseil vous est proposé par Mon p''tit Dépanneur,artisan spécialisé à Lille.',
  'Ce bon conseil vous est proposé par Mon p''tit Dépanneur, votre [plombier préféré à Lille](/plombier-lille).'
)
WHERE slug = 'installer-adoucisseur';