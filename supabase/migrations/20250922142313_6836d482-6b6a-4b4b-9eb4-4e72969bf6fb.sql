UPDATE blog_posts 
SET content = REPLACE(content, 
'<h2>Appel à l''action (local & clair)</h2>

<p>Besoin d''un dossier prêt pour l''AG + devis ?<br>
Mon p''tit Dépanneur – Lille : visite technique, photomontages, atténuation acoustique, démarches copro — pour un projet propre et approuvé.</p>',
'<h2>Besoin d''un dossier prêt pour l''AG + devis ?</h2>

<p>Votre artisan lillois et son équipe sont à votre disposition pour vous accompagner : visite technique, photomontages, atténuation acoustique, démarches copro — pour un projet propre et approuvé. Contactez-nous au 03 28 53 48 68.</p>'
)
WHERE slug = 'climatisation-copropriete-regles-votes-lille';