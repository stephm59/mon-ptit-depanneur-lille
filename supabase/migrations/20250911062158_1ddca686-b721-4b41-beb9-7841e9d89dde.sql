-- Create the blog post about "Professionnel du Gaz"
INSERT INTO blog_posts (
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  published,
  published_at,
  service_id
) VALUES (
  'Professionnel du Gaz (PG) : gage de sécurité et de qualité',
  'professionnel-du-gaz',
  'Qu''est-ce que l''appellation Professionnel du Gaz (PG) ? Découvrez les garanties, le certificat de conformité et pourquoi il est essentiel de passer par un installateur agréé.',
  'Appellation « Professionnel du Gaz » : que garantit-elle ?

Pourquoi faire appel à un « Professionnel du Gaz » (PG) ?

Lorsque vous envisagez d''installer une chaudière ou tout autre équipement fonctionnant au gaz, il est essentiel de passer par un installateur agréé PG – Professionnel du Gaz. Ce label, reconnu par les pouvoirs publics et les organismes de certification, garantit :

Une installation conforme aux normes de sécurité.

Une expertise technique reconnue.

Un contrôle qualité régulier des interventions.

En clair : vous avez la certitude que votre installation est fiable, sécurisée et respectueuse de la réglementation.

Qu''est-ce qu''un expert PG ?

Un professionnel PG est un technicien ou une entreprise spécialisée dans l''installation, l''entretien et le dépannage des équipements au gaz.

Il a suivi une formation exigeante et obtenu une certification officielle.

Ses travaux sont contrôlés régulièrement par des organismes indépendants.

Il est capable de délivrer un certificat de conformité après l''installation.

💡 Ce certificat est indispensable pour mettre en service un compteur de gaz ou pour toute nouvelle installation.

Les risques avec un installateur non agréé

Confier l''installation de votre chaudière à un technicien non certifié peut avoir de lourdes conséquences :

Installation non conforme aux normes en vigueur.

Absence de protection en cas d''incident ou de fuite de gaz.

Risque de coupure de gaz par votre fournisseur.

Difficultés avec votre assurance en cas de sinistre.

👉 C''est pourquoi il est toujours recommandé de demander l''accréditation PG de votre installateur, et de la retrouver mentionnée sur le devis et la facture.

Le certificat de conformité gaz

À la fin des travaux, le professionnel PG délivre un certificat de conformité qui atteste que :

Le combustible est brûlé de manière correcte et sécurisée.

L''installation respecte les normes en vigueur.

Le risque pour le client, les voisins et l''environnement est réduit au minimum.

Ce document est obligatoire et sera demandé pour la mise en service de votre installation par votre fournisseur de gaz.

En résumé

Faire appel à un Professionnel du Gaz (PG), c''est :
✅ Une installation conforme et sécurisée.
✅ Des économies d''énergie grâce à un réglage optimal.
✅ La délivrance d''un certificat de conformité.
✅ Une tranquillité d''esprit totale.

Pour vos installations ou l''entretien de votre chaudière, Mon P''tit Dépanneur, certifié PG, vous accompagne avec sérieux et professionnalisme dans toute la métropole lilloise.',
  '/blog-images/professionnel-du-gaz-blog.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'chaudiere')
);

-- Get the blog post ID for FAQs
DO $$
DECLARE
  blog_post_id_var uuid;
BEGIN
  SELECT id INTO blog_post_id_var FROM blog_posts WHERE slug = 'professionnel-du-gaz';
  
  -- Insert FAQs for this blog post
  INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
  (blog_post_id_var, 'Quelle est la différence entre un chauffagiste classique et un PG ?', 'Le chauffagiste peut installer et entretenir des chaudières, mais seul le Professionnel du Gaz (PG) est habilité à délivrer un certificat de conformité obligatoire.', 1),
  (blog_post_id_var, 'Le label PG est-il obligatoire pour installer une chaudière à gaz ?', 'Oui, car sans certificat de conformité, votre fournisseur peut refuser la mise en service de l''installation.', 2),
  (blog_post_id_var, 'Combien coûte l''intervention d''un professionnel PG ?', 'Les tarifs varient selon les travaux, mais l''avantage est que vous êtes couvert légalement et que votre installation est contrôlée et sécurisée.', 3),
  (blog_post_id_var, 'Qui vérifie les installateurs PG ?', 'Des organismes indépendants mandatés par les pouvoirs publics effectuent des contrôles aléatoires et réguliers.', 4);
END $$;

-- Add redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/professionnel-du-gaz', '/carnet/professionnel-du-gaz', 301);