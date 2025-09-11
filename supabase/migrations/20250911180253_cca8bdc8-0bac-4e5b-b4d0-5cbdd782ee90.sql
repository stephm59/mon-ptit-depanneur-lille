-- Create blog post about valves (vanne)
INSERT INTO blog_posts (
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
  'vanne',
  'Focus sur la vanne d''arrêt en plomberie et chauffage',
  'En plomberie comme en chauffage, la vanne d''arrêt (ou vanne d''isolement) est un accessoire indispensable. Elle permet de couper ou rétablir la circulation de l''eau ou du gaz, sans avoir à vider tout le circuit.

👉 Mon p''tit Dépanneur vous explique à quoi elle sert, les différents modèles existants et comment choisir la bonne vanne pour vos installations.

## À quoi sert une vanne d''arrêt ?

• **Isoler un appareil** (chauffe-eau, radiateur, chaudière) pour l''entretenir sans couper toute l''installation
• **Sécuriser un réseau** en cas de fuite
• **Réguler la circulation** du fluide dans un circuit de chauffage

⚠️ Sans vanne d''arrêt, le moindre dépannage impose de couper l''arrivée générale… et parfois de vidanger tout le circuit.

## Les types de vannes d''arrêt les plus courants

### 🔹 Vanne à poignée rouge

• Classique en plomberie sanitaire et chauffage
• Poignée droite ou papillon pour une manœuvre rapide

### 🔹 Vanne à poignée bleue

• Même principe que la rouge, mais utilisée pour différencier les circuits
• Souvent utilisée pour l''eau froide

### 🔹 Vanne à poignée rehaussée

• Idéale quand la vanne est difficilement accessible

### 🔹 Vanne à volant

• S''ouvre et se ferme grâce à un volant ou une manivelle
• Permet aussi de réguler légèrement le débit

### 🔹 Vanne NF à poignée verte

• Certifiée CSTB, avec poignée anti-corrosion
• Double étanchéité → plus robuste et durable

### 🔹 Vanne à trois voies

• Permet de raccorder plusieurs tuyaux
• Gère différentes directions de circulation

### 🔹 Vanne en inox

• Fabriquée en acier inoxydable
• Résiste aux fortes pressions et à la corrosion

## En résumé

• **Vanne d''arrêt** = ouverture/fermeture totale d''un circuit
• **Vanne de régulation** = réglage du débit de circulation
• Le choix dépend du type d''installation, de la pression et de l''accessibilité

👉 Besoin d''installer ou de remplacer une vanne d''arrêt ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68. Nos plombiers et chauffagistes vous conseillent selon vos besoins.',
  'La vanne d''arrêt permet de couper ou rétablir la circulation d''eau/gaz sans vider tout le circuit. Découvrez les différents types (rouge, bleue, inox, 3 voies) et leurs usages.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/vanne.webp',
  'Vanne d''arrêt en plomberie et chauffage : types et usages',
  'Découvrez les différents types de vannes d''arrêt (rouge, bleue, inox, 3 voies, NF) et leurs utilisations en plomberie et chauffage. Conseils Mon p''tit Dépanneur.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'chauffage')
);

-- Create FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
(
  (SELECT id FROM blog_posts WHERE slug = 'vanne'),
  'Quelle est la différence entre une vanne d''arrêt et un robinet ?',
  'La vanne d''arrêt coupe ou ouvre totalement un circuit, alors qu''un robinet permet de doser le débit.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'vanne'),
  'Pourquoi installer une vanne d''arrêt ?',
  'Pour isoler facilement un appareil en cas d''entretien ou de panne, sans couper toute l''installation.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'vanne'),
  'Quelle vanne choisir pour un chauffe-eau ?',
  'Une vanne d''arrêt classique (rouge ou bleue) suffit. Pour plus de fiabilité, optez pour une vanne certifiée NF.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'vanne'),
  'Quelle vanne utiliser pour un plancher chauffant ?',
  'Souvent des vannes à volant ou à trois voies, car elles permettent un réglage plus fin.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'vanne'),
  'Quelle est la durée de vie d''une vanne d''arrêt ?',
  'En moyenne 10 à 20 ans, selon la qualité et la pression du réseau.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'vanne'),
  'Combien coûte une vanne d''arrêt ?',
  'De 5 à 30 € pour une vanne classique, jusqu''à 50 € et plus pour une vanne inox ou certifiée.',
  6
);