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
  service_id
) VALUES (
  'climatisation-copropriete-regles-votes-lille',
  'Climatisation en appartement à Lille : règles de copropriété & votes en AG',
  '<p>Vous êtes en appartement (Vieux-Lille, Vauban, Saint-Maurice…) et vous voulez une clim réversible ? En copropriété, le projet se prépare : dossier clair, vote en assemblée générale, implantation soignée pour éviter le bruit et préserver les façades. Voici le guide simple pour avancer sereinement.</p>

<h2>L''essentiel de cet article en 15 secondes</h2>

<ul>
<li>En appart, on installe le plus souvent un multi-split air-air (chauffe en mi-saison + clim en été).</li>
<li>Autorisation de la copro quasi systématique : percement de façade, unité extérieure en cour/balcon = vote en AG.</li>
<li>Dossier gagnant : fiches techniques + niveaux sonores (jour/nuit) + photomontage d''implantation + gestion des condensats.</li>
<li>Implantation silencieuse : dégagement d''air, silentblocs, écran acoustique absorbant, mode nuit.</li>
<li>Mon p''tit Dépanneur peut préparer le dossier et accompagner l''AG.</li>
</ul>

<h2>Que peut-on installer en appartement ?</h2>

<p><strong>Clim réversible (PAC air-air)</strong> : unités intérieures murales (ou console), une unité extérieure en cour, toiture-terrasse ou balcon solide.</p>

<p><strong>Eau chaude sanitaire</strong> : non, la clim réversible ne fait pas l''ECS ; c''est pour le refroidissement en été et l''appoint chauffage à la mi-saison.</p>

<p><strong>Esthétique & encombrement</strong> : on privilégie des UI discrètes et une UE bien intégrée (écran/pare-vue si nécessaire).</p>

<h2>Copropriété : quand faut-il un vote ?</h2>

<ul>
<li>Percement de façade (passage liaisons frigorifiques) = partie commune → AG.</li>
<li>Unité extérieure visible/audible en cour, toiture ou balcon → AG.</li>
<li>Modifs électriques dans parties communes (cheminements) → AG.</li>
</ul>

<p>En pratique : préparez un dossier clair et concret : ça rassure et ça passe mieux.</p>

<h2>Monter un dossier qui passe (check-list à copier-coller)</h2>

<ul>
<li>Fiches techniques : UE & UI, puissances, niveaux sonores jour/nuit (dB(A)).</li>
<li>Plan / photomontage de l''implantation (façade, cour, balcon).</li>
<li>Gestion des condensats : schéma (drain discret, pas d''égouttement).</li>
<li>Mesures anti-vibratiles : silentblocs + châssis ; mode nuit programmé.</li>
<li>Accès maintenance : filtre propre = moins de bruit, meilleure longévité.</li>
<li>Engagement : entretien annuel + intervention rapide si plainte de voisinage.</li>
</ul>

<h2>Implantation silencieuse en cœur d''îlot (spécial Lille)</h2>

<ul>
<li>Éviter la recirculation d''air : laisser du dégagement devant/derrière l''UE.</li>
<li>Orienter le souffle loin des fenêtres voisines et des angles réverbérants.</li>
<li>Désolidariser : silentblocs, socle/châssis antivibratile (éviter garde-corps légers).</li>
<li>Écran acoustique absorbant (pas juste décoratif) si cour "qui résonne".</li>
<li>Condensats : trajet propre (pas de "gling gling" sous le voisin).</li>
<li>Mode nuit : limiter la vitesse et les montées en régime la nuit.</li>
</ul>

<h2>Budget & délais (repères honnêtes)</h2>

<ul>
<li>Multi-split 2–3 pièces : 3 500 à 8 500 € posé (selon marque, accès, longueur des liaisons).</li>
<li>Écran acoustique absorbant : 400 à 1 500 €.</li>
<li>Châssis + silentblocs : 150 à 600 €.</li>
<li>Délais : 2 à 8 semaines (appro matériel, calendrier d''AG, planning pose).</li>
</ul>

<h2>Locataire ou propriétaire occupant ?</h2>

<p><strong>Locataire</strong> : besoin de l''accord écrit du propriétaire avant la demande en copro.</p>

<p><strong>Proprio</strong> : présentez (ou faites présenter) le dossier en AG ; conservez le PV d''autorisation.</p>

<h2>Étapes d''un projet réussi</h2>

<ol>
<li>Visite technique (implantation, bruit, élec, condensats).</li>
<li>Devis + dossier AG (technique + photomontages).</li>
<li>Vote → autorisation.</li>
<li>Pose propre (percements étanches, cheminements discrets).</li>
<li>Réglages (mode nuit, programmations), rapport de fin de chantier.</li>
<li>Entretien annuel (désinfection UI, nettoyage échangeurs, contrôle étanchéité).</li>
</ol>

<h2>Appel à l''action (local & clair)</h2>

<p>Besoin d''un dossier prêt pour l''AG + devis ?<br>
Mon p''tit Dépanneur – Lille : visite technique, photomontages, atténuation acoustique, démarches copro — pour un projet propre et approuvé.</p>',
  'Copropriété à Lille : comment faire accepter votre clim réversible ? Dossier d''AG, règles, implantations silencieuses, condensats, budgets et délais. Guide clair pour néophytes.',
  'Climatisation en appartement à Lille : règles de copropriété & votes en AG',
  'Copropriété à Lille : comment faire accepter votre clim réversible ? Dossier d''AG, règles, implantations silencieuses, condensats, budgets et délais. Guide clair pour néophytes.',
  '/blog-images/climatisation-inversee-fonctionnement.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'climatisation' LIMIT 1)
);