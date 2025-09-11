-- Insert blog post about mixer tap problems
INSERT INTO blog_posts (
  id,
  slug,
  title,
  content,
  excerpt,
  cover_image_url,
  meta_title,
  meta_description,
  published,
  published_at,
  service_id
) VALUES (
  gen_random_uuid(),
  'mitigeur-panne',
  'Comment savoir si mon mitigeur est en panne ?',
  'Le robinet mitigeur est devenu indispensable dans nos cuisines et salles de bains : il permet de régler la température et le débit de l''eau en un seul geste. Mais comme tout équipement, il peut tomber en panne.

👉 Voici comment identifier un problème, comprendre son origine et savoir quoi faire.

## Les signes d''un mitigeur défectueux

**Problème de température :**
- l''eau reste trop froide ou trop chaude,
- la température ne correspond pas au réglage choisi.

**Débit d''eau faible :**
- le jet est réduit, signe possible de tartre ou d''obstruction interne.

**Fuite visible :**
- de l''eau s''échappe au niveau du bec ou de la base du mitigeur.

⚠️ Dans la majorité des cas, le problème vient de la cartouche thermostatique, pièce centrale du mitigeur.

## Pourquoi un mitigeur tombe-t-il en panne ?

- **Calcaire et tartre :** dépôts qui bloquent la circulation de l''eau.
- **Saletés :** particules qui s''incrustent et obstruent les passages.
- **Manque d''entretien :** sans nettoyage régulier, la cartouche s''use plus vite.

👉 Résultat : température instable, débit réduit ou fuites.

## Entretien de la cartouche thermostatique

Un simple nettoyage régulier peut prolonger la durée de vie du mitigeur :

1. Coupez l''arrivée d''eau.
2. Purge du mitigeur en levant la manette pour évacuer l''eau.
3. Démontez le mitigeur : retirez les caches, dévissez les écrous avec une clé Allen.
4. Nettoyez la cartouche (vinaigre blanc ou produit anticalcaire).
5. Remontez et testez le bon fonctionnement.

👉 Si le problème persiste, il faudra remplacer la cartouche, voire changer le mitigeur.

## Remplacement du mitigeur : prix à prévoir

- **Entrée de gamme :** 50 à 100 €
- **Milieu de gamme :** 150 à 250 €
- **Haut de gamme :** 300 à 400 €

⚠️ Parfois, remplacer tout le mitigeur revient presque au même prix que changer uniquement la cartouche.

## Conclusion

Un mitigeur en panne n''est pas une fatalité : la plupart des problèmes viennent du tartre et se résolvent avec un bon entretien.

👉 Besoin d''aide pour réparer ou remplacer votre mitigeur ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68. Nos plombiers interviennent rapidement pour un dépannage efficace.',
  'Découvrez comment identifier un mitigeur en panne : température instable, faible débit, fuite. Solutions d''entretien et de réparation.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/mitigeur-panne.webp',
  'Mitigeur en panne : symptômes, causes et solutions',
  'Température instable, faible débit, fuite : découvrez comment diagnostiquer et réparer un mitigeur défectueux. Conseils pratiques Mon p''tit Dépanneur.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'plombier' LIMIT 1)
);

-- Insert FAQs for the mixer tap article
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES 
(
  (SELECT id FROM blog_posts WHERE slug = 'mitigeur-panne'),
  'Quels sont les symptômes d''un mitigeur en panne ?',
  'Température instable, faible débit ou fuites au niveau du robinet.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'mitigeur-panne'),
  'D''où viennent les problèmes sur un mitigeur ?',
  'Du tartre, de la saleté ou de l''usure de la cartouche thermostatique.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'mitigeur-panne'),
  'Peut-on réparer un mitigeur soi-même ?',
  'Oui, en le démontant et en nettoyant la cartouche. Mais si la pièce est trop usée, il faudra la remplacer.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'mitigeur-panne'),
  'Combien coûte le remplacement d''un mitigeur ?',
  'De 50 € pour un modèle basique à 400 € pour un mitigeur haut de gamme.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'mitigeur-panne'),
  'Quelle est la durée de vie d''un mitigeur ?',
  'En moyenne 10 à 15 ans, selon la qualité et l''entretien.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'mitigeur-panne'),
  'Comment éviter les pannes de mitigeur ?',
  'En le nettoyant régulièrement et en détartrant la cartouche.',
  6
);

-- Add redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/mitigeur-panne', '/carnet/mitigeur-panne', 301);