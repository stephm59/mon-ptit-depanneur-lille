-- Créer l'article sur le choix des toilettes avec FAQs et redirection

-- 1. Insérer l'article de blog
INSERT INTO blog_posts (
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  service_id,
  published,
  published_at
) VALUES (
  'Choisir ses toilettes : standard, sans bride ou suspendues | Mon P''tit Dépanneur',
  'choisir-toilettes',
  'WC standard, sans bride ou suspendus : différences, avantages, prix et conseils d''installation. Faites le bon choix pour votre salle de bains à Lille et alentours.',
  '<p>Vous rénovez votre salle de bains et hésitez sur le type de toilettes à installer ? Standard, sans bride, suspendues… les options sont nombreuses et chacune a ses avantages. Pas de panique, voici un guide clair pour vous aider à choisir le modèle le mieux adapté à vos besoins et à votre budget.</p>

<h2>1. Les toilettes standard avec bride : la solution classique et économique</h2>

<p>Ce sont les WC les plus répandus. La bride correspond au rebord intérieur de la cuvette : l''eau y circule lors de la chasse pour nettoyer la cuvette.</p>

<p><strong>✅ Avantages</strong> : prix abordable, choix varié (formes, couleurs, modèles).</p>

<p><strong>❌ Inconvénients</strong> : la bride retient souvent saletés, calcaire et bactéries → nettoyage moins hygiénique.</p>

<p><strong>Idéal pour</strong> : les petits budgets ou les logements où la simplicité prime.</p>

<h2>2. Les toilettes sans bride : hygiène renforcée et confort moderne</h2>

<p>Ces modèles innovants suppriment la bride pour un rinçage plus puissant et plus homogène.</p>

<p><strong>✅ Avantages</strong> : nettoyage facilité, meilleure hygiène, chasse d''eau plus silencieuse, économie d''eau.</p>

<p><strong>❌ Inconvénients</strong> : prix plus élevé que les modèles classiques.</p>

<p><strong>Idéal pour</strong> : ceux qui privilégient la propreté et l''entretien facile au quotidien.</p>

<h2>3. Les toilettes suspendues : design et praticité haut de gamme</h2>

<p>Fixées au mur, elles donnent un look moderne et épuré à la salle de bains. Le réservoir est encastré, invisible.</p>

<p><strong>✅ Avantages</strong> : esthétique élégante, hauteur réglable, nettoyage du sol facilité.</p>

<p><strong>❌ Inconvénients</strong> : installation plus complexe (casser le mur, poser un bâti-support), coût global plus élevé.</p>

<p><strong>Idéal pour</strong> : les rénovations haut de gamme et ceux qui veulent allier design et praticité.</p>

<div class="resume" style="border:1px solid #ddd; padding:16px; border-radius:8px; background:#f9f9f9; margin:20px 0;">
  <h3>⚒️ En résumé</h3>
  <ul>
    <li><strong>Petit budget / simplicité</strong> → toilettes standard avec bride.</li>
    <li><strong>Hygiène / entretien facile</strong> → toilettes sans bride.</li>
    <li><strong>Design / confort haut de gamme</strong> → toilettes suspendues.</li>
  </ul>
</div>

<div class="cta-section" style="border:2px solid #007bff; padding:20px; border-radius:8px; background:#f8f9fa; margin:20px 0;">
  <h3>🚰 Besoin d''aide pour choisir ?</h3>
  <p>Chez Mon P''tit Dépanneur, nos plombiers interviennent dans toute la région lilloise pour installer vos toilettes, qu''elles soient classiques, sans bride ou suspendues. Nous vous conseillons également sur les marques et modèles les plus fiables. Contactez-nous pour un devis gratuit et rapide !</p>
</div>',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/choisir-toilettes.webp',
  (SELECT id FROM services WHERE slug = 'plomberie'),
  true,
  now()
);

-- 2. Insérer les FAQs pour cet article
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'WC avec ou sans bride : quelle différence ?', 'Un WC avec bride possède un rebord intérieur où circule l''eau de chasse ; c''est économique mais moins hygiénique. Un WC sans bride supprime ce rebord : rinçage plus homogène, nettoyage facilité, moins de dépôts et d''odeurs.', 1),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Les toilettes suspendues sont-elles vraiment mieux ?', 'Elles offrent un design épuré, une hauteur réglable et un nettoyage du sol plus simple. En contrepartie : pose plus technique (bâti-support encastré) et coût global supérieur.', 2),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Est-ce que je peux poser des WC suspendus en rénovation ?', 'Oui, si le mur peut recevoir un bâti-support (porteur ou autoportant) et si l''on peut cacher le réservoir (coffrage/cloison). En studio ou salle d''eau étroite, un bâti compact ou d''angle est souvent la solution.', 3),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Quel budget prévoir ?', 'Standard avec bride : 80–250 € (hors pose). Sans bride : 150–450 € (hors pose). Suspendus + bâti : 350–900 € (hors pose). Pose : 180–450 € selon complexité (suspendus : + temps pour bâti/coffrage). Les prix varient selon marque, robinetterie, abattant, contraintes du chantier.', 4),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Les WC sans bride consomment-ils moins d''eau ?', 'Ils optimisent souvent le rinçage et fonctionnent très bien avec la double chasse 3/6 L (parfois 2/4 L sur modèles performants), donc potentiel d''économies à l''usage.', 5),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Comment entretenir des WC sans bride ?', 'Pas de rebord = pas de recoin. Utilisez une éponge/brosse + nettoyant doux (évitez javel pure et abrasifs). Un détartrant doux 1×/mois dans les zones calcaires suffit.', 6),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Hauteur et confort : que choisir ?', 'Hauteur standard assise : 40–42 cm. Pour plus de confort/PMR, visez 45–48 cm (facile avec suspendus). Pensez à l''abattant frein de chute pour le confort et la longévité.', 7),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Quel type de sortie choisir (horizontale/verticale) ?', 'Vérifiez la sortie existante : beaucoup d''installations récentes sont horizontales (universelles) ; les anciennes peuvent être verticales. Des coudes/adaptateurs existent, mais mieux vaut adapter le modèle pour éviter des pertes de place.', 8),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Odeurs et bruit : que privilégier ?', 'Sans bride = moins de rétention donc moins d''odeurs. Pour le bruit, choisissez un robinet flotteur silencieux, une aliment. latérale bien réglée et, sur suspendus, un réservoir isolé (anti-condensation et bruit).', 9),

((SELECT id FROM blog_posts WHERE slug = 'choisir-toilettes'), 'Je veux un WC facile à nettoyer : que retenir ?', 'Cuvette sans bride, traitement anti-calcaire (émail), abattant déclipsable, et si possible suspendu pour libérer le sol.', 10);

-- 3. Créer la redirection 301
INSERT INTO redirects (from_path, to_path, status_code) VALUES
('/toilettes-standard-avec-sans-bride-suspendues', '/carnet/choisir-toilettes', 301);