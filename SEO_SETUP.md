# Configuration SEO - Prochaines étapes

## ✅ Ce qui a été implémenté

### 1. Corrections de base
- ✅ URL du sitemap corrigée dans `robots.txt` (.com → .fr)
- ✅ Composant SEO centralisé créé (`src/components/seo/SEOHead.tsx`)
- ✅ Balises canonical ajoutées sur toutes les pages
- ✅ Meta tags optimisés (author, keywords, og:tags)
- ✅ Préconnexions DNS pour améliorer les performances
- ✅ Structure HTML mise à jour (lang="fr")

### 2. Données structurées (JSON-LD)
- ✅ Page d'accueil : Organization, LocalBusiness, WebSite
- ✅ Articles de blog : Article schema avec date de publication/modification
- ✅ Pages service-ville : Service, LocalBusiness, BreadcrumbList, FAQPage
- ✅ Page entreprise : LocalBusiness détaillé avec certifications
- ✅ FAQs intégrées dans les articles de blog

### 3. Composant SEO centralisé
Toutes les pages utilisent maintenant `<SEOHead>` qui gère automatiquement :
- Titre et description
- Canonical URLs
- Open Graph tags
- Twitter Cards
- JSON-LD structured data
- Meta tags author et keywords

## ⚙️ Configuration à faire

### 1. Google Analytics 4 (GA4)

**Étape 1 : Créer un compte GA4**
1. Allez sur [Google Analytics](https://analytics.google.com/)
2. Créez une propriété GA4
3. Récupérez votre ID de mesure (format : G-XXXXXXXXXX)

**Étape 2 : Ajouter l'ID dans le code**
Éditez le fichier `index.html` ligne 13 :
```html
<!-- Remplacez G-XXXXXXXXXX par votre vrai ID -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-VOTRE-ID-ICI"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-VOTRE-ID-ICI');
</script>
```

### 2. Google Search Console

**Étape 1 : Vérifier votre site**
1. Allez sur [Google Search Console](https://search.google.com/search-console)
2. Ajoutez votre propriété : `https://www.monptitdepanneur.fr`
3. Choisissez la méthode "Balise HTML"
4. Copiez le code de vérification

**Étape 2 : Ajouter le code de vérification**
Éditez le fichier `index.html` ligne 22 :
```html
<!-- Remplacez YOUR_VERIFICATION_CODE par le code fourni par Google -->
<meta name="google-site-verification" content="VOTRE-CODE-ICI" />
```

**Étape 3 : Soumettre le sitemap**
Une fois vérifié, dans Search Console :
1. Allez dans "Sitemaps" (menu de gauche)
2. Ajoutez l'URL : `https://www.monptitdepanneur.fr/sitemap.xml`
3. Cliquez sur "Envoyer"

### 3. Vérifications recommandées

**Tester les données structurées**
- Utilisez [Rich Results Test](https://search.google.com/test/rich-results) de Google
- Testez plusieurs pages : accueil, articles de blog, pages service-ville

**Tester les balises meta**
- Utilisez [Meta Tags](https://metatags.io/) pour visualiser vos meta tags
- Vérifiez que les images og:image s'affichent correctement

**Surveiller l'indexation**
Dans Search Console après quelques jours :
- Vérifiez que toutes vos pages importantes sont indexées
- Consultez les erreurs d'exploration éventuelles
- Vérifiez les performances de recherche

## 📊 Analyse des performances

### Métriques à surveiller dans GA4
- Nombre de visiteurs uniques
- Pages les plus visitées
- Taux de rebond
- Durée moyenne des sessions
- Conversions (appels, formulaires)

### Métriques à surveiller dans Search Console
- Impressions et clics
- Position moyenne des pages
- CTR (Click-Through Rate)
- Pages avec le plus de clics
- Requêtes de recherche qui génèrent du trafic

## 🔍 Optimisations supplémentaires possibles

1. **Ajouter des événements GA4** pour suivre :
   - Clics sur le bouton d'appel
   - Soumissions de formulaire
   - Clics vers les pages service-ville

2. **Implémenter Google Tag Manager** :
   - Facilite la gestion de plusieurs outils analytics
   - Permet d'ajouter des pixels de conversion (Facebook, LinkedIn)

3. **Ajouter Schema.org VideoObject** :
   - Si vous ajoutez des vidéos sur le site

4. **Optimiser les Core Web Vitals** :
   - Vérifier la vitesse de chargement
   - Optimiser les images (déjà fait avec OptimizedImage)
   - Minimiser le JavaScript

## 📝 Notes importantes

- Les changements SEO prennent du temps (2-4 semaines) avant d'être visibles dans les résultats de recherche
- Google Search Console nécessite une vérification de propriété avant de fonctionner
- Les données structurées sont vérifiées automatiquement par Google mais peuvent prendre quelques jours à apparaître dans les résultats riches
- Pensez à soumettre votre sitemap après chaque ajout majeur de contenu

## 🚀 Prochaines actions recommandées

1. **Priorité 1** : Configurer GA4 et Search Console (2h max)
2. **Priorité 2** : Vérifier les données structurées avec Rich Results Test (30min)
3. **Priorité 3** : Soumettre le sitemap dans Search Console (5min)
4. **Priorité 4** : Surveiller l'indexation pendant 1-2 semaines
5. **Priorité 5** : Analyser les premières données et ajuster si nécessaire

## 📞 Besoin d'aide ?

Si vous rencontrez des difficultés avec la configuration, n'hésitez pas à demander de l'aide !
