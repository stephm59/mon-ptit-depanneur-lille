-- Insérer l'article de blog "Nettoyer canalisations"
INSERT INTO blog_posts (
  slug,
  title,
  meta_title,
  meta_description,
  content,
  excerpt,
  cover_image_url,
  service_id,
  published,
  published_at
) VALUES (
  'nettoyer-canalisations',
  'Comment nettoyer ses canalisations ? (astuces efficaces et sûres)',
  'Comment nettoyer ses canalisations ? (astuces efficaces et sûres)',
  'Canalisations lentes ou odeurs ? Prévention, recettes naturelles (bicarbonate, vinaigre), ventouse, furet, nettoyage de siphon et quand appeler un pro. Conseils Mon p''tit Dépanneur.',
  'Un bon entretien des canalisations évite les bouchons, les mauvaises odeurs et les fuites. Voici les bons réflexes à adopter au quotidien, puis quoi faire si ça commence à ralentir.

## Prévenir les bouchons (le top 6 des gestes qui changent tout)

### Eau chaude régulière
Faites couler de l''eau très chaude (pas bouillante en continu) 1 fois/semaine pour dissoudre graisses & savon.
💡 Sur PVC, restez idéalement < 80 °C pour préserver les joints.

### Assiettes "zéro déchet"
Raclez les plats avant évier/lave-vaisselle (graisses froides = bouchons assurés).

### Tamis/bonde filtrante
Installez une grille inox sur évier, douche & lavabo. Coût ~5 €, économies maxi. Videz-la souvent.

### Cheveux : poubelle, pas siphon
80 % des bouchons de douche viennent… des cheveux. Ramassez-les après chaque usage.

### Goupillon du siphon
1 fois/mois, retirez la bonde et brossez le tube plongeant/la garde d''eau (gel + biofilm).

### Graisses : jamais à l''évier
Essuyez la poêle avec un sopalin → poubelle. L''huile se fige dans les tuyaux.

---

## Ça commence à ralentir ? Procédure "soft" en 3 étapes

### Ventouse (10–15 pompes)
Remplissez la cuve avec un peu d''eau pour couvrir la cloche, bouchez le trop-plein avec un chiffon humide, puis pompez.

### Recette éco (sécurisée)

- Versez 1/2 verre de bicarbonate + 1/2 verre de gros sel dans la bonde.
- Ajoutez 1 verre de vinaigre blanc (laisser agir 15–30 min).
- Rincez à 1 L d''eau chaude.

⚠️ Ne jamais utiliser juste après un déboucheur chimique (réactions dangereuses).

### Furet manuel
Introduisez lentement, tournez pour accrocher le bouchon (cheveux/graisse), retirez, rincez.

👉 Toujours bloqué ? Passez au nettoyage du siphon (bol sous le siphon, dévissez, nettoyez, remontez avec le joint propre et graissé).

---

## À éviter absolument

❌ Eau très bouillante à répétition sur PVC/joints.

❌ Mélanger produits (eau de Javel + acides/vinaigre = gaz chlorés toxiques).

❌ Déboucheurs caustiques répétés (ils attaquent joints & chromes, pas top pour fosse septique).

❌ Laisser un bouchon "s''installer" : plus on attend, plus c''est compact.

---

## Routine d''entretien (rapide)

**Hebdo :** eau chaude + nettoyer tamis/bonde.

**Mensuel :** recette éco (bicarb/sel/vinaigre) ou enzymes (compatibles fosse septique).

**Trimestriel :** ouvrir & nettoyer siphon (évier, lavabo, douche).

---

## Quand appeler un pro ?

- Eau qui remonte à d''autres points (colonne partagée).
- Odeurs fortes persistantes malgré nettoyage.
- Bouchon récurrent ou profond (besoin d''hydrocureuse/caméra).

📞 **Mon p''tit Dépanneur : 03 28 53 48 68** — intervention rapide, propre, garantie.

---

## FAQ Premium ++

**Comment éliminer les mauvaises odeurs d''évier ?**
Nettoyez la bonde, versez bicarb + vinaigre, laissez agir, rincez à l''eau chaude. Pensez aussi au siphon.

**La ventouse ne marche pas, je fais quoi ?**
Essayez le furet. Si ça revient souvent : nettoyage de siphon puis diagnostic (graisses dans la conduite).

**Eau bouillante : bonne idée ?**
Oui avec parcimonie, mais évitez >80 °C sur PVC et pas en continu.

**Produits chimiques : utiles ?**
En dernier recours. Ne mélangez jamais avec vinaigre/Javel et protégez peau/yeux.

**Recette éco compatible fosse septique ?**
Oui (bicarbonate + vinaigre). Préférez aussi des enzymes.',
  'Un bon entretien des canalisations évite les bouchons, les mauvaises odeurs et les fuites. Voici les bons réflexes à adopter au quotidien, puis quoi faire si ça commence à ralentir.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/nettoyer-canalisation.webp',
  (SELECT id FROM services WHERE slug = 'plomberie'),
  true,
  now()
);

-- Ajouter la redirection
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/nettoyage-de-canalisation', '/carnet/nettoyer-canalisations', 301);

-- Ajouter les FAQs pour cet article
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
VALUES 
  (
    (SELECT id FROM blog_posts WHERE slug = 'nettoyer-canalisations'),
    'Comment éliminer les mauvaises odeurs d''évier ?',
    'Nettoyez la bonde, utilisez bicarbonate + vinaigre puis rincez à l''eau chaude. Ouvrez et nettoyez le siphon si nécessaire.',
    1
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'nettoyer-canalisations'),
    'La ventouse ne marche pas, que faire ?',
    'Essayez un furet manuel. Si le problème revient, nettoyez le siphon puis faites diagnostiquer la conduite.',
    2
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'nettoyer-canalisations'),
    'Peut-on verser de l''eau bouillante dans des canalisations en PVC ?',
    'Oui avec modération. Évitez les températures trop élevées en continu (>80°C) pour préserver joints et PVC.',
    3
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'nettoyer-canalisations'),
    'Les produits chimiques sont-ils recommandés ?',
    'À réserver aux cas difficiles. Ne les mélangez jamais avec du vinaigre ou de la Javel et protégez-vous.',
    4
  ),
  (
    (SELECT id FROM blog_posts WHERE slug = 'nettoyer-canalisations'),
    'Quelles solutions sont compatibles fosse septique ?',
    'Bicarbonate + vinaigre et traitements enzymatiques sont adaptés, à utiliser selon les dosages.',
    5
  );