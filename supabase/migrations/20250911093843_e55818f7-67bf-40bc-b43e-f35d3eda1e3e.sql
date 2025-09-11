-- Insert the new blog post about RGE label
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
  'e2d8cffd-bf35-477a-b150-de5697b23ba8',
  'Le label RGE : pourquoi est-il indispensable pour vos travaux ?',
  'label-rge',
  'Le label RGE est indispensable pour obtenir les aides de l''État lors de vos travaux de rénovation énergétique. Découvrez son utilité, qui le délivre et pourquoi choisir un artisan certifié.',
  '<h2>Le label RGE : qu''est-ce que c''est ?</h2>

<p>Vous avez sûrement déjà entendu parler du label RGE (Reconnu Garant de l''Environnement). Mais savez-vous réellement à quoi il sert ? Depuis 2011, cette certification distingue les professionnels qualifiés pour réaliser des travaux de rénovation énergétique (chaudière, isolation, pompe à chaleur, panneaux solaires, etc.).</p>

<p>C''est un gage de confiance : un artisan RGE vous garantit un travail conforme aux normes en vigueur et respectueux de l''environnement.</p>

<h2>Pourquoi le label RGE est-il important ?</h2>

<p>Depuis 2014, l''État conditionne la plupart de ses aides à l''éco-rénovation au recours à une entreprise labellisée RGE. C''est ce qu''on appelle l''éco-conditionnalité.<br>
👉 En clair : pas de professionnel RGE = pas d''aides financières.</p>

<p>Grâce à un artisan certifié, vous pouvez bénéficier de dispositifs comme :</p>

<ul>
<li>MaPrimeRénov''</li>
<li>Les Certificats d''Économies d''Énergie (CEE)</li>
<li>La TVA réduite à 5,5 %</li>
<li>L''éco-prêt à taux zéro (éco-PTZ)</li>
</ul>

<h2>Comment reconnaître un artisan RGE ?</h2>

<p>Il existe des annuaires officiels en ligne où vous pouvez vérifier la certification d''un professionnel selon le type de travaux :</p>

<ul>
<li><strong>Qualibat</strong> : efficacité énergétique et énergies renouvelables</li>
<li><strong>Certibat</strong> : rénovation énergétique globale</li>
<li><strong>Capeb – Éco-artisan</strong> : artisans spécialisés en performance énergétique</li>
<li><strong>Qualit''EnR</strong> : labels spécifiques (Qualipac pour pompes à chaleur, Qualisol pour le solaire, Qualibois pour le bois, etc.)</li>
</ul>

<p><strong>Astuce</strong> : demandez toujours à voir l''attestation RGE de l''artisan avant de signer votre devis.</p>

<h2>Quels sont les avantages pour vous ?</h2>

<p>En choisissant un professionnel RGE, vous avez la certitude que :</p>
<ul>
<li>✅ Vos travaux seront réalisés par un artisan formé et contrôlé régulièrement</li>
<li>✅ Vous respectez les obligations légales pour toucher vos aides</li>
<li>✅ Votre logement gagne en valeur et en performance énergétique</li>
<li>✅ Vous profitez d''un accompagnement sur les démarches administratives</li>
</ul>

<h2>Et Mon P''tit Dépanneur dans tout ça ?</h2>

<p>Bonne nouvelle : Mon P''tit Dépanneur est labellisé RGE. Nos équipes sont donc habilitées à :</p>

<ul>
<li>vous conseiller sur les solutions les plus adaptées à votre logement,</li>
<li>réaliser vos travaux de plomberie, chauffage et rénovation énergétique,</li>
<li>vous accompagner dans vos démarches administratives pour obtenir vos aides.</li>
</ul>

<p>💡 <strong>En résumé</strong> : choisir un artisan RGE, c''est sécuriser vos travaux, vos économies et votre confort.</p>

<p>Ce bon conseil vous est proposé par Mon p''tit Dépanneur, spécialiste en <a href="/chauffage-lille">chauffage à Lille</a>.</p>',
  '/blog-images/label-rge.webp',
  true,
  now()
);

-- Get the blog post ID for the FAQs
WITH blog_post AS (
  SELECT id FROM blog_posts WHERE slug = 'label-rge'
)
-- Insert FAQs for the RGE label blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
((SELECT id FROM blog_post), 'Est-ce que tous les artisans doivent être RGE ?', 'Non, ce n''est pas une obligation légale pour exercer. En revanche, si vous souhaitez bénéficier des aides de l''État (MaPrimeRénov'', CEE, éco-PTZ, TVA réduite…), vous devez impérativement choisir un artisan ou une entreprise certifiée RGE.', 1),
((SELECT id FROM blog_post), 'Quelle est la différence entre Qualibat, Qualit''EnR et Capeb ?', 'Ce sont des organismes qui délivrent la certification RGE selon le type de travaux :<br><br><strong>Qualibat</strong> : pour les travaux généraux de rénovation énergétique (isolation, menuiserie, chauffage).<br><br><strong>Qualit''EnR</strong> : pour les énergies renouvelables (pompes à chaleur, solaire, bois).<br><br><strong>Capeb (Éco-Artisan)</strong> : pour les artisans spécialisés en performance énergétique dans le bâtiment.', 2),
((SELECT id FROM blog_post), 'Le label RGE est-il valable à vie ?', 'Non. Une entreprise doit renouveler régulièrement sa certification (tous les 4 ans en général) et se soumettre à des contrôles qualité. Cela garantit que le professionnel reste à jour sur les normes et techniques.', 3),
((SELECT id FROM blog_post), 'Comment vérifier si une entreprise est bien RGE ?', 'Vous pouvez consulter les annuaires officiels en ligne (notamment sur le site France Rénov'' ou via l''ADEME) et entrer le nom de l''entreprise ou son numéro SIRET. Vous pouvez aussi demander directement au professionnel de vous fournir son attestation RGE.', 4),
((SELECT id FROM blog_post), 'Combien coûte la certification RGE pour un artisan ?', 'Le coût varie selon l''organisme certificateur et le domaine d''activité, mais il faut compter environ 800 à 1 200 € pour obtenir le label. C''est un investissement que les entreprises font pour garantir leur sérieux et permettre à leurs clients de bénéficier des aides.', 5),
((SELECT id FROM blog_post), 'Que se passe-t-il si je fais appel à un artisan non RGE ?', 'Vos travaux seront réalisés, mais vous ne pourrez pas obtenir les aides financières prévues par l''État. De plus, en cas de contrôle, votre dossier de financement pourra être rejeté.', 6),
((SELECT id FROM blog_post), 'Est-ce que le label RGE garantit un travail parfait ?', 'Le label RGE atteste que l''entreprise est qualifiée, formée et auditée régulièrement. Ce n''est pas une garantie absolue, mais un gage de sérieux et de conformité. En cas de problème, vous bénéficiez aussi d''un cadre légal plus protecteur.', 7);

-- Add redirect from old URL to new blog URL
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/label-rge', '/carnet/label-rge/', 301);