-- Update the blog post with new comprehensive content
UPDATE blog_posts
SET 
  meta_title = 'Comment retourner un pene demi tour ? (guide débutant)',
  meta_description = 'Apprenez à retourner le pêne demi-tour d''une serrure pas à pas. Outils, étapes simples, astuces et sécurité. Guide Mon p''tit Dépanneur.',
  excerpt = 'Vous avez une porte qui ferme mal après un changement de sens d''ouverture ? Bonne nouvelle : retourner le pêne demi-tour est une opération simple si votre serrure est réversible. Suivez le guide pas à pas.',
  content = '# Comment retourner un pene demi tour ? (guide débutant)

Vous avez une porte qui ferme mal après un changement de sens d''ouverture ? Bonne nouvelle : retourner le pêne demi-tour (la petite languette biseautée qui rentre quand on appuie sur la poignée) est une opération simple si votre serrure est réversible. Suivez le guide pas à pas.

## En bref

⏱️ **Temps** : 15–30 min

🧰 **Outils** : tournevis (plat/cruciforme selon vis), petite pince, chiffon

🧑‍🔧 **Niveau** : débutant motivé

✅ **Objectif** : remettre le biseau côté huisserie (gâche) pour une fermeture douce

## 1) Comprendre les pièces

**Pêne demi-tour** : le pêne biseauté lié à la poignée (rentre/ressort).

**Pêne dormant** : le pêne carré du verrou (ne le touchez pas).

**Têtière** : la plaque visible sur le chant de la porte.

**Coffre de serrure** : le boîtier logé dans la porte (serrure à larder) ou posé dessus (serrure en applique).

## 2) Avant de commencer : vérifiez la réversibilité

Cherchez la mention "pêne réversible" sur la notice ou la référence. Beaucoup de serrures modernes le sont. Certains modèles anciens ou très premiers prix ne le sont pas : il faudra alors remplacer la serrure par un modèle réversible.

## 3) Étapes pas à pas (cas le plus courant, serrure à larder)

### Retirez les poignées
Dévissez les plaques/rosaces, sortez les béquilles (gardez les vis ensemble).

### Sortez la serrure
Dévissez la têtière, tirez le coffre hors de la porte.

### Repérez le pêne demi-tour
C''est le pêne biseauté (à distinguer du pêne dormant).

### Inversez le pêne (trois systèmes possibles)

**Ergot/bouton intégré** : maintenez l''ergot enfoncé (ou tirez légèrement le pêne), pivotez à 180°, relâchez.

**Axe/goupille** : sortez la goupille, retirez le pêne, retournez-le, remettez ressort et axe.

**Par l''orifice de têtière** : enfoncez un petit tournevis dans le trou prévu, maintenez, faites pivoter le pêne.

### Remontez
Remettez le coffre, revissez la têtière, reposez les poignées/rosaces.

### Testez
Fermez doucement : le biseau doit pousser sur la gâche puis le pêne doit rentrer/sortir sans forcer.

## 4) Sens d''ouverture : où doit viser le biseau ?

Gauche poussant / droite tirant… pas besoin de jargon : placez-vous côté où vous poussez la porte pour l''ouvrir. Le biseau doit toujours être côté dormant/huisserie, c''est-à-dire du côté où la porte vient buter dans le cadre.

## 5) Astuces pro

**Lubrification légère** : un spray PTFE (sec) sur le mécanisme. Évitez l''huile épaisse qui encrasse.

**Gâche mal alignée ?** Si ça frotte encore, remontez légèrement la gâche ou ajoutez une fine cale.

**Vis foirées** : utilisez un tournevis adapté et appuyez dans l''axe pour ne pas endommager les têtes.

**Sécurité** : déposez la clé pour éviter un verrouillage accidentel pendant l''intervention.

## 6) Cas particuliers

**Serrure en applique** : couvercle vissé. Ouvrez le capot pour accéder au mécanisme, puis même principe (ergot, axe ou trou de retournement).

**Pêne non réversible** : remplacez par une serrure réversible de mêmes entraxes (distance axe/entrée de clé et têtière compatibles).

**Poignées à ressort fatigué** : si la béquille ne revient pas bien, profitez-en pour remplacer le ressort de rappel ou la béquille.

## 7) Checklist de fin

✅ Le biseau est côté gâche.

✅ La poignée revient bien.

✅ La porte claque et ferme sans forcer.

✅ La clé tourne normalement (si verrou).',
  updated_at = now()
WHERE id = '3074a71b-2c4d-4abd-b797-107601fb98cc';

-- Add FAQs for this blog post
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
VALUES 
  ('3074a71b-2c4d-4abd-b797-107601fb98cc', 
   'Comment savoir si mon pêne est réversible ?',
   'La plupart des serrures modernes l''indiquent (notice, fiche produit). Si vous voyez un petit ergot près du pêne ou un trou de manœuvre sur la têtière, c''est généralement réversible.',
   1),
  ('3074a71b-2c4d-4abd-b797-107601fb98cc',
   'Je n''arrive pas à faire pivoter le pêne : normal ?',
   'Oui, certains modèles nécessitent de tirer légèrement le pêne pour libérer un verrou interne avant de le tourner à 180°. Sur d''autres, il faut retirer une goupille.',
   2),
  ('3074a71b-2c4d-4abd-b797-107601fb98cc',
   'Le pêne frotte après remontage, que faire ?',
   'Contrôlez l''alignement de la gâche et le jeu de la porte. Un léger réglage vertical ou une cale mince derrière la gâche suffit souvent.',
   3),
  ('3074a71b-2c4d-4abd-b797-107601fb98cc',
   'Puis-je graisser au WD-40 ?',
   'À éviter en lubrification permanente : préférez un lubrifiant sec/PTFE. Le WD-40 dépanne mais attire la poussière sur la durée.',
   4),
  ('3074a71b-2c4d-4abd-b797-107601fb98cc',
   'Ma serrure n''est pas réversible. Je change quoi ?',
   'Remplacez par un modèle réversible aux mêmes cotes (entraxe, axe, têtière). Apportez l''ancienne en quincaillerie pour correspondance.',
   5),
  ('3074a71b-2c4d-4abd-b797-107601fb98cc',
   'Ça reste trop technique, vous intervenez ?',
   'Oui : nos dépanneurs peuvent diagnostiquer et remettre en service rapidement. Intervention sans casse, devis clair, et garantie main-d''œuvre.',
   6);