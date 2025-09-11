-- Create blog post about boiler error codes
INSERT INTO blog_posts (
  service_id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at
) VALUES (
  (SELECT id FROM services WHERE slug = 'chauffage'),
  'Codes erreur sur ma chaudière : que signifient-ils et que faire ?',
  'code-erreur-chaudiere-signification',
  'Votre chaudière affiche un code erreur ? Découvrez la signification des codes les plus fréquents (pression, fumées, brûleur…) et les bons réflexes à adopter.',
  '<p>Votre chaudière affiche un code erreur et vous ne savez pas quoi faire ? Pas de panique : ces messages sont là pour vous aider à comprendre la panne et orienter l''intervention. Dans cet article, on vous explique tout, avec des exemples concrets.</p>

<h2>Pourquoi ma chaudière affiche un code erreur ?</h2>

<p>La plupart des chaudières modernes disposent d''un écran qui affiche un code en cas de dysfonctionnement. Chaque code correspond à un problème précis : pression, évacuation des fumées, défaut d''allumage, etc.</p>

<p>Ces indications sont utiles, mais attention : ne tentez pas de réparer vous-même une chaudière (mélange de gaz, eau et électricité = danger). Contactez toujours un professionnel qualifié.</p>

<h2>Les codes erreurs les plus fréquents</h2>

<p>Voici quelques exemples que l''on retrouve chez de nombreuses marques (Vaillant, Saunier Duval, ELM Leblanc, Frisquet, Chaffoteaux, etc.) :</p>

<ul>
<li><strong>Code F22 (Vaillant)</strong> : pression d''eau trop basse. Vérifiez le manomètre et rajoutez de l''eau via la vanne de remplissage.</li>
<li><strong>Code 501 (Saunier Duval)</strong> : défaut d''allumage du brûleur. Peut venir d''une électrode encrassée ou d''un problème de gaz.</li>
<li><strong>Code A01 (Chaffoteaux)</strong> : échec d''allumage. Nécessite souvent le contrôle d''un technicien.</li>
<li><strong>Code 5P1 (Frisquet)</strong> : problème de sonde de température.</li>
<li><strong>Code E10 (Elm Leblanc)</strong> : pression insuffisante dans le circuit de chauffage.</li>
<li><strong>Code 108 (Baxi)</strong> : manque d''eau dans le circuit.</li>
</ul>

<p>👉 <strong>Astuce :</strong> consultez toujours le manuel de votre chaudière pour identifier la signification exacte du code selon votre modèle.</p>

<h2>Symptômes fréquents associés aux codes erreur</h2>

<ul>
<li><strong>Le chauffage et l''eau chaude ne fonctionnent pas</strong> → souvent un problème de pression ou de thermostat.</li>
<li><strong>Arrêts soudains</strong> → pompe bloquée, surtout après plusieurs mois sans utilisation.</li>
<li><strong>Obstruction de la sortie de fumée</strong> → défaut grave, sécurité qui coupe automatiquement la chaudière.</li>
<li><strong>Bruits inhabituels</strong> → pompe défectueuse ou présence d''air dans le circuit (purge nécessaire).</li>
<li><strong>Eau tiède ou froide</strong> → sonde de débit défaillante.</li>
</ul>

<h2>L''importance de l''entretien annuel</h2>

<p>Un entretien régulier par un professionnel RGE est obligatoire une fois par an. Il permet de :</p>

<ul>
<li>Détecter les anomalies avant la panne,</li>
<li>Vérifier la combustion et limiter le risque d''intoxication au monoxyde de carbone,</li>
<li>Prolonger la durée de vie de votre chaudière,</li>
<li>Être couvert par votre assurance en cas de sinistre.</li>
</ul>

<h2>En résumé</h2>

<p>Un code erreur n''est pas forcément synonyme de panne grave, mais il doit toujours être pris au sérieux. Si vous ne parvenez pas à rétablir la pression ou à relancer la chaudière avec les manipulations simples décrites dans le manuel, contactez rapidement un professionnel.</p>

<p>👉 Chez Mon P''tit Dépanneur, nos chauffagistes interviennent sur toutes marques de chaudières dans la métropole lilloise. Diagnostic, réparation ou entretien annuel : appelez-nous au 03 28 53 48 68 et retrouvez rapidement confort et sécurité.</p>

<div class="premiers-reflexes" style="border:1px solid #ddd; padding:16px; border-radius:8px; background:#f9f9f9; margin:20px 0;">
  <h3>⚡ Premiers réflexes en cas de code erreur sur votre chaudière</h3>
  <ul style="list-style: ''✅ ''; margin-left:0; padding-left:20px;">
    <li>📖 Consultez le manuel de votre chaudière : chaque marque a ses propres codes.</li>
    <li>💧 Vérifiez la pression d''eau : elle doit se situer entre <strong>1 et 2 bars</strong>.</li>
    <li>🔄 Appuyez sur le bouton <em>reset</em> pour tenter un redémarrage.</li>
    <li>🌬️ Vérifiez la bonne ventilation de la pièce et l''absence d''obstruction du conduit de fumées.</li>
    <li>👨‍🔧 Si le problème persiste ou revient rapidement, contactez un professionnel agréé RGE.</li>
  </ul>
  <p style="margin-top:12px; font-size:0.95em; color:#555;">
    👉 En cas d''odeur de gaz, de fumée inhabituelle ou de bruit suspect : coupez immédiatement l''appareil et appelez un chauffagiste en urgence.
  </p>
</div>',
  '/blog-images/chaudiere-code-erreur.webp',
  true,
  now()
);

-- Create FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
VALUES 
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Que signifie un code erreur sur une chaudière ?',
  'Un code erreur est un message d''alerte qui permet d''identifier rapidement la cause d''un dysfonctionnement. Chaque marque (Vaillant, Saunier Duval, ELM Leblanc, Chaffoteaux, Frisquet, etc.) utilise ses propres codes. Ils indiquent par exemple un manque de pression, un problème d''allumage du brûleur ou une sonde défectueuse.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Que faire si ma chaudière affiche le code F22 ?',
  'Le code F22 (courant chez Vaillant) signifie que la pression d''eau est trop basse. Vérifiez le manomètre (il doit être entre 1 et 2 bars) et ouvrez la vanne de remplissage pour rajouter de l''eau dans le circuit. Si le problème revient souvent, contactez un chauffagiste car une fuite peut être en cause.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Puis-je réinitialiser ma chaudière en cas de code erreur ?',
  'Oui, la plupart des chaudières disposent d''un bouton de réinitialisation ("reset"). Cela peut suffire si l''erreur est ponctuelle (ex. coupure de gaz, pression trop basse momentanée). Mais si le code revient après reset, il faut appeler un professionnel.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Pourquoi ma chaudière se bloque-t-elle à cause d''un code erreur ?',
  'Le blocage automatique est une mesure de sécurité. Par exemple, si les fumées ne sont pas correctement évacuées, la chaudière se coupe pour éviter tout risque d''intoxication au monoxyde de carbone.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Quels sont les codes erreur les plus fréquents sur une chaudière ?',
  'F22 (Vaillant) → manque de pression
501 (Saunier Duval) → défaut d''allumage du brûleur
A01 (Chaffoteaux) → échec d''allumage
108 (Baxi) → manque d''eau dans le circuit
E10 (Elm Leblanc) → pression insuffisante
Ces codes varient selon la marque, référez-vous toujours au manuel de votre modèle.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Est-ce dangereux d''ignorer un code erreur chaudière ?',
  'Oui. Certains codes correspondent à des pannes mineures, mais d''autres signalent des risques pour votre sécurité (gaz, fumées, monoxyde de carbone). Il est donc important de ne pas ignorer l''alerte et de faire appel rapidement à un professionnel.',
  6
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Combien coûte une intervention en cas de code erreur ?',
  'Le tarif dépend de la panne et de la pièce éventuellement à remplacer. Comptez en moyenne entre 90 € et 250 € selon la complexité de l''intervention. En cas de contrat d''entretien annuel, une partie des réparations peut être incluse.',
  7
),
(
  (SELECT id FROM blog_posts WHERE slug = 'code-erreur-chaudiere-signification'),
  'Comment éviter les codes erreur à répétition ?',
  'Le meilleur moyen est de respecter l''entretien annuel obligatoire de votre chaudière. Le chauffagiste vérifie la pression, nettoie le brûleur, contrôle les sondes et remplace les pièces usées avant qu''elles ne tombent en panne.',
  8
);

-- Create redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/code-erreur-chaudiere/', '/carnet/code-erreur-chaudiere-signification', 301);