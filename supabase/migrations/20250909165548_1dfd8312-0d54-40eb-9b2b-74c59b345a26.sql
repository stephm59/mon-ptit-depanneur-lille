-- Insérer l'article de blog sur les fuites d'eau
INSERT INTO blog_posts (
    title,
    slug,
    excerpt,
    content,
    cover_image_url,
    published,
    published_at,
    service_id
) VALUES (
    'Fuite d''eau : comment la détecter et la réparer efficacement ?',
    'comment-reparer-fuites-eau',
    'Découvrez nos conseils pour détecter et réparer une fuite d''eau dans votre maison. Astuces simples et intervention rapide de Mon p''tit Dépanneur à Lille et ses environs.',
    '# Comment détecter et réparer une fuite d''eau dans la maison ?

Une fuite d''eau peut passer inaperçue et pourtant causer de nombreux problèmes : augmentation de la facture, dégâts matériels, gaspillage d''eau… Dans la métropole lilloise, les fuites représentent une intervention fréquente pour nos plombiers. Voici comment les repérer et les réparer.

## Comment détecter une fuite d''eau ?

**Vérifiez votre compteur** : relevez l''index, coupez toute consommation d''eau pendant une à deux heures. Si le compteur bouge, une fuite est probable.

**Inspectez vos appareils** : contrôlez le lave-linge, le lave-vaisselle, le chauffe-eau, ainsi que les tuyaux visibles.

**Observez votre logement** : traces d''humidité au plafond, taches sombres sur les murs, parquet gondolé ou moisissures = signe d''une fuite.

## Comment réparer les fuites d''eau courantes ?

**Fuite de chasse d''eau** : changez le joint du mécanisme ou le flotteur usé.

**Fuite sous l''évier** : resserrez les raccords, remplacez un joint défectueux.

**Microfuites** : appliquez un ruban de réparation ou un produit colmatant en attendant l''intervention d''un plombier.

## Quand faire appel à un professionnel ?

Certaines fuites sont difficiles à localiser : sous le plancher, derrière un mur ou dans une canalisation enterrée. Dans ces cas, l''intervention d''un professionnel est indispensable.

👉 Mon p''tit Dépanneur intervient rapidement à Lille et dans les communes voisines pour :

- détecter la fuite grâce à des méthodes non destructives,
- effectuer une réparation durable,
- vous éviter des dégâts plus importants.

📞 **Besoin d''une réparation urgente ?** Contactez-nous au 03 28 53 48 68.',
    '/lovable-uploads/c7f67f6e-6e2e-47ef-a61d-d2474e8fe449.png',
    true,
    NOW(),
    (SELECT id FROM services WHERE slug = 'plomberie')
);