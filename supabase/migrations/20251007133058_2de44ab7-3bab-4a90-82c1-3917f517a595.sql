-- Correction du numéro de téléphone dans les articles de blog (retour au bon numéro)
UPDATE blog_posts 
SET content = REPLACE(content, '03 28 63 48 68', '03 28 53 48 68'),
    updated_at = now()
WHERE content LIKE '%03 28 63 48 68%';