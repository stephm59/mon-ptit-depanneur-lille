import { Lightbulb, ChevronLeft, ChevronRight, ArrowRight } from "lucide-react";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";

const BlogAdvice = () => {
  const [currentIndex, setCurrentIndex] = useState(0);
  
  const articles = [
    {
      id: 1,
      category: "Pompe à chaleur",
      title: "3 signes qu'il faut remplacer votre pompe à chaleur",
      description: "Apprenez à reconnaître les signaux d'alarme avant qu'une panne majeure ne vous laisse sans chauffage ni climatisation.",
      image: "https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&h=300&fit=crop",
      categoryColor: "bg-blue-100 text-blue-700"
    },
    {
      id: 2,
      category: "Pompe à chaleur", 
      title: "Comment optimiser les performances de votre PAC ?",
      description: "Guide étape par étape pour entretenir votre pompe à chaleur et maximiser son efficacité énergétique.",
      image: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop",
      categoryColor: "bg-blue-100 text-blue-700"
    },
    {
      id: 3,
      category: "Pompe à chaleur",
      title: "Entretien PAC : pourquoi c'est obligatoire ?",
      description: "Découvrez l'importance de l'entretien annuel de votre pompe à chaleur pour la sécurité et les économies d'énergie.",
      image: "https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400&h=300&fit=crop",
      categoryColor: "bg-blue-100 text-blue-700"
    },
    {
      id: 4,
      category: "Chauffage",
      title: "5 conseils pour réduire votre facture de chauffage",
      description: "Astuces simples et efficaces pour optimiser votre système de chauffage et faire des économies importantes.",
      image: "https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=400&h=300&fit=crop",
      categoryColor: "bg-orange-100 text-orange-700"
    },
    {
      id: 5,
      category: "Serrurerie",
      title: "Comment choisir la bonne serrure pour votre porte ?",
      description: "Guide complet des différents types de serrures et conseils pour sécuriser efficacement votre domicile.",
      image: "https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=400&h=300&fit=crop",
      categoryColor: "bg-green-100 text-green-700"
    },
    {
      id: 6,
      category: "Plomberie",
      title: "Fuite d'eau : les gestes d'urgence à connaître",
      description: "Que faire en cas de fuite ? Les réflexes essentiels pour limiter les dégâts en attendant le plombier.",
      image: "https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?w=400&h=300&fit=crop",
      categoryColor: "bg-cyan-100 text-cyan-700"
    }
  ];

  const articlesPerView = 3;
  const maxIndex = articles.length - articlesPerView;

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

  return (
    <section className="py-20 bg-background">
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
                    src={article.image}
                    alt={article.title}
                    className="w-full h-full object-cover"
                    loading="lazy"
                  />
                  {/* Category Badge */}
                  <div className="absolute top-4 left-4">
                    <span className={`px-3 py-1 rounded-full text-sm font-medium ${article.categoryColor}`}>
                      {article.category}
                    </span>
                  </div>
                </div>
                
                {/* Content */}
                <div className="p-6">
                  <h3 className="text-xl font-bold text-foreground mb-3 line-clamp-2">
                    {article.title}
                  </h3>
                  <p className="text-muted-foreground text-sm leading-relaxed mb-4 line-clamp-3">
                    {article.description}
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