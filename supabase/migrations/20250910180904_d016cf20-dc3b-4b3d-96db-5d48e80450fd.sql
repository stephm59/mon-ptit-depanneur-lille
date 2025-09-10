-- Ajouter le nouvel article sur MaPrimeRénov'
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
  'Remplacer sa chaudière avec MaPrimeRénov'' : conditions, montant et démarches',
  'aides-remplacement-chaudiere-maprimerenov',
  'Votre chaudière est vieille ? Découvrez comment profiter de MaPrimeRénov'' et des autres aides de l''État pour la remplacer : conditions, montants, démarches et conseils pratiques.',
  '# Remplacer sa chaudière avec MaPrimeRénov'' : conditions, montant et démarches

Votre chaudière fatigue ? 🔧 Sachez qu''il existe des aides financières de l''État pour la remplacer par un modèle plus performant et moins énergivore.
La plus connue : MaPrimeRénov''.

Dans ce guide, Mon P''tit Dépanneur vous explique clairement :

- qui peut en bénéficier,
- quels sont les montants,
- quelles démarches effectuer,
- et quelles alternatives existent.

## Pourquoi remplacer sa chaudière ?

👉 60 % des chaudières en France sont anciennes et peu efficaces.
Les remplacer, c''est :

- réduire vos factures d''énergie 💶,
- améliorer votre confort thermique 🌡️,
- limiter les émissions polluantes 🌍.

Les chaudières à condensation sont aujourd''hui le standard, car elles récupèrent la chaleur des fumées et permettent jusqu''à 30 % d''économies par rapport aux modèles classiques.

## MaPrimeRénov'' : l''aide phare

Créée en 2020, MaPrimeRénov'' est une prime de l''État versée par l''ANAH (Agence nationale de l''habitat).
Elle est attribuée en fonction de vos revenus et du type de travaux réalisés.

### Qui peut en bénéficier ?

- Tous les propriétaires occupants ou bailleurs,
- Logements construits depuis plus de 15 ans,
- Installation réalisée par un professionnel RGE (Reconnu Garant de l''Environnement).

### Quels équipements sont concernés ?

- Chaudières à gaz haute performance (à condensation),
- Chaudières biomasse,
- Pompes à chaleur (PAC air/eau, géothermique),
- Chauffe-eau solaire ou thermodynamique.

⚠️ **Attention** : les chaudières fioul ne sont plus éligibles.

## Montants de MaPrimeRénov''

Le montant dépend de vos revenus et du type de chaudière installée.

| Revenus du ménage (profil MaPrimeRénov'') | Chaudière gaz condensation | Chaudière biomasse | Pompe à chaleur air/eau |
|---|---|---|---|
| Très modestes (MaPrimeRénov'' Bleu) | jusqu''à 1 200 € | jusqu''à 11 000 € | jusqu''à 9 000 € |
| Modestes (Jaune) | jusqu''à 800 € | jusqu''à 9 000 € | jusqu''à 7 500 € |
| Intermédiaires (Violet) | non éligible | jusqu''à 4 000 € | jusqu''à 3 000 € |
| Supérieurs (Rose) | non éligible | non éligible | non éligible |

💡 **Bon à savoir** : MaPrimeRénov'' est cumulable avec les CEE (Certificats d''Économie d''Énergie), la TVA réduite à 5,5 % et l''éco-PTZ (prêt à taux zéro).

## Quelles démarches pour obtenir MaPrimeRénov'' ?

1️⃣ Faites un devis avec un professionnel RGE.
2️⃣ Créez un compte sur [www.maprimerenov.gouv.fr](https://www.maprimerenov.gouv.fr).
3️⃣ Déposez votre demande avec : devis, pièces justificatives (revenus, logement, etc.).
4️⃣ Une fois la demande validée, lancez les travaux.
5️⃣ Envoyez la facture et recevez la prime par virement bancaire.

⏳ Le délai de versement est en moyenne de 4 à 6 semaines après validation du dossier.

## Autres aides disponibles

- **Primes CEE** : financées par les fournisseurs d''énergie.
- **TVA réduite à 5,5 %** : applicable sur l''achat et la pose.
- **Éco-PTZ** : prêt à taux zéro jusqu''à 50 000 € pour financer vos travaux de rénovation énergétique.

## En résumé

👉 MaPrimeRénov'' est une aide simple et efficace pour remplacer une chaudière ancienne par un équipement moderne et économique.
👉 Elle peut être cumulée avec d''autres aides.
👉 Un seul impératif : faire appel à un professionnel RGE.

**Besoin d''accompagnement ?**
Contactez Mon P''tit Dépanneur au 📞 03 28 53 48 68 : nos chauffagistes RGE vous guident dans le choix de la chaudière et dans vos démarches administratives.',
  '/blog-images/ma-prime-renov.webp',
  (SELECT id FROM services WHERE slug = 'chauffage'),
  true,
  now()
);

-- Ajouter les FAQs pour cet article
INSERT INTO blog_post_faqs (
  blog_post_id,
  question,
  answer,
  position
) VALUES 
(
  (SELECT id FROM blog_posts WHERE slug = 'aides-remplacement-chaudiere-maprimerenov'),
  'Quelles chaudières sont éligibles à MaPrimeRénov'' ?',
  'Les chaudières gaz à condensation, les chaudières biomasse et certains équipements comme les pompes à chaleur et les chauffe-eaux solaires sont éligibles.',
  1
),
(
  (SELECT id FROM blog_posts WHERE slug = 'aides-remplacement-chaudiere-maprimerenov'),
  'Peut-on cumuler MaPrimeRénov'' avec d''autres aides ?',
  'Oui, MaPrimeRénov'' est cumulable avec les primes CEE, la TVA réduite à 5,5 % et l''éco-PTZ.',
  2
),
(
  (SELECT id FROM blog_posts WHERE slug = 'aides-remplacement-chaudiere-maprimerenov'),
  'Qui doit faire les travaux pour bénéficier de l''aide ?',
  'Les travaux doivent être réalisés par un professionnel RGE (Reconnu Garant de l''Environnement).',
  3
),
(
  (SELECT id FROM blog_posts WHERE slug = 'aides-remplacement-chaudiere-maprimerenov'),
  'Quels sont les revenus maximum pour bénéficier de MaPrimeRénov'' ?',
  'Tous les ménages peuvent demander MaPrimeRénov'', mais les montants varient selon les revenus. Les foyers modestes perçoivent les aides les plus élevées.',
  4
),
(
  (SELECT id FROM blog_posts WHERE slug = 'aides-remplacement-chaudiere-maprimerenov'),
  'Combien de temps faut-il pour recevoir la prime ?',
  'Le délai moyen est de 4 à 6 semaines après validation du dossier et l''envoi des factures.',
  5
),
(
  (SELECT id FROM blog_posts WHERE slug = 'aides-remplacement-chaudiere-maprimerenov'),
  'Ma chaudière fioul peut-elle être remplacée avec MaPrimeRénov'' ?',
  'Oui, mais uniquement par une chaudière gaz à condensation, une pompe à chaleur ou une chaudière biomasse. Les chaudières fioul ne sont plus subventionnées.',
  6
);

-- Ajouter la redirection
INSERT INTO redirects (
  from_path,
  to_path,
  status_code
) VALUES (
  '/aides-de-letat-pour-remplacer-sa-chaudiere-maprimerenov',
  '/carnet/aides-remplacement-chaudiere-maprimerenov',
  301
);