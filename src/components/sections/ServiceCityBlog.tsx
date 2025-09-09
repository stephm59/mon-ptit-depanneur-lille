import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { ArrowRight, Calendar, ChevronLeft, ChevronRight, Lightbulb } from "lucide-react";
import { useServiceBlogPosts } from "@/hooks/useServiceCityPage";
import { useState } from "react";
import { Link } from "react-router-dom";

interface ServiceCityBlogProps {
  serviceId: string;
  categoryLabel?: string;
}

export const ServiceCityBlog = ({ serviceId, categoryLabel = "Plomberie" }: ServiceCityBlogProps) => {
  const { data: posts, isLoading } = useServiceBlogPosts(serviceId);
  const [currentIndex, setCurrentIndex] = useState(0);

  // Articles statiques par défaut si pas d'articles en base
  const staticArticles = [
    {
      id: 1,
      category: categoryLabel,
      title: "Fuite d'eau : les gestes d'urgence à connaître",
      description: "Que faire en cas de fuite ? Les réflexes essentiels pour limiter les dégâts en attendant le plombier.",
      image: "https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    },
    {
      id: 2,
      category: categoryLabel,
      title: "Comment déboucher un évier sans produit chimique ?",
      description: "Méthodes naturelles et efficaces pour déboucher vos canalisations sans abîmer vos tuyaux.",
      image: "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    },
    {
      id: 3,
      category: categoryLabel,
      title: "Entretien ballon d'eau chaude : nos conseils",
      description: "Guide complet pour prolonger la durée de vie de votre chauffe-eau et éviter les pannes.",
      image: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    },
    {
      id: 4,
      category: categoryLabel,
      title: "Réduire sa consommation d'eau : 10 astuces",
      description: "Conseils pratiques pour économiser l'eau au quotidien et réduire votre facture.",
      image: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    },
    {
      id: 5,
      category: categoryLabel,
      title: "Prévenir le gel des canalisations en hiver",
      description: "Comment protéger vos tuyaux du gel et que faire si vos canalisations sont gelées.",
      image: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    },
    {
      id: 6,
      category: categoryLabel,
      title: "Installer un robinet : étapes et outils nécessaires",
      description: "Guide étape par étape pour remplacer votre robinetterie en toute sécurité.",
      image: "https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    }
  ];

  // Utiliser les articles de la base si disponibles, sinon les articles statiques
  const articlesToShow = posts && posts.length > 0 ? posts : staticArticles;
  const articlesPerView = 3;
  const maxIndex = Math.max(0, articlesToShow.length - articlesPerView);

  const nextSlide = () => {
    setCurrentIndex((prevIndex) => 
      prevIndex >= maxIndex ? 0 : prevIndex + 1
    );
  };

  const prevSlide = () => {
    setCurrentIndex((prevIndex) => 
      prevIndex === 0 ? maxIndex : prevIndex - 1
    );
  };

  const visibleArticles = articlesToShow.slice(currentIndex, currentIndex + articlesPerView);

  if (isLoading) return null;

  return (
    <section className="py-20 bg-gray-50">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16 max-w-4xl mx-auto">
          <div className="flex items-center justify-center gap-3 mb-6">
            <Lightbulb className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Les bons conseils de Mon p'tit Dépanneur
            </h2>
          </div>
          <p className="text-lg text-muted-foreground">
            Nos experts {categoryLabel.toLowerCase()} partagent leurs conseils et astuces pour vous aider à mieux entretenir vos 
            installations et éviter les pannes
          </p>
        </div>

        {/* Articles Carousel */}
        <div className="relative max-w-6xl mx-auto mb-12">
          {/* Navigation Arrows */}
          {articlesToShow.length > articlesPerView && (
            <>
              <Button
                variant="outline"
                size="icon"
                className="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-4 z-10 bg-white hover:bg-gray-50 border-gray-300"
                onClick={prevSlide}
              >
                <ChevronLeft className="w-5 h-5" />
              </Button>
              
              <Button
                variant="outline"
                size="icon"
                className="absolute right-0 top-1/2 -translate-y-1/2 translate-x-4 z-10 bg-white hover:bg-gray-50 border-gray-300"
                onClick={nextSlide}
              >
                <ChevronRight className="w-5 h-5" />
              </Button>
            </>
          )}

          {/* Articles Grid */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {visibleArticles.map((article) => (
              <Card key={article.id} className="overflow-hidden hover:shadow-lg transition-all duration-300 transform hover:scale-105 bg-white border border-gray-200">
                {/* Image */}
                <div className="relative aspect-[4/3] overflow-hidden">
                  <img 
                    src={'image' in article ? article.image : article.cover_image_url || 'https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?w=400&h=300&fit=crop'}
                    alt={article.title}
                    className="w-full h-full object-cover"
                    loading="lazy"
                  />
                  {/* Category Badge */}
                  <div className="absolute top-4 left-4">
                    <span className={`px-3 py-1 rounded-full text-sm font-medium ${'categoryColor' in article ? article.categoryColor : 'bg-cyan-100 text-cyan-700'}`}>
                      {'category' in article ? article.category : categoryLabel}
                    </span>
                  </div>
                </div>
                
                {/* Content */}
                <div className="p-6">
                  <h3 className="text-xl font-bold text-foreground mb-3 line-clamp-2">
                    {article.title}
                  </h3>
                  <p className="text-muted-foreground text-sm leading-relaxed mb-4 line-clamp-3">
                    {'description' in article ? article.description : article.excerpt}
                  </p>
                  
                  {/* Date for DB articles */}
                  {'published_at' in article && article.published_at && (
                    <div className="flex items-center gap-2 text-xs text-muted-foreground mb-3">
                      <Calendar className="h-3 w-3" />
                      {new Date(article.published_at).toLocaleDateString('fr-FR', {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric'
                      })}
                    </div>
                  )}
                  
                  {/* Read More Link */}
                  <Link 
                    to={`/${'slug' in article ? article.slug : '#'}`}
                    className="flex items-center gap-2 text-primary font-semibold hover:text-primary/80 transition-colors"
                  >
                    <span>Lire le conseil</span>
                    <ArrowRight className="w-4 h-4" />
                  </Link>
                </div>
              </Card>
            ))}
          </div>
        </div>

        {/* Dots Navigation */}
        {articlesToShow.length > articlesPerView && (
          <div className="flex justify-center gap-2 mb-8">
            {Array.from({ length: maxIndex + 1 }).map((_, index) => (
              <button
                key={index}
                className={`w-3 h-3 rounded-full transition-colors ${
                  index === currentIndex ? 'bg-primary' : 'bg-gray-300'
                }`}
                onClick={() => setCurrentIndex(index)}
              />
            ))}
          </div>
        )}

        {/* CTA Button */}
        <div className="text-center">
          <Button size="lg" className="bg-primary text-primary-foreground hover:bg-primary/90 font-semibold px-8">
            <span>Voir tous nos conseils</span>
            <ArrowRight className="w-5 h-5 ml-2" />
          </Button>
        </div>
      </div>
    </section>
  );
};