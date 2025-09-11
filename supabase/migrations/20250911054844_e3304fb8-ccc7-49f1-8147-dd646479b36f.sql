-- Supprimer le titre H1 du début du contenu de l'article
UPDATE blog_posts 
SET content = REPLACE(content, '# Frais de serrurier : locataire ou propriétaire, qui paie ?

', ''),
    updated_at = now()
WHERE slug = 'frais-serrurier-locataire-proprietaire';