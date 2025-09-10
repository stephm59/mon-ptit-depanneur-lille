-- Insert the annual boiler maintenance blog post
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
  'Tout savoir sur l''entretien annuel de votre chaudière',
  'entretien-annuel-chaudiere',
  'Pourquoi l''entretien annuel de votre chaudière est obligatoire, combien il coûte, que comprend le contrat et qui doit le payer (locataire ou propriétaire).',
  'Saviez-vous que l''entretien annuel de la chaudière à gaz est obligatoire en France ? Au-delà de la loi, c''est une question de sécurité, de confort et d''économies d''énergie. Voici tout ce qu''il faut savoir : prix, contenu de la visite, contrats et responsabilités.

## 1. Pourquoi entretenir sa chaudière chaque année ?

- **Sécurité** : prévenir les risques de fuite de gaz ou d''intoxication au monoxyde de carbone.
- **Économies** : une chaudière entretenue consomme jusqu''à 12 % d''énergie en moins.
- **Durée de vie** : un entretien régulier peut doubler la longévité de votre appareil (jusqu''à 20 ans).
- **Conformité légale** : l''entretien est obligatoire pour toutes les chaudières gaz de 4 à 400 kW.

## 2. Que risque-t-on en cas de non-entretien ?

Il n''y a pas d''amende directe, mais :

- votre assurance peut refuser une indemnisation en cas d''accident,
- votre propriétaire peut retenir une partie de la caution si vous ne fournissez pas l''attestation d''entretien,
- le risque de panne est jusqu''à 5 fois plus élevé sans entretien régulier.

## 3. En quoi consiste l''entretien annuel ?

Lors de sa visite, le technicien :

- vérifie les organes de combustion et de sécurité,
- nettoie les principaux éléments,
- démonte et règle le brûleur,
- mesure le taux de monoxyde de carbone,
- remplace les pièces défectueuses,
- délivre une attestation légale d''entretien.

👉 Cette attestation doit être conservée précieusement.

## 4. Le contrat d''entretien de chaudière

Vous pouvez souscrire un contrat annuel auprès d''un chauffagiste ou d''une entreprise spécialisée.
Il inclut :

- la visite annuelle obligatoire,
- parfois une assistance dépannage,
- des réparations prioritaires.

## 5. Quel est le prix de l''entretien annuel ?

- **Visite simple** : entre 80 et 150 €.
- **Contrat d''entretien annuel** : souvent plus intéressant si vous souhaitez inclure les réparations et dépannages.

## 6. Locataire ou propriétaire : qui doit payer ?

- **Chaudière individuelle** : c''est au locataire de faire réaliser et de payer l''entretien.
- **Chaudière collective** (copropriété, immeuble) : c''est la copropriété / le propriétaire qui prend en charge l''entretien global.

## Conclusion

L''entretien annuel est à la fois une obligation légale et un gage de tranquillité.

👉 Besoin d''un contrat d''entretien adapté ? Contactez Mon p''tit Dépanneur au **03 28 53 48 68** pour planifier la visite d''un technicien certifié.',
  '/blog-images/entretien-annuel-chaudiere.webp',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'chauffage' LIMIT 1)
);