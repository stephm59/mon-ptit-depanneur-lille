import { Clock, Shield, ThumbsUp, Phone } from "lucide-react";
import { Card } from "@/components/ui/card";
import { useScrollAnimation } from "@/hooks/useScrollAnimation";
import { cn } from "@/lib/utils";

const WhyChooseUs = () => {
  const { elementRef: headerRef, isVisible: headerVisible } = useScrollAnimation({ threshold: 0.3 });
  const { elementRef: cardsRef, isVisible: cardsVisible } = useScrollAnimation({ threshold: 0.2 });
  const advantages = [
    {
      icon: Clock,
      title: "Intervention rapide",
      description: "Dépannage en moins de 2h en urgence",
      color: "text-primary"
    },
    {
      icon: Shield,
      title: "Devis gratuit", 
      description: "Évaluation transparente avant intervention",
      color: "text-primary"
    },
    {
      icon: ThumbsUp,
      title: "Garantie qualité",
      description: "Tous nos travaux sont garantis",
      color: "text-primary"
    },
    {
      icon: Phone,
      title: "Service client",
      description: "À votre écoute 7j/7",
      color: "text-primary"
    }
  ];

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div 
          ref={headerRef}
          className={cn(
            "text-center mb-16 max-w-4xl mx-auto fade-in-up",
            headerVisible && "animate"
          )}
        >
          <div className="flex items-center justify-center gap-3 mb-6">
            <div className="w-8 h-8 bg-primary/10 rounded-full flex items-center justify-center">
              <div className="w-4 h-4 bg-primary rounded-full"></div>
            </div>
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Pourquoi choisir Mon P'tit Dépanneur ?
            </h2>
          </div>
          <p className="text-lg text-muted-foreground">
            Plus de 10 000 clients ont fait appel à nous. Découvrez pourquoi nous sommes généralement le 
            choix n°1 dans la région lilloise.
          </p>
        </div>

        {/* Advantages Grid */}
        <div 
          ref={cardsRef}
          className={cn(
            "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 max-w-6xl mx-auto fade-in-up",
            cardsVisible && "animate"
          )}
        >
          {advantages.map((advantage, index) => (
            <Card 
              key={index} 
              className="p-8 text-center bg-white border border-gray-100 hover:shadow-lg transition-all duration-300 hover:scale-105"
              style={{ animationDelay: `${index * 100}ms` }}
            >
              {/* Icon Container */}
              <div className="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-6">
                <advantage.icon className={`w-8 h-8 ${advantage.color}`} />
              </div>
              
              {/* Title */}
              <h3 className="text-xl font-bold text-foreground mb-3">
                {advantage.title}
              </h3>
              
              {/* Description */}
              <p className="text-muted-foreground leading-relaxed">
                {advantage.description}
              </p>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};

export default WhyChooseUs;