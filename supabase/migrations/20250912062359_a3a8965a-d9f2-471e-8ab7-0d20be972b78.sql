-- Migration pour nettoyer et réorganiser les services
-- 1. Supprimer la catégorie "Chauffagiste" et tous ses articles/données associées
-- 2. Fusionner "Serrurier" vers "Serrure"  
-- 3. Supprimer la catégorie "Vitrier"

-- IDs des services concernés :
-- Chauffagiste: fec63f1b-094d-4a13-8e44-8dfe7732368f (à supprimer)
-- Serrure: af8c75e3-3c6f-4bd1-b884-3aac376b1775 (à garder)
-- Serrurier: c9e0c58f-5652-4c6d-a6aa-910bc2226454 (à fusionner vers Serrure)
-- Vitrier: 5722f25c-10bc-4a1f-abab-9ebfb5481a78 (à supprimer)

-- 1. SUPPRESSION DE "CHAUFFAGISTE"
-- Supprimer les FAQs de service local pour Chauffagiste
DELETE FROM service_city_faqs WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f';

-- Supprimer les offres liées aux pages de service local pour Chauffagiste
DELETE FROM service_city_offers WHERE page_id IN (
    SELECT id FROM service_city_pages WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f'
);

-- Supprimer les pages de service local pour Chauffagiste
DELETE FROM service_city_pages WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f';

-- Supprimer les témoignages pour Chauffagiste
DELETE FROM testimonials WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f';

-- Supprimer les FAQs d'articles de blog pour Chauffagiste
DELETE FROM blog_post_faqs WHERE blog_post_id IN (
    SELECT id FROM blog_posts WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f'
);

-- Supprimer les articles de blog pour Chauffagiste
DELETE FROM blog_posts WHERE service_id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f';

-- Supprimer le service Chauffagiste
DELETE FROM services WHERE id = 'fec63f1b-094d-4a13-8e44-8dfe7732368f';

-- 2. FUSION DE "SERRURIER" VERS "SERRURE"
-- Mettre à jour les FAQs de service local : Serrurier -> Serrure
UPDATE service_city_faqs 
SET service_id = 'af8c75e3-3c6f-4bd1-b884-3aac376b1775' 
WHERE service_id = 'c9e0c58f-5652-4c6d-a6aa-910bc2226454';

-- Mettre à jour les pages de service local : Serrurier -> Serrure
UPDATE service_city_pages 
SET service_id = 'af8c75e3-3c6f-4bd1-b884-3aac376b1775' 
WHERE service_id = 'c9e0c58f-5652-4c6d-a6aa-910bc2226454';

-- Mettre à jour les témoignages : Serrurier -> Serrure
UPDATE testimonials 
SET service_id = 'af8c75e3-3c6f-4bd1-b884-3aac376b1775' 
WHERE service_id = 'c9e0c58f-5652-4c6d-a6aa-910bc2226454';

-- Mettre à jour les articles de blog : Serrurier -> Serrure  
UPDATE blog_posts 
SET service_id = 'af8c75e3-3c6f-4bd1-b884-3aac376b1775' 
WHERE service_id = 'c9e0c58f-5652-4c6d-a6aa-910bc2226454';

-- Supprimer le service Serrurier (maintenant vide)
DELETE FROM services WHERE id = 'c9e0c58f-5652-4c6d-a6aa-910bc2226454';

-- 3. SUPPRESSION DE "VITRIER"
-- Supprimer les FAQs de service local pour Vitrier
DELETE FROM service_city_faqs WHERE service_id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78';

-- Supprimer les offres liées aux pages de service local pour Vitrier
DELETE FROM service_city_offers WHERE page_id IN (
    SELECT id FROM service_city_pages WHERE service_id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78'
);

-- Supprimer les pages de service local pour Vitrier
DELETE FROM service_city_pages WHERE service_id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78';

-- Supprimer les témoignages pour Vitrier
DELETE FROM testimonials WHERE service_id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78';

-- Supprimer les FAQs d'articles de blog pour Vitrier
DELETE FROM blog_post_faqs WHERE blog_post_id IN (
    SELECT id FROM blog_posts WHERE service_id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78'
);

-- Supprimer les articles de blog pour Vitrier
DELETE FROM blog_posts WHERE service_id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78';

-- Supprimer le service Vitrier
DELETE FROM services WHERE id = '5722f25c-10bc-4a1f-abab-9ebfb5481a78';