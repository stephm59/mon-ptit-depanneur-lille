-- Insert blog post about vase d'expansion sanitaire
INSERT INTO blog_posts (
  id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  meta_title,
  meta_description,
  service_id,
  published,
  published_at
) VALUES (
  'f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f',
  'Pourquoi installer un vase d''expansion sanitaire ?',
  'vase-expansion-sanitaire',
  'Vous avez un chauffe-eau ou un ballon d''eau chaude ? Alors vous avez sûrement entendu parler du vase d''expansion sanitaire. Cet accessoire est trop souvent négligé, alors qu''il peut éviter fuites, surconsommation et pannes coûteuses.',
  'Vous avez un chauffe-eau ou un ballon d''eau chaude ? Alors vous avez sûrement entendu parler du vase d''expansion sanitaire. Cet accessoire est trop souvent négligé, alors qu''il peut éviter fuites, surconsommation et pannes coûteuses.

👉 Dans cet article, Mon p''tit Dépanneur vous explique à quoi il sert, pourquoi il est recommandé et quels bénéfices il apporte à votre installation d''eau chaude sanitaire.

## Qu''est-ce qu''un vase d''expansion sanitaire ?

Le vase d''expansion est un réservoir équipé d''une membrane souple.

Une partie reçoit le surplus d''eau lorsque la pression monte dans le chauffe-eau.

L''autre partie contient un gaz (souvent de l''azote) qui absorbe cette pression.

Il peut être intégré au chauffe-eau ou installé à l''extérieur, selon le modèle et la capacité de votre appareil.

👉 Son rôle principal : maintenir une pression stable dans le circuit d''eau chaude pour protéger vos équipements.

## Pourquoi est-il recommandé ?

Sans vase d''expansion, la pression de l''eau peut devenir trop forte et causer :

L''usure prématurée du chauffe-eau et de la tuyauterie.

Des fuites répétées (source de désagréments et de surcoût sur la facture).

Un groupe de sécurité sursollicité, qui devra être remplacé plus souvent.

Une efficacité réduite, donc plus d''énergie dépensée pour chauffer la même quantité d''eau.

👉 Le vase d''expansion sanitaire est donc un petit investissement qui protège votre installation et évite des frais plus importants à long terme.

## Les avantages du vase d''expansion sanitaire

✅ Économies d''eau : limite les pertes liées aux fuites et au groupe de sécurité.
✅ Économies d''énergie : moins besoin de réchauffer de l''eau perdue inutilement.
✅ Durée de vie prolongée : protège le chauffe-eau, les canalisations et le groupe de sécurité.
✅ Confort et sérénité : moins de pannes, moins de fuites, moins d''interventions.

## Conclusion

Le vase d''expansion sanitaire est vivement recommandé pour toute installation d''eau chaude. Il protège votre équipement, réduit vos factures et évite bien des soucis.

👉 Besoin d''un conseil ou d''une installation ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68.
Nos artisans certifiés sont à votre service pour optimiser votre système de production d''eau chaude.',
  '/blog-images/vase-expansion-sanitaire.webp',
  'Vase d''expansion sanitaire : utilité, avantages et installation',
  'Découvrez pourquoi installer un vase d''expansion sanitaire : limiter la pression, éviter les fuites et prolonger la durée de vie de votre chauffe-eau. Conseils Mon p''tit Dépanneur.',
  (SELECT id FROM services WHERE slug = 'plomberie' LIMIT 1),
  true,
  now()
);

-- Insert FAQs for the blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES 
('f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f', 'Est-ce obligatoire d''avoir un vase d''expansion sanitaire ?', 'Non, ce n''est pas obligatoire, mais fortement recommandé. Sans lui, l''installation subit davantage de pression et risque des fuites prématurées.', 1),
('f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f', 'Où installer le vase d''expansion sanitaire ?', 'Il peut être intégré directement au chauffe-eau ou placé à proximité sur le circuit d''eau chaude.', 2),
('f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f', 'Quelle est la durée de vie d''un vase d''expansion ?', 'En moyenne 8 à 10 ans, selon la qualité et l''entretien de l''installation.', 3),
('f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f', 'Quels signes indiquent que le vase est défectueux ?', 'Fuites fréquentes au groupe de sécurité, pression instable, ballon qui se met en sécurité.', 4),
('f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f', 'Est-ce compatible avec tous les chauffe-eau ?', 'Oui, qu''il soit électrique, thermodynamique ou relié à une chaudière, il existe un modèle adapté.', 5),
('f5e6d4c2-8b9a-4d1e-9f2c-3a7b8c9d0e1f', 'Combien coûte l''installation d''un vase d''expansion ?', 'L''appareil coûte généralement entre 60 et 150 €, installation comprise. Un petit prix comparé aux économies réalisées sur la durée.', 6);

-- Insert redirect from old URL to new URL
INSERT INTO redirects (from_path, to_path, status_code) VALUES 
('/vase-expansion-sanitaire/', '/carnet/vase-expansion-sanitaire/', 301);