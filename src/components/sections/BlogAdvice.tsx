import { Lightbulb, ChevronLeft, ChevronRight, ArrowRight } from "lucide-react";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { useFilteredBlogPosts } from "@/hooks/useBlog";

const BlogAdvice = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const { data: blogPosts, isLoading } = useFilteredBlogPosts();
  
  // Les articles populaires sont déjà triés en premier par le hook
  const articles = blogPosts?.slice(0, 6) || [];
  
  // Fonction pour déterminer la couleur de catégorie basée sur le service
  const getCategoryColor = (serviceName?: string) => {
    const service = serviceName?.toLowerCase() || '';
    if (service.includes('pompe') || service.includes('chauffage')) return "bg-blue-100 text-blue-700";
    if (service.includes('plomberie')) return "bg-cyan-100 text-cyan-700";
    if (service.includes('serrurerie')) return "bg-green-100 text-green-700";
    if (service.includes('électricité')) return "bg-yellow-100 text-yellow-700";
    if (service.includes('vitrerie')) return "bg-purple-100 text-purple-700";
    return "bg-gray-100 text-gray-700";
  };
  
  const articlesPerView = 3;
  const maxIndex = Math.max(0, articles.length - articlesPerView);

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

  const visibleArticles = articles.slice(currentIndex, currentIndex + articlesPerView);

  if (isLoading) {
    return (
      <section className="py-20 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="text-center">
            <div className="animate-pulse">
              <div className="h-8 bg-gray-300 rounded w-96 mx-auto mb-4"></div>
              <div className="h-4 bg-gray-300 rounded w-64 mx-auto"></div>
            </div>
          </div>
        </div>
      </section>
    );
  }

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
            Nos experts partagent leurs conseils et astuces pour vous aider à mieux entretenir vos 
            équipements et éviter les pannes
          </p>
        </div>

        {/* Articles Carousel */}
        <div className="relative max-w-6xl mx-auto mb-12">
          {/* Navigation Arrows */}
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

          {/* Articles Grid */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {visibleArticles.map((article) => (
              <Card key={article.id} className="overflow-hidden hover:shadow-lg transition-all duration-300 transform hover:scale-105 bg-white border border-gray-200">
                 {/* Image */}
                 <div className="relative aspect-[4/3] overflow-hidden">
                   <img 
                     src={article.cover_image_url || "https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&h=300&fit=crop"}
                     alt={article.title}
                     className="w-full h-full object-cover"
                     loading="lazy"
                   />
                   {/* Category Badge */}
                   <div className="absolute top-4 left-4">
                     <span className={`px-3 py-1 rounded-full text-sm font-medium ${getCategoryColor(article.services?.name)}`}>
                       {article.services?.name || "Conseil"}
                     </span>
                   </div>
                 </div>
                 
                 {/* Content */}
                 <div className="p-6">
                   <h3 className="text-xl font-bold text-foreground mb-3 line-clamp-2">
                     {article.title}
                   </h3>
                   <p className="text-muted-foreground text-sm leading-relaxed mb-4 line-clamp-3">
                     {article.excerpt || "Découvrez nos conseils d'experts pour mieux entretenir vos équipements."}
                   </p>
                  
                  {/* Read More Link */}
                  <div className="flex items-center gap-2 text-primary font-semibold hover:text-primary/80 transition-colors cursor-pointer">
                    <span>Lire le bon conseil</span>
                    <ArrowRight className="w-4 h-4" />
                  </div>
                </div>
              </Card>
            ))}
          </div>
        </div>

        {/* Dots Navigation */}
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

export default BlogAdvice;