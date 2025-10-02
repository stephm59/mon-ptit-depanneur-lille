import { Link } from "react-router-dom";
import { FileText, Home, Briefcase, MessageSquare, Star, MapPin } from "lucide-react";
import { useSitemapData } from "@/components/seo/SitemapGenerator";
import { Card, CardContent } from "@/components/ui/card";
import { Skeleton } from "@/components/ui/skeleton";
import { SEOHead } from "@/components/seo/SEOHead";

const Sitemap = () => {
  const { data, isLoading, error } = useSitemapData();

  const mainPages = [
    { title: "Accueil", path: "/", icon: Home },
    { title: "Contact", path: "/contact", icon: MessageSquare },
    { title: "L'entreprise", path: "/entreprise", icon: Briefcase },
    { title: "Avis clients", path: "/avis", icon: Star },
    { title: "Blog - Carnet de bord", path: "/carnet-de-bord", icon: FileText },
  ];

  if (error) {
    return (
      <div className="container mx-auto px-6 py-20">
        <SEOHead
          title="Plan du site - Mon P'tit Dépanneur"
          description="Plan du site Mon P'tit Dépanneur - Retrouvez toutes nos pages"
          canonical="https://www.monptitdepanneur.fr/sitemap"
        />
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4 text-destructive">Erreur</h1>
          <p>Une erreur s'est produite lors du chargement du plan du site.</p>
        </div>
      </div>
    );
  }

  return (
    <div className="container mx-auto px-6 py-20">
      <SEOHead
        title="Plan du site - Mon P'tit Dépanneur"
        description="Plan du site Mon P'tit Dépanneur - Accédez rapidement à toutes nos pages : services, villes, articles de blog et plus encore."
        canonical="https://www.monptitdepanneur.fr/sitemap"
      />

      {/* Header */}
      <div className="text-center mb-12">
        <h1 className="text-4xl font-bold mb-4">Plan du site</h1>
        <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
          Accédez rapidement à toutes les pages de notre site
        </p>
      </div>

      <div className="max-w-7xl mx-auto space-y-12">
        {/* Pages principales */}
        <section>
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <Home className="w-6 h-6" />
            Pages principales
          </h2>
          <Card>
            <CardContent className="p-6">
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {mainPages.map((page) => {
                  const Icon = page.icon;
                  return (
                    <Link
                      key={page.path}
                      to={page.path}
                      className="flex items-center gap-3 p-4 rounded-lg border border-border hover:border-primary hover:bg-accent transition-all"
                    >
                      <Icon className="w-5 h-5 text-primary" />
                      <span className="font-medium">{page.title}</span>
                    </Link>
                  );
                })}
              </div>
            </CardContent>
          </Card>
        </section>

        {/* Services par ville */}
        <section>
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <MapPin className="w-6 h-6" />
            Services par ville
          </h2>
          <Card>
            <CardContent className="p-6">
              {isLoading ? (
                <div className="space-y-2">
                  {[...Array(6)].map((_, i) => (
                    <Skeleton key={i} className="h-12 w-full" />
                  ))}
                </div>
              ) : data?.serviceCityPages && data.serviceCityPages.length > 0 ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                  {data.serviceCityPages.map((url) => {
                    const parts = url.split('/').filter(Boolean);
                    const title = parts.map(p => 
                      p.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')
                    ).join(' - ');
                    
                    return (
                      <Link
                        key={url}
                        to={url}
                        className="p-3 rounded-lg border border-border hover:border-primary hover:bg-accent transition-all text-sm"
                      >
                        {title}
                      </Link>
                    );
                  })}
                </div>
              ) : (
                <p className="text-muted-foreground">Aucune page service disponible</p>
              )}
            </CardContent>
          </Card>
        </section>

        {/* Blog */}
        <section>
          <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
            <FileText className="w-6 h-6" />
            Articles de blog
          </h2>
          <Card>
            <CardContent className="p-6">
              {isLoading ? (
                <div className="space-y-2">
                  {[...Array(6)].map((_, i) => (
                    <Skeleton key={i} className="h-12 w-full" />
                  ))}
                </div>
              ) : data?.blogPosts && data.blogPosts.length > 0 ? (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                  {data.blogPosts.map((post) => {
                    const title = post.slug.split('-').map(w => 
                      w.charAt(0).toUpperCase() + w.slice(1)
                    ).join(' ');
                    
                    return (
                      <Link
                        key={post.slug}
                        to={`/carnet-de-bord/${post.slug}`}
                        className="p-3 rounded-lg border border-border hover:border-primary hover:bg-accent transition-all text-sm"
                      >
                        {title}
                      </Link>
                    );
                  })}
                </div>
              ) : (
                <p className="text-muted-foreground">Aucun article disponible</p>
              )}
            </CardContent>
          </Card>
        </section>
      </div>
    </div>
  );
};

export default Sitemap;