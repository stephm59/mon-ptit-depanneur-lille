-- Insérer l'article sur les systèmes de plomberie
DO $$
DECLARE
    plomberie_service_id uuid;
    new_blog_post_id uuid;
BEGIN
    -- Récupérer l'ID du service plomberie
    SELECT id INTO plomberie_service_id FROM services WHERE slug = 'plomberie' LIMIT 1;
    
    -- Générer un nouvel ID pour l'article
    new_blog_post_id := gen_random_uuid();
    
    -- Insérer l'article de blog
    INSERT INTO blog_posts (
        id,
        service_id,
        title,
        slug,
        excerpt,
        content,
        cover_image_url,
        published,
        published_at,
        created_at,
        updated_at
    ) VALUES (
        new_blog_post_id,
        plomberie_service_id,
        'Les différents systèmes de plomberie : guide complet',
        'systemes-plomberie-maison',
        'Alimentation, évacuation, eaux pluviales : découvrez les 3 grands systèmes de plomberie, leur rôle et leur importance dans votre maison.',
        '# Les différents systèmes de plomberie : guide complet

Vous vous demandez comment fonctionne la plomberie dans une maison 🏡 ?
On distingue 3 grands systèmes :

✔️ l''alimentation en eau,
✔️ l''évacuation des eaux usées,
✔️ et la gestion des eaux pluviales.

Chaque réseau a un rôle bien précis, et ensemble, ils assurent votre confort au quotidien.

## 1. Le système d''alimentation : amener l''eau potable

Ce réseau transporte l''eau de la source jusqu''à vos robinets, votre douche et vos appareils ménagers.
Il est équipé de :

✔️ une vanne principale (pour couper l''eau en cas de fuite),
✔️ un compteur d''eau,
✔️ et des tuyaux qui distribuent l''eau froide et l''eau chaude dans toute la maison.

👉 C''est le système qui vous assure de l''eau propre et potable au quotidien.

## 2. Le système d''évacuation : éliminer les eaux usées

C''est le réseau qui se charge d''évacuer l''eau de la cuisine, de la salle de bains et des toilettes vers les égouts.

On y trouve :

✔️ les canalisations d''eaux usées,
✔️ les colonnes de ventilation (pour éviter les mauvaises odeurs et équilibrer la pression),
✔️ et parfois des systèmes spéciaux :

**Types d''évacuation :**
✔️ évacuation par gravité (la plus courante),
✔️ évacuation à basse pression (avec pompe),
✔️ évacuation sous vide (zones plates ou difficiles).

👉 Sans ce système, votre maison serait vite envahie par les odeurs et les bactéries.

## 3. Le système des eaux pluviales : gérer la pluie

Ce réseau empêche l''eau de pluie d''inonder votre maison.
Il peut être conçu de 3 manières :

✔️ par gravité (gouttières et descentes d''eau pluviale inclinées),
✔️ avec pompes (quand le terrain est plat),
❌ avec rejet direct vers les cours d''eau (solution moins écologique, car elle entraîne aussi des pollutions).

👉 Bien entretenir vos gouttières est essentiel pour éviter les débordements et infiltrations.

## 4. Pourquoi ces systèmes sont-ils essentiels ?

✔️ Assurer l''accès à l''eau potable,
✔️ Préserver l''hygiène de la maison,
✔️ Prévenir les inondations,
✔️ Garantir confort et sécurité.',
        '/blog-images/systeme-plomberie.webp',
        true,
        now(),
        now(),
        now()
    );
    
    -- Insérer la redirection
    INSERT INTO redirects (from_path, to_path, status_code, created_at, updated_at)
    VALUES ('/guide-systemes-plomberie', '/carnet/systemes-plomberie-maison/', 301, now(), now());
    
    -- Insérer les FAQs de l'article
    INSERT INTO blog_post_faqs (blog_post_id, question, answer, position, created_at, updated_at) VALUES
    (new_blog_post_id, 'Quelle est la différence entre l''alimentation et l''évacuation en plomberie ?', 'L''alimentation apporte l''eau potable dans la maison, tandis que l''évacuation se charge d''éliminer les eaux usées et les déchets.', 1, now(), now()),
    (new_blog_post_id, 'À quoi sert la ventilation dans les canalisations ?', 'Elle permet d''éviter les mauvaises odeurs, d''équilibrer la pression et d''assurer un écoulement fluide des eaux usées.', 2, now(), now()),
    (new_blog_post_id, 'Faut-il séparer eaux pluviales et eaux usées ?', 'Oui, dans la majorité des communes, la réglementation impose de séparer les eaux de pluie (toitures) des eaux usées domestiques.', 3, now(), now()),
    (new_blog_post_id, 'Que faire en cas de bouchon dans le système d''évacuation ?', 'Un petit bouchon peut être traité avec une ventouse ou un furet. Mais si le problème persiste, il est recommandé de faire appel à un plombier.', 4, now(), now()),
    (new_blog_post_id, 'Quels matériaux de tuyaux sont utilisés pour l''alimentation ?', 'On retrouve surtout le cuivre, le multicouche et le PER, qui sont durables, fiables et adaptés à l''eau potable.', 5, now(), now()),
    (new_blog_post_id, 'Qui entretient les systèmes de plomberie d''une maison ?', 'C''est le propriétaire ou le locataire pour l''intérieur, et la commune pour les réseaux collectifs (égouts, eaux pluviales publiques).', 6, now(), now());
    
END $$;