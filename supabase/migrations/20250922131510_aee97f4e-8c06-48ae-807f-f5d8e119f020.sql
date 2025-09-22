-- Créer le nouvel article de blog sur le remplacement chaudière gaz par PAC
INSERT INTO blog_posts (
  slug,
  title,
  content,
  excerpt,
  meta_title,
  meta_description,
  cover_image_url,
  published,
  published_at,
  service_id,
  created_at,
  updated_at
) VALUES (
  'remplacer-chaudiere-gaz-par-pac-lille',
  'Remplacer une chaudière gaz par une pompe à chaleur à Lille : étapes, délais, budget (+ aides)',
  'Vous souhaitez remplacer votre chaudière gaz par une pompe à chaleur (PAC) ? À Lille et dans la métropole (maisons 1930, pavillons, copro), voici le parcours simple pour réussir la transition : choix technique, planning, budget réaliste et aides possibles.

## L''essentiel (en 15 secondes)

**But :** remplacer la chaudière gaz par une pompe à chaleur (PAC) pour chauffer la maison et parfois l''eau chaude.

**Logements du Nord :** ça marche très bien si la PAC est bien choisie et bien réglée.

**Étapes :** visite du technicien → choix du modèle → dossier (aides, copro) → pose → réglages → entretien.

**Budget indicatif posé :** 9 000 à 18 000 € selon la configuration. Des aides existent selon les cas.

## Comment on choisit ?

Vous avez des radiateurs ou un plancher chauffant ➜ PAC air-eau (elle remplace la chaudière).

Vos radiateurs demandent très chaud l''hiver ➜ on regarde une PAC "haute température" (elle chauffe plus fort) ou une PAC hybride (PAC + chaudière qui aide quand il gèle).

Vous voulez aussi l''eau chaude ➜ on ajoute un ballon (le réservoir d''eau chaude).

## Le parcours, pas à pas

**Visite technique (1–2 h) :** on mesure la maison, on regarde vos radiateurs et l''électricité.

**Choix et devis :** on vous propose 1–2 options, avec un schéma simple d''installation.

**Aides :** on vérifie ce à quoi vous avez droit et on monte le dossier avec vous.

**Pose (1–3 jours) :** on retire l''ancienne chaudière, on installe la PAC et le ballon si besoin.

**Réglages :** on met une courbe de chauffe simple (plus il fait froid dehors, plus l''eau est chaude) et un mode nuit plus calme.

**Suivi :** un entretien par an et petits ajustements si nécessaire.

## Où mettre l''unité extérieure (celle dehors) ?

Dans une cour dégagée ou un endroit ventilé.

Posée sur des coussins anti-vibration (silentblocs) pour éviter les bruits sourds.

Si la cour "résonne", on ajoute un écran acoustique (qui laisse l''air passer).

L''hiver, la PAC fait fondre le givre : on prévoit un petit tuyau pour évacuer l''eau (pas de "gling gling" sous les voisins).

## Combien ça coûte (repères honnêtes)

**PAC air-eau seule :** 9 000–15 000 € posé.

**PAC air-eau + ballon d''eau chaude :** 11 000–18 000 € posé.

**PAC hybride (PAC + chaudière en renfort) :** 11 000–19 000 € posé.

➜ Le prix dépend de la taille de la maison, de l''accès chantier et des options acoustiques (anti-bruit).

## Ce que vous allez vraiment sentir au quotidien

Chaleur douce et régulière, moins d''à-coups qu''avec le gaz.

La machine est plus silencieuse si bien posée et entretenue.

L''hiver près de 0–5 °C, la PAC se dégivre parfois : c''est normal.

## Petit lexique utile

**PAC air-eau :** prend les calories de l''air extérieur et chauffe l''eau des radiateurs/plancher.

**Ballon :** réservoir d''eau chaude pour la douche/vaisselle.

**Silentblocs :** coussins en caoutchouc qui coupent les vibrations.

**Écran acoustique :** panneau qui casse le bruit, mais laisse l''air circuler.

**Courbe de chauffe (loi d''eau) :** règle automatique : plus il fait froid dehors, plus l''eau de chauffage est chaude.',
  'À Lille, passez du gaz à la pompe à chaleur : choix (air-eau, haute T°, hybride), dimensionnement, implantation silencieuse, délais 2–8 semaines, budgets 9–18 k€, aides possibles. Guide clair pour néophytes.',
  'Remplacer sa chaudière gaz par une PAC à Lille : étapes, délais, budget & aides',
  'À Lille, passez du gaz à la pompe à chaleur : choix (air-eau, haute T°, hybride), dimensionnement, implantation silencieuse, délais 2–8 semaines, budgets 9–18 k€, aides possibles. Guide clair pour néophytes.',
  '/blog-images/pompe-chaleur-appartement.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'pompe-a-chaleur' LIMIT 1),
  now(),
  now()
);

-- Ajouter les FAQs pour cet article
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) 
SELECT 
  (SELECT id FROM blog_posts WHERE slug = 'remplacer-chaudiere-gaz-par-pac-lille'),
  question,
  answer,
  position
FROM (VALUES
  ('Est-ce que ça remplace vraiment ma chaudière ?', 'Oui, une PAC air-eau remplace la chaudière pour le chauffage et peut faire l''eau chaude avec un ballon.', 1),
  ('Et quand il fait très froid ?', 'On dimensionne la PAC pour le climat lillois. S''il faut très chaud pour vos radiateurs, on choisit une PAC "haute température" ou une PAC hybride (la chaudière aide quelques jours par an).', 2),
  ('C''est bruyant ?', 'Non si bien posée : coussins anti-vibration, bon emplacement, et mode nuit. On peut ajouter un écran si la cour résonne.', 3),
  ('Combien de temps entre la visite et la mise en route ?', 'En général 2 à 8 semaines (approvisionnement + planning, parfois un vote de copropriété si vous êtes en appart).', 4),
  ('Y a-t-il des aides ?', 'Souvent oui pour les PAC air-eau (selon votre situation). On vérifie avec vous lors du devis.', 5),
  ('Faut-il un entretien ?', 'Oui, une fois par an : c''est rapide et ça garde la PAC silencieuse et économe.', 6)
) AS faq_data(question, answer, position);