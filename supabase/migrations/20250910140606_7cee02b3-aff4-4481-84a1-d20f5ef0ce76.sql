-- Insérer l'article de blog sur la réparation des fuites d'eau
INSERT INTO blog_posts (
  slug,
  title,
  excerpt,
  content,
  cover_image_url,
  service_id,
  published,
  published_at
) VALUES (
  'reparer-fuite-eau-soi-meme',
  'Comment réparer une fuite d''eau soi-même ? (5 étapes simples)',
  'Découvrez nos 5 étapes simples pour réparer une fuite d''eau vous-même : fermer l''eau, démonter le tuyau, remplacer le joint et vérifier l''étanchéité.',
  '# Comment réparer une fuite d''eau soi-même ? (5 étapes simples)

Une fuite d''eau, même minime, peut vite se transformer en cauchemar 💧 : dégât des eaux, facture qui grimpe, évier abîmé… Heureusement, certaines petites fuites peuvent se réparer soi-même, sans attendre le plombier.

Voici 5 étapes simples pour réparer un tuyau qui fuit.

## 1. Fermez l''arrivée d''eau

Avant toute manipulation, coupez le robinet d''arrêt de la zone concernée. Vérifiez en ouvrant le robinet de l''évier : l''eau ne doit plus couler.

## 2. Démontez le tuyau

Retirez la connexion avec une clé adaptée (clé à molette, Allen ou tournevis selon le modèle). À l''intérieur, vous trouverez généralement un joint ou une cartouche.

## 3. Identifiez la cause de la fuite

Les problèmes les plus fréquents :

- **Joint cassé** → à remplacer.
- **Joint usé** → il ne joue plus son rôle d''étanchéité, remplacez-le.
- **Joint encrassé** → à nettoyer avec du vinaigre ou un produit adapté.

👉 Dans certains cas (cartouches monobloc), il faut remplacer la cartouche entière.

## 4. Remontez le dispositif

Replacez chaque pièce dans l''ordre inverse du démontage. Conseil : prenez une photo avant de démonter, cela vous servira de repère.

## 5. Vérifiez l''étanchéité

Rouvrez le robinet d''arrêt et testez. Si plus aucune fuite n''apparaît → mission réussie 🎉.

Si malgré tout la fuite persiste, n''attendez pas : contactez un professionnel.

## Conclusion

En suivant ces étapes, vous pouvez résoudre de petites fuites et éviter des dégâts plus graves.
👉 Besoin d''une réparation rapide et garantie ? Appelez Mon p''tit Dépanneur au 03 28 53 48 68. Nos plombiers interviennent partout dans la région lilloise.',
  '/blog-images/reparer-fuite-eau.webp',
  (SELECT id FROM services WHERE slug = 'plomberie'),
  true,
  now()
);