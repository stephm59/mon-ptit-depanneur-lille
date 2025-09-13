import { Clock, Shield, Wrench, Star } from "lucide-react";
import { Card } from "@/components/ui/card";
import { useScrollAnimation } from "@/hooks/useScrollAnimation";
import { cn } from "@/lib/utils";

const ReassuranceCards = () => {
  const { elementRef, isVisible } = useScrollAnimation({ threshold: 0.2 });
  const features = [
    {
      icon: Clock,
      title: "Intervention < 1h",
      description: "Dans Lille et environs",
      color: "text-accent"
    },
    {
      icon: Shield,
      title: "Garantie décennale",
      description: "Travaux assurés",
      color: "text-success"
    },
    {
      icon: Wrench,
      title: "Devis gratuit",
      description: "Sans engagement",
      color: "text-primary-light"
    },
    {
      icon: Star,
      title: "Artisan de confiance",
      description: "Service de qualité",
      color: "text-accent"
    }
  ];

  return (
    <div 
      ref={elementRef}
      className={cn(
        "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 fade-in-up",
        isVisible && "animate"
      )}
    >
      {features.map((feature, index) => (
        <Card 
          key={index} 
          className="p-6 bg-card/95 backdrop-blur-sm border-none shadow-card hover:shadow-elevated transition-all duration-300 transform hover:scale-105"
          style={{ animationDelay: `${index * 100}ms` }}
        >
          <div className="text-center">
            <feature.icon className={`w-12 h-12 mx-auto mb-4 ${feature.color}`} />
            <h3 className="font-bold text-lg mb-2 text-card-foreground">{feature.title}</h3>
            <p className="text-muted-foreground">{feature.description}</p>
          </div>
        </Card>
      ))}
    </div>
  );
};

export default ReassuranceCards;