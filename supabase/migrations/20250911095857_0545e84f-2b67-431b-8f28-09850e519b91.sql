-- Insert blog post about climatisation réversible
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
  'climatisation-inversee-fonctionnement',
  'Climatisation réversible : comment ça marche ?',
  'Découvrez comment fonctionne une climatisation réversible, ses avantages, son prix et les critères de choix. Chauffage + clim en un seul appareil.',
  '<p>Vous rêvez d''un système capable de chauffer votre maison en hiver et de la rafraîchir en été ? C''est exactement ce que permet la climatisation réversible, aussi appelée pompe à chaleur air-air. Compacte, économique et pratique, elle combine deux fonctions en un seul appareil.</p>

<p>Voyons ensemble son fonctionnement, ses avantages et pourquoi elle séduit de plus en plus de foyers.</p>

<h2>Qu''est-ce qu''une climatisation réversible ?</h2>

<p>La climatisation réversible, également appelée chauffage thermodynamique, est un appareil qui alterne entre deux modes :</p>

<p><strong>Mode chauffage</strong> : en hiver, il capte les calories présentes dans l''air extérieur et les restitue à l''intérieur.</p>

<p><strong>Mode climatisation</strong> : en été, il évacue la chaleur de vos pièces vers l''extérieur pour rafraîchir votre logement.</p>

<p>Le système se compose généralement :</p>

<ul>
<li>d''une unité extérieure (qui échange la chaleur avec l''air) ;</li>
<li>d''une ou plusieurs unités intérieures (murales, consoles, gainables…).</li>
</ul>

<p>👉 Grâce à ce principe ingénieux, une seule installation remplace à la fois un radiateur et un climatiseur classique.</p>

<h2>Pourquoi choisir une climatisation réversible ?</h2>

<ul>
<li>✅ <strong>Économies d''énergie</strong> : jusqu''à 50 % de consommation en moins par rapport à un chauffage électrique classique.</li>
<li>✅ <strong>Confort toute l''année</strong> : température idéale en toutes saisons.</li>
<li>✅ <strong>Gain de place</strong> : un seul équipement pour deux usages.</li>
<li>✅ <strong>Technologie moderne</strong> : régulation précise, programmation, modèles connectés pilotables à distance.</li>
<li>✅ <strong>Valeur ajoutée</strong> : améliore le confort et la performance énergétique de votre logement.</li>
</ul>

<h2>Comment choisir la bonne climatisation réversible ?</h2>

<p>Votre choix dépendra de plusieurs critères :</p>

<ul>
<li>La taille et la configuration de votre logement (surface, nombre de pièces, hauteur sous plafond).</li>
<li>La qualité de l''isolation : plus votre logement est bien isolé, plus la climatisation sera performante.</li>
<li>Vos attentes esthétiques : modèles apparents, gainables invisibles, couleurs discrètes.</li>
<li>Votre budget et vos factures d''énergie.</li>
<li>La classe énergétique : privilégiez un modèle noté A+ ou A++.</li>
<li>La connectivité : certains modèles se pilotent via smartphone ou domotique.</li>
</ul>

<h2>Pompe à chaleur vs climatisation réversible : quelle différence ?</h2>

<p>La confusion est fréquente :</p>

<ul>
<li>La climatisation réversible est une pompe à chaleur air-air.</li>
<li>La pompe à chaleur air-eau alimente un système de chauffage central (radiateurs, plancher chauffant) et peut produire de l''eau chaude sanitaire.</li>
</ul>

<p>👉 La climatisation réversible reste moins chère à l''installation, mais offre des performances plus limitées qu''une pompe à chaleur air-eau.</p>

<h2>Conclusion</h2>

<p>La climatisation réversible est une solution pratique, économique et confortable pour profiter de la bonne température en toute saison.</p>

<p>Chez Mon P''tit Dépanneur, nos experts vous conseillent sur le modèle le plus adapté à votre logement et assurent une installation rapide et professionnelle. Contactez-nous pour obtenir votre devis gratuit !</p>',
  '/blog-images/climatisation-inversee-fonctionnement.webp',
  (SELECT id FROM services WHERE slug = 'climatisation'),
  true,
  now()
);

-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES
(
  (SELECT id FROM blog_posts WHERE slug = 'climatisation-inversee-fonctionnement'),
  'Combien consomme une climatisation réversible par an ?',
  'La consommation dépend de la puissance de l''appareil, du nombre d''heures d''utilisation et de l''isolation du logement. En moyenne, une climatisation réversible consomme entre 300 et 600 kWh par an pour une pièce de 30 m², soit bien moins qu''un chauffage électrique classique.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'climatisation-inversee-fonctionnement'),
  'Quelle est la durée de vie d''une climatisation réversible ?',
  'Un climatiseur réversible bien entretenu dure en moyenne 15 à 20 ans. Un entretien régulier (nettoyage des filtres, contrôle du fluide frigorigène, vérification de l''étanchéité) permet de prolonger sa durée de vie et de garantir ses performances.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'climatisation-inversee-fonctionnement'),
  'Quelle différence entre une climatisation réversible et une pompe à chaleur ?',
  'La climatisation réversible est une pompe à chaleur air-air : elle chauffe et refroidit l''air intérieur. La pompe à chaleur air-eau, plus coûteuse, alimente un réseau de radiateurs ou un plancher chauffant et peut aussi produire l''eau chaude sanitaire.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'climatisation-inversee-fonctionnement'),
  'Faut-il un entretien obligatoire pour une climatisation réversible ?',
  'Oui, la loi impose un entretien par un professionnel agréé dès lors que la charge en fluide frigorigène dépasse 2 kg ou 12 kW. En pratique, la plupart des appareils nécessitent une visite tous les 2 ans minimum, recommandée chaque année pour garantir efficacité et longévité.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'climatisation-inversee-fonctionnement'),
  'Quel est le prix moyen d''une climatisation réversible ?',
  'Le prix varie selon la surface à chauffer/refroidir et le type d''unité. Comptez en moyenne 1 500 à 3 000 € pour une installation simple, et jusqu''à 6 000 € pour une solution multisplit couvrant plusieurs pièces. Les aides financières (MaPrimeRénov'', CEE, TVA réduite) peuvent réduire la facture.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'climatisation-inversee-fonctionnement'),
  'Peut-on installer une climatisation réversible dans une maison ancienne ?',
  'Oui, mais il faut prendre en compte la configuration des murs, l''isolation et la possibilité d''installer une unité extérieure. Dans les maisons anciennes mal isolées, il est conseillé d''améliorer l''isolation pour optimiser les économies d''énergie.',
  6
);

-- Add redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/climatisation-inversee-fonctionnement', '/carnet/climatisation-inversee-fonctionnement', 301);