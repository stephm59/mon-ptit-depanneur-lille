-- Insérer le nouvel article de blog sur les codes erreur climatisation
INSERT INTO blog_posts (
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  meta_title,
  meta_description,
  published,
  published_at,
  service_id
) VALUES (
  'Code erreur clim (Daikin, Mitsubishi, Atlantic…) : premiers réflexes',
  'code-erreur-clim-premiers-reflexes',
  'Votre clim réversible affiche un code erreur ? Pas de panique. Voici les bons réflexes sans risque, les causes probables, des exemples de codes par marque et quand appeler un pro — avec un focus "cœur d''îlot lillois" (bruit, condensats, voisinage).',
  '# Code erreur clim (Daikin, Mitsubishi, Atlantic…) : premiers réflexes

Votre clim réversible affiche un code erreur ? Pas de panique. Voici les bons réflexes sans risque, les causes probables, des exemples de codes par marque et quand appeler un pro — avec un focus "cœur d''îlot lillois" (bruit, condensats, voisinage).

## L''essentiel en 20 secondes

- **Coupez le courant 5 minutes** (disjoncteur dédié), rallumez : si le code revient, notez-le.
- **Vérifiez filtres et évacuation des condensats** (sources fréquentes des pannes "simples").
- **Dégagez l''unité extérieure** (pas de bâche/feuilles/objets, laisser du volume d''air).
- **Ne touchez pas au circuit frigorigène** (sécurité & réglementation).
- **Besoin d''aide ?** Mon p''tit Dépanneur – Lille : diagnostic rapide, devis clair.

## Où lire le code erreur

- **Télécommande** : message ou code "E… / U… / H…".
- **Unité intérieure (UI)** : LED qui clignotent (couleur/rythme précis).
- **Unité extérieure (UE)** : voyant/afficheur derrière un petit capot.
- **Appli mobile** (si connectée) : historique, date/heure, parfois un libellé.

**Astuce** : faites une photo du code/lumières. Notez heure, météo (givre possible entre 0–5 °C), bruits inhabituels.

## Les 6 familles d''erreurs (pour comprendre vite)

| Famille | Symptômes fréquents | En clair | Réflexe "safe" immédiat |
|---------|-------------------|----------|------------------------|
| **Alimentation / communication** | Ne démarre pas, LED clignotent | Électricité ou dialogue UI↔UE | Vérifier disjoncteur/câble, reset 5 min |
| **Condensats / pompe** | Eau qui goutte, arrêt avec code | Bac/ligne bouchés, pompe faiblarde | Vérifier pente/sortie du tuyau, ne laissez pas déborder |
| **Air / flux** | Souffle faible, arrêts sécurité | Filtres/échangeurs encrassés, grilles obstruées | Nettoyer filtres, dégager grilles UI/UE |
| **Sondes / températures** | Chauffe/refroidit mal, arrêt aléatoire | Sonde lit faux / protection | Laisser 30–60 min après reset ; observer météo |
| **Surchauffe / sous-refroid.** | Monte puis coupe vite | Échange thermique dégradé | Nettoyer ailettes (doucement), dégager UE |
| **Frigorifique** | Moins de froid/chaud qu''avant, code récurrent | Manque de fluide / micro-fuite | Pro obligatoire (contrôle étanchéité/charge) |

## Check-list "premiers réflexes" (débutant, sans risque)

1. **Reset** : coupez le disjoncteur dédié 5 minutes, rallumez.
2. **Filtres UI** : ouvrez la façade, aspi + lavage (si lavables), bien sécher.
3. **Condensats** : vérifiez la pente et la liberté du tuyau (pas de boucle/coude/bouchon).
4. **Unité extérieure** : enlevez feuilles/bâches, pas d''obstacle à 30–50 cm mini derrière/devant, plus si possible.
5. **Mode & consigne** : bon mode (flocon/soleil) ; évitez 18 °C en plein été → 25–26 °C est un bon repère.
6. **Observation** : si le code revient, notez bruits, heures, météo → ça aide au diagnostic.

⚠️ **À ne pas faire** : démonter des capots moteurs/UE, shunter des sécurités, ouvrir le circuit frigorigène.

## Exemples de codes erreurs par marque (indicatifs)

⚠️ **Important** : ces exemples sont fréquents mais non exhaustifs. Les libellés et significations peuvent varier selon la gamme (résidentiel, cassette, gainable, VRF/VRV) et l''année.

### Daikin (résidentiel / multi-split)

- **U0** — Manque de fluide frigorigène (suspicion de fuite / charge insuffisante).
- **U2** — Alimentation anormale (sous/surtension).
- **U4** — Erreur de communication UI↔UE (câblage, carte).
- **A3** — Défaut de gestion de niveau de condensats (pompe/ flotteur / tuyau).
- **A6** — Défaut moteur de ventilateur (UI).

### Mitsubishi Electric (Mr Slim / résidentiel)

- **E6 / E7** — Communication anormale UI↔UE.
- **P5** — Défaut pompe de condensats.
- **P6** — Protection givre (en froid) / surchauffe (en chaud) → échange thermique dégradé.
- **U2** — Température de refoulement anormale / manque de réfrigérant.
- **U1 / Ud** — Haute pression anormale / sécurité surchauffe.

### Panasonic (résidentiel)

- **H11** — Communication UI↔UE anormale.
- **F90** — Protection électronique de puissance (PFC/compresseur).

### Atlantic (selon gamme/co-brand)

- **C0 / 1d / 1c** — Incompatibilité UI/commande ou communication anormale (selon tableau constructeur).
- **Alerte générique "code/clignotement"** — se référer à la table du manuel du modèle exact (les mappings changent selon la série).

## Tableau "symptômes → causes probables → que faire"

| Symptôme | Causes probables | Que faire tout de suite |
|----------|------------------|-------------------------|
| **Eau qui goutte sous l''UI** | Bac/tuyau bouché, pompe fatiguée | Nettoyez filtres, vérifiez pente/sortie du tuyau ; coupez si déborde ; pro si ça persiste |
| **Bruit inhabituel (UI/UE)** | Obstruction, silentblocs tassés, pale encrassée | Dégagez UE ; vérifiez que l''UI n''est pas collée à un obstacle ; pro si vibrations |
| **Plus de froid/chaud** | Filtres/échangeur encrassés, manque de fluide | Nettoyage "grand public" ; si performance toujours faible → diagnostic frigo |
| **Arrêts fréquents** | Surchauffe/sous-refroid., givre en hiver | Dégagez UE, laissez dégivrer ; si récurrent → revoir implantation |
| **Ne démarre pas** | Disjoncteur, câble, communication | Vérifiez tableau/terre, reset 5 min ; pro si code persiste |
| **Odeurs** | Biofilm dans bac/évap. | Nettoyage filtres ; désinfection évaporateur/bac (pro recommandé) |

## Spécial Lille / cœur d''îlot : éviter les codes "fantômes"

- **UE confinée** (balcon fermé, coffre plein) → surchauffe / protections → codes récurrents.
- **Condensats mal gérés** → débordements et arrêt sécurité.
- **Vibrations** (garde-corps léger) → micro-coupures / erreurs communication : ajouter châssis + silentblocs et mode nuit.

## Quand appeler un pro (et ce que nous faisons)

- Le même code revient après vos vérifs.
- Soupçon de fuite, odeur électrique, bruit compresseur, arrêts nocturnes répétés.
- **En visite** : contrôle élec, condensats, press/étanchéité, échangeurs, silentblocs, mise à jour réglages (mode nuit, vitesses), rapport photo.

## Appel à l''action (local & clair)

**Un code qui revient = un signal.**

Mon p''tit Dépanneur – Lille : diagnostic clim rapide, remise en route quand c''est simple, devis clair quand pièce/charge sont en cause.

## FAQ

### Le "reset 5 minutes" peut-il suffire ?

Parfois oui (il vide un état électronique). S''il revient, passez la check-list (filtres, condensats, UE dégagée).

### Je peux ouvrir l''unité extérieure ?

Non. Risque électrique/frigorifique. Contentez-vous de dégager les grilles et retirer les feuilles/bâches.

### L''hiver, ma clim coupe avec un code

Souvent lié au givre : la machine dégivre. Si c''est très fréquent, l''UE est peut-être confinée ou mal orientée.

### Code de communication après orage

Vérifiez disjoncteur, terre, câbles visibles. Si le code persiste : diagnostic élec.

### Coffres "design" = moins de bruit et plus de sécurité ?

Attention : les coffres fermés font forcer l''UE → bruit et codes (surchauffe). Préférez un écran absorbant ventilé.

### L''entretien annuel sert-il vraiment ?

Oui : moins d''odeurs, moins de codes, meilleure conso, plus de longévité.',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/code-erreur-clim.webp',
  'Code erreur clim (Daikin, Mitsubishi, Atlantic…) : premiers réflexes',
  'Clim en erreur ? Reset 5 min, filtres, condensats, unité extérieure dégagée. Exemples de codes (Daikin, Mitsubishi, Panasonic, Atlantic), causes probables et quand appeler un pro à Lille.',
  true,
  now(),
  (SELECT id FROM services WHERE slug = 'climatisation' LIMIT 1)
);