-- Update the blog post content to replace the text and add the link
UPDATE blog_posts 
SET content = REPLACE(
    content, 
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur,votre plombier à Lille.',
    'Ce bon conseil vous est proposé par Mon p''tit Dépanneur, installateur de [pompes à chaleur à Lille](/pompe-a-chaleur-lille).'
)
WHERE slug = 'installer-pac-appartement-lille';