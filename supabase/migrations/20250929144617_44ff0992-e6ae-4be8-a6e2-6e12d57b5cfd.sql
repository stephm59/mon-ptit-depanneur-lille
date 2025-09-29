-- Insérer le nouvel article de blog sur l'entretien chaudière à Lille
INSERT INTO blog_posts (
  id,
  service_id,
  title,
  slug,
  excerpt,
  cover_image_url,
  content,
  meta_title,
  meta_description,
  published,
  published_at
) VALUES (
  gen_random_uuid(),
  'e2d8cffd-bf35-477a-b150-de5697b23ba8',
  'Entretien de chaudière à Lille : que fait vraiment un pro, quand le faire, combien ça coûte ?',
  'entretien-chaudiere-lille',
  'Une chaudière bien entretenue, c''est moins de pannes, moins de gaz dépensé et plus de sécurité. Pour les logements lillois (maisons 1930, pavillons, appartements en copro), on t''explique l''essentiel : contenu d''une visite d''entretien, fréquence, signes d''alerte, budget — et ce que tu peux faire toi-même en attendant le pro.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/entretien-chaudiere-lille.webp',
  '# Entretien de chaudière à Lille : que fait vraiment un pro, quand le faire, combien ça coûte ?

Une chaudière bien entretenue, c''est moins de pannes, moins de gaz dépensé et plus de sécurité. Pour les logements lillois (maisons 1930, pavillons, appartements en copro), on t''explique l''essentiel : contenu d''une visite d''entretien, fréquence, signes d''alerte, budget — et ce que tu peux faire toi-même en attendant le pro.

## Pourquoi entretenir sa chaudière à Lille ?

**Sécurité** : détection d''anomalies (combustion, évacuation fumées, odeurs inhabituelles).

**Économies** : brûleur propre + réglages = moins de gaz pour la même chaleur.

**Confort** : démarrages fiables quand il fait 0–5 °C humide (classique à Lille).

**Longévité** : l''entretien prévient l''encrassement qui use les pièces.

**Copro/assureur** : un rapport d''entretien annuel rassure (et est souvent demandé).

## Que fait un pro lors d''un entretien ? (checklist claire)

### 1) Sécurité & mise en condition

Contrôle visuel de l''installation : fuites, corrosion, ventilation locale, arrivées d''air.

Vérifs gaz/fioul : raccords, étanchéité apparente, flexible (si présent).

Coupure/reprise électricité et gaz le temps des opérations.

### 2) Nettoyage et contrôles techniques

Brûleur : dépoussiérage/nettoyage, vérif allumeur, ionisation.

Échangeur : nettoyage (décalaminage léger) pour optimiser les rendements.

Siphon de condensats (chaudières condensation) : démontage, rinçage, remontage.

Filtre retour chauffage (si présent) : nettoyage ou remplacement.

### 3) Combustion & fumées

Mesure température des fumées, contrôle tirage/évacuation.

Analyse combustion (O₂, CO₂, taux de CO ambiant si pertinent) et réglages si nécessaire.

Vérif du ventouse/conduit (aspect, pente, fixations, condensats).

### 4) Hydraulique & pression

Pression circuit (à froid/à chaud), vase d''expansion (précharge si contrôle accessible), circulateur.

Purge rapide des radiateurs si besoin, contrôle groupe de sécurité ECS (si chaudière mixte).

### 5) Électronique & réglages

Test allumages, modulation, thermostat / sonde extérieure.

Conseils consignes & programmations (jour/nuit) adaptés au logement.

Remise d''un rapport d''entretien listant les points faits + recommandations.

💡 **Chaudières condensation** : un siphon encrassé ou une courbe de chauffe mal réglée = surconsommation et arrêts intempestifs. On corrige pendant l''entretien.

## Quand programmer l''entretien ?

**Idéal** : septembre–novembre, avant les premiers vrais froids.

**Après de gros travaux poussiéreux** : anticiper un passage (poussière = encrassement).

**Avant une mise en location ou une vente** : un rapport récent rassure.

## Signes d''alerte (appelez un pro)

Odeur de combustion anormale, flamme jaune, taches noires autour du conduit.

Montées/baisses de pression fréquentes, appoint eau récurrent.

Bruyante, vibrations nouvelles, codes erreurs répétés.

Radiateurs tièdes malgré la consigne, ECS irrégulière (douches "chaud/froid").

## Combien ça coûte ? (repères honnêtes)

**Entretien simple** : 90–140 € (hors pièces).

**Entretien + désinfection corps de chauffe/condensats** : 120–180 €.

**Contrat annuel** (entretien + dépannage prioritaire) : variable selon marque, âge et accès de l''appareil.

Le tarif dépend du modèle (classique/condensation), de l''accessibilité, de la complexité (ventouse en façade, combles difficiles…).

## Spécificités "Lille & maisons 1930 / copro"

**Tirage & conduits** : vieilles gaines/boisseaux → on vérifie attentivement l''évacuation des fumées.

**Ventilation** : pièces techniques parfois peu ventilées → on revoit entrées d''air.

**Copro** : rapport clair + photos des points sensibles (conduit, ventouse, siphon condensats) = AG sereine.

**Bruit** : chaudières en cour intérieure → plots anti-vibratiles, silences prolongés la nuit via programmation.

## Ce que vous pouvez faire vous-même (entre deux entretiens)

Purger les radiateurs si un glouglou apparaît / zones froides en haut.

Maintenir 1,2–1,5 bar à froid (indication générale) ; si chute régulière → appel pro.

Garder l''espace dégagé autour de la chaudière et ne pas boucher les entrées d''air.

Thermostat : limiter les écarts jour/nuit (ex. 20 °C / 17 °C), éviter les "grands coups de chaud".

## Entretien ≠ dépannage : la différence

**Entretien** : préventif, programmé, nettoie/règle et sécurise.

**Dépannage** : curatif, suite à panne (composant HS, fuite, code erreur).

Un bon entretien réduit fortement la probabilité de dépannage en plein hiver 😉

## Appel à l''action (local & clair)

Besoin d''un entretien propre et pédagogique ?
Mon p''tit Dépanneur – Lille : check complet, analyse combustion, réglages éco, rapport photo & recommandations.
👉 Demander un rendez-vous (propositions sous 24 h ouvrées).',
  'Entretien de chaudière à Lille : contenu, fréquence, prix & conseils',
  'Entretien chaudière à Lille : sécurité, économies, confort. Que fait un pro, quand le faire, combien ça coûte, signes d''alerte et conseils maisons 1930/copro. Rapport d''entretien clair.',
  true,
  now()
);

-- Insérer les FAQs pour cet article
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) 
SELECT 
  bp.id,
  faq.question,
  faq.answer,
  faq.position
FROM blog_posts bp,
(VALUES 
  ('L''entretien est-il obligatoire ?', 'Il est fortement recommandé et souvent exigé par bailleurs/syndics/assureurs. Les règles pouvant évoluer, vérifiez les textes en vigueur et votre contrat (nous vous aidons à clarifier au moment du devis).', 1),
  ('Quand le faire dans l''année ?', 'Plutôt avant l''hiver (sept.–nov.), pour partir sur des réglages optimisés et éviter les pannes.', 2),
  ('Combien de temps ça dure ? Dois-je être présent·e ?', 'Comptez 45–90 min. Oui, c''est mieux : on vous explique les réglages et on répond à vos questions.', 3),
  ('L''entretien fait-il baisser ma facture ?', 'Oui, en général : brûleur/échangeur propres + combustion réglée = moins de gaz pour le même confort.', 4),
  ('Ma pression descend régulièrement, normal ?', 'Non. Une chute fréquente peut révéler une petite fuite ou un vase d''expansion à revoir. On diagnostique.', 5),
  ('Faut-il aussi un ramonage ?', 'Selon le conduit et les règles locales, un ramonage périodique peut être requis. On vous indique si votre installation est concernée et on peut le coordonner.', 6),
  ('Je suis en copropriété : quoi fournir au syndic ?', 'Le rapport d''entretien et, si demandé, une note sur l''évacuation des fumées/ventouse et la ventilation du local.', 7),
  ('Puis-je retarder l''entretien si tout marche ?', 'Mauvaise idée : l''encrassement est progressif. Un passage annuel évite les pannes dans le froid… quand tout le monde appelle.', 8),
  ('Chaudière récente : vraiment utile ?', 'Oui. Les chaudières condensation ont des siphons/sondes qui s''encrassent aussi. L''entretien préserve le rendement.', 9),
  ('Entretien = garantie constructeur ?', 'Beaucoup de garanties exigent une preuve d''entretien : gardez le rapport.', 10),
  ('Vous intervenez sur quelles marques ?', 'Marques courantes (ex. Saunier Duval, Vaillant, Chaffoteaux, De Dietrich, Elm Leblanc, Atlantic, etc.). On vous confirme au moment de la prise de rendez-vous.', 11),
  ('Et si j''ai aussi une PAC ?', 'On peut coordonner l''entretien chaudière + PAC pour optimiser la régulation (priorités, loi d''eau, ECS).', 12)
) AS faq(question, answer, position)
WHERE bp.slug = 'entretien-chaudiere-lille';