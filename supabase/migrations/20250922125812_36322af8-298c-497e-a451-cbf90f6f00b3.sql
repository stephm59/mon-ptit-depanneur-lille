-- Remove the TL;DR section from the installer-pac-appartement-lille blog post
UPDATE blog_posts 
SET content = REGEXP_REPLACE(
    content, 
    '## TL;DR \(1 minute\).*?(?=## Que peut-on installer en appartement \?)', 
    '', 
    'gs'
)
WHERE slug = 'installer-pac-appartement-lille';