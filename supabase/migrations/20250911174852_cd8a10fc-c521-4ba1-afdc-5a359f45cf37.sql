-- Create blog post about water heater safety group leaks
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
  'fuite-groupe-securite-chauffe-eau',
  'Fuite du groupe de sécurité de votre chauffe-eau : que faire ?',
  'Un chauffe-eau qui fuit n''est jamais rassurant. Pourtant, il ne s''agit pas toujours d''une panne grave. La plupart du temps, le problème vient du groupe de sécurité, cette petite pièce obligatoire placée sous votre ballon d''eau chaude.

👉 Mon p''tit Dépanneur vous explique comment reconnaître une fuite normale, une fuite anormale, et comment agir pas à pas.

## Le rôle du groupe de sécurité

Le groupe de sécurité :

• **Régule la pression interne** du chauffe-eau
• **Évacue l''excès d''eau** quand elle chauffe et se dilate
• **Empêche toute surpression dangereuse**

⚠️ Sa présence est obligatoire. Sans lui, votre chauffe-eau serait en danger.

## Fuite normale ou fuite anormale ?

### ✅ Fuite normale

• Pendant la chauffe, quelques gouttes régulières tombent
• C''est le signe que la soupape de sécurité fonctionne
• Rien à craindre

### ❌ Fuite anormale

• **Un filet d''eau continu pendant la chauffe** → pression trop élevée
• **Un filet d''eau permanent, même hors chauffe** → soupape défectueuse ou groupe de sécurité usé

## Étapes pour diagnostiquer la fuite

### 1. Observez la fuite

• **Goutte à goutte** = normal
• **Filet d''eau** = problème

### 2. Testez la vanne du groupe de sécurité

• **Fermez-la**
• **Si l''eau s''arrête** : pression trop élevée → installez un réducteur de pression (réglé à 3,5 bars)
• **Si l''eau continue** : soupape HS → groupe de sécurité à remplacer

### 3. Vérifiez l''entretien

• **Purgez le groupe de sécurité** 1 fois par mois avec le bouton de vidange
• Cela prévient l''entartrage et prolonge sa durée de vie

## Comment résoudre le problème ?

### Court terme :
• **Fermez la vanne** quand le chauffe-eau n''est pas utilisé

### Long terme :
• **Installer un réducteur de pression** si nécessaire
• **Remplacer le groupe de sécurité** s''il est usé

👉 Dans les deux cas, un professionnel saura poser le bon diagnostic et sécuriser votre installation.

## Conclusion

• Une fuite du groupe de sécurité est souvent bénigne
• Elle peut indiquer une pression trop élevée ou un accessoire défectueux
• Ne laissez pas traîner : un contrôle simple évite de gros dégâts

📞 Pour un diagnostic ou un remplacement rapide, contactez Mon p''tit Dépanneur au 03 28 53 48 68.',
  'Un chauffe-eau qui fuit par le groupe de sécurité : découvrez si c''est normal ou problématique, et comment diagnostiquer et réparer cette fuite pas à pas.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/fuite-groupe-securite-chauffe-eau.webp',
  'Fuite du groupe de sécurité d''un chauffe-eau : causes et solutions',
  'Votre chauffe-eau fuit ? Découvrez quand une fuite du groupe de sécurité est normale ou problématique, et comment agir (réducteur de pression, remplacement). Conseils Mon p''tit Dépanneur.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'plomberie')
);

-- Create FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
(
  (SELECT id FROM blog_posts WHERE slug = 'fuite-groupe-securite-chauffe-eau'),
  'Est-ce normal qu''un chauffe-eau goutte ?',
  'Oui, quelques gouttes pendant la chauffe sont normales : c''est la soupape qui évacue l''excès de pression.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'fuite-groupe-securite-chauffe-eau'),
  'Comment savoir si mon groupe de sécurité est HS ?',
  'Si un filet d''eau s''écoule en permanence, même hors chauffe, la soupape est défectueuse.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'fuite-groupe-securite-chauffe-eau'),
  'À quelle pression régler mon chauffe-eau ?',
  'Avec un réducteur de pression, la valeur idéale est 3 à 3,5 bars.',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'fuite-groupe-securite-chauffe-eau'),
  'Quand remplacer un groupe de sécurité ?',
  'En moyenne tous les 5 ans, ou plus tôt si la soupape ne ferme plus.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'fuite-groupe-securite-chauffe-eau'),
  'Combien coûte un groupe de sécurité ?',
  'Entre 20 et 50 € pour la pièce, hors installation.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'fuite-groupe-securite-chauffe-eau'),
  'Peut-on prolonger la durée de vie du groupe de sécurité ?',
  'Oui, en le purgeant une fois par mois avec le bouton de vidange.',
  6
);

-- Create redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code) VALUES
('/fuite-du-groupe-de-securite-de-votre-chauffe-eau-pas-de-panique', '/carnet/fuite-groupe-securite-chauffe-eau', 301);