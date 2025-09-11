-- Create new blog post about pêne demi-tour
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
  'comment-retourner-un-pene-demi-tour',
  'Pourquoi et comment retourner un pêne demi-tour ?',
  'Vous avez installé une nouvelle serrure… mais la porte refuse de se fermer correctement ? Dans bien des cas, le problème vient du pêne demi-tour monté dans le mauvais sens. Pas besoin de changer toute la serrure : il suffit souvent de retourner le pêne.

👉 Mon p''tit Dépanneur vous explique pourquoi cette manipulation est utile et comment la réaliser facilement, sans appeler un serrurier.

## Petit rappel : qu''est-ce qu''un pêne demi-tour ?

Le pêne demi-tour est la petite pièce métallique en biais qui s''enclenche dans la gâche de la porte lorsque vous la claquez.

Il maintient la porte fermée sans avoir besoin de clé.

Il peut être actionné avec la poignée ou avec un tour de clé.

👉 Si le pêne est monté à l''envers, il ne glisse pas correctement et empêche la fermeture de la porte.

## Pourquoi retourner un pêne demi-tour ?

• La serrure est bien installée, mais le pêne bloque.

• La porte ne se ferme pas correctement.

• Le pêne est orienté du mauvais côté par rapport au sens d''ouverture de la porte.

• Sans correction, la porte reste difficile à utiliser, voire inutilisable.

## Deux méthodes simples pour retourner un pêne demi-tour

### 🔧 Méthode 1 : avec démontage partiel

• Retirez la serrure de la porte.

• Appuyez sur le ressort qui maintient le pêne avec un tournevis.

• Faites sortir le pêne, tournez-le, puis réinsérez-le dans la bonne position.

• Testez en refermant la porte.

### 🔧 Méthode 2 : sans démonter la serrure

• Prenez une paire de pinces.

• Saisissez le pêne demi-tour.

• Tirez doucement, pivotez-le dans le bon sens.

• Relâchez et testez la fermeture de la porte.

👉 Ces deux méthodes rapides vous évitent un retour inutile à la quincaillerie ou l''achat d''une nouvelle serrure.

## Conclusion

Retourner un pêne demi-tour est une opération simple et rapide, réalisable avec un simple tournevis ou une paire de pinces.

Si malgré tout la porte résiste ou si le problème est plus complexe, Mon p''tit Dépanneur peut intervenir rapidement pour réparer ou remplacer votre serrure.

📞 Appelez-nous au 03 28 53 48 68 pour toute intervention de serrurerie.

Ce bon conseil vous est proposé par Mon p''tit Dépanneur, votre [serrurier de confiance à Lille](/serrurier-lille).',
  'Découvrez comment retourner facilement un pêne demi-tour de serrure : méthodes pratiques, outils nécessaires et conseils d''expert.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pene-demi-tour.webp',
  'Comment retourner un pêne demi-tour (serrure réversible)',
  'Découvrez comment retourner un pêne demi-tour de serrure : deux méthodes simples, avec ou sans démontage. Conseils pratiques avec Mon p''tit Dépanneur.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'serrurier' LIMIT 1)
);

-- Create FAQs for this blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  (SELECT id FROM blog_posts WHERE slug = 'comment-retourner-un-pene-demi-tour'),
  question,
  answer,
  position
FROM (VALUES
  ('Qu''est-ce qu''un pêne demi-tour exactement ?', 'C''est la partie inclinée d''une serrure qui permet à la porte de rester fermée lorsqu''on la claque, sans clé.', 1),
  ('Pourquoi ma porte ne ferme pas avec une nouvelle serrure ?', 'Souvent, le pêne demi-tour est orienté du mauvais côté. Il suffit de le retourner.', 2),
  ('Est-il possible de retourner un pêne demi-tour sans démonter la serrure ?', 'Oui, avec une paire de pinces, on peut le tirer et le pivoter dans le bon sens.', 3),
  ('Quels outils faut-il pour retourner un pêne demi-tour ?', 'Un simple tournevis ou une paire de pinces suffit.', 4),
  ('Puis-je abîmer ma serrure en faisant cette manipulation ?', 'Non, si l''opération est réalisée délicatement. En cas de doute, il vaut mieux confier la réparation à un serrurier.', 5),
  ('Combien coûte l''intervention d''un serrurier pour ce problème ?', 'Comptez généralement entre 70 € et 120 €, déplacement inclus, selon l''urgence et le type de serrure.', 6)
) AS faq_data(question, answer, position);

-- Create redirect from old URL to new URL  
INSERT INTO redirects (from_path, to_path, status_code)
VALUES ('/comment-retourner-un-pene-demi-tour', '/carnet/comment-retourner-un-pene-demi-tour', 301);