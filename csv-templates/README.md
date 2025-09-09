# CSV Templates pour import de données

## Instructions d'utilisation

1. **Remplissez les fichiers CSV** avec vos données
2. **Importez via Supabase Dashboard** :
   - Allez sur https://supabase.com/dashboard/project/bpwqdkznbmqwvvxpthhl/editor
   - Sélectionnez la table correspondante
   - Utilisez "Insert" > "Import from CSV"

## Ordre d'import recommandé

1. `cities.csv` - Les villes d'abord
2. `services.csv` - Les services ensuite  
3. `service_city_pages.csv` - Les pages service/ville
4. `service_city_offers.csv` - Les offres par page
5. `service_city_faqs.csv` - Les FAQs locales
6. `testimonials.csv` - Les témoignages
7. `blog_posts.csv` - Les articles de blog

## Notes importantes

- Les slugs doivent correspondre entre les fichiers
- Les colonnes `published` contrôlent la visibilité publique
- Les positions déterminent l'ordre d'affichage
- Les ratings vont de 1 à 5
- Les dates seront automatiquement ajoutées (created_at, updated_at)

## Après l'import

Une fois les données importées, le JSON-LD sera automatiquement généré et les pages seront fonctionnelles.