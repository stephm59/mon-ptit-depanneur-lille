# Génération de Pages HTML Statiques

## Installation

Le script de génération est déjà créé. Il vous suffit de modifier le `package.json` pour ajouter les scripts de génération.

### Modifier package.json

Ajoutez ces deux scripts dans la section `"scripts"` :

```json
"generate-static": "node scripts/generate-static-pages.js",
"build": "node scripts/generate-static-pages.js && vite build"
```

Le script `"build"` existant doit être remplacé par cette nouvelle version qui génère d'abord les pages HTML statiques avant de builder Vite.

## Utilisation

### Générer les pages HTML statiques seules

```bash
npm run generate-static
```

Cela va :
1. Se connecter à Supabase
2. Récupérer les données de la page `plombier-lille`
3. Générer le fichier `public/plombier-lille.html`

### Build complet (génération + build Vite)

```bash
npm run build
```

Cela va d'abord générer les pages HTML statiques, puis builder l'application Vite.

## Vérification locale

Après avoir exécuté `npm run generate-static`, vérifiez que le fichier a été créé :

```bash
# Vérifier l'existence
ls -la public/plombier-lille.html

# Vérifier le contenu HTML
cat public/plombier-lille.html | grep "<h1"
```

Vous devriez voir la balise `<h1>` avec le contenu de la page.

## Test après déploiement

Une fois déployé sur Netlify, testez avec curl :

```bash
curl -A "Googlebot" https://www.monptitdepanneur.fr/plombier-lille | grep -i "<h1"
```

Cette fois, vous devriez **enfin** voir la balise `<h1>` dans le HTML retourné !

## Extension à d'autres pages

Pour générer d'autres pages service-ville, il suffit de modifier `scripts/generate-static-pages.js` et ajouter des appels à `generateServiceCityPage()` :

```javascript
async function main() {
  console.log('🚀 Génération des pages HTML statiques...\n');
  
  await generateServiceCityPage('plombier', 'lille');
  await generateServiceCityPage('chauffagiste', 'lille');
  await generateServiceCityPage('serrurier', 'lille');
  // etc.
  
  console.log('\n✨ Génération terminée!');
}
```

Ou mieux encore, récupérer toutes les pages publiées automatiquement :

```javascript
async function main() {
  const { data: pages } = await supabase
    .from('service_city_pages')
    .select('service:services(slug), city:cities(slug)')
    .eq('published', true);
  
  for (const page of pages) {
    await generateServiceCityPage(page.service.slug, page.city.slug);
  }
}
```

## Avantages

✅ **SEO parfait** : HTML immédiatement crawlable par Google  
✅ **Performance** : Pas de JS requis, chargement instantané  
✅ **Fiabilité** : Plus besoin de Prerender.io ou Edge Functions  
✅ **Coût** : Gratuit, pas de quota externe  
✅ **Simplicité** : Build-time generation, pas de complexité runtime  

## Architecture

- `scripts/generate-static-pages.js` : Script principal qui orchestre la génération
- `scripts/templates/service-city-template.js` : Template HTML réutilisable
- `public/plombier-lille.html` : Fichier HTML généré (créé automatiquement)
- `public/_redirects` : Règle Netlify pour servir le HTML (déjà ajoutée)
