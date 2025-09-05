import { Star, Clock, Shield, Wrench, Phone } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import heroBackground from "@/assets/hero-background.jpg";

const VIDEO_URL = "https://res.cloudinary.com/dit7nfyiy/video/upload/v1754995491/video-hero-home_bx95k0.mp4";

const Hero = () => {
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
    <section className="relative min-h-[80vh] flex items-center overflow-hidden">
      {/* Background video */}
      <video
        className="absolute inset-0 w-full h-full object-cover"
        src={VIDEO_URL}
        autoPlay
        loop
        muted
        playsInline
        poster={heroBackground}
        aria-hidden="true"
      />
      {/* Overlay gradient */}
      <div className="absolute inset-0 bg-gradient-to-b from-primary/80 to-primary-light/70" />
      <div className="relative z-10 container mx-auto px-4 py-20">
        <div className="max-w-4xl mx-auto text-center text-primary-foreground">
          {/* Main headline */}
          <h1 className="text-4xl md:text-6xl font-bold mb-6 leading-tight">
            Mon p'tit dépanneur, votre artisan de confiance 
            <span className="block text-accent">depuis plus de 20 ans</span>
          </h1>
          
          <p className="text-xl md:text-2xl mb-8 text-primary-foreground/90">
            à Lille & ses alentours
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-12">
            <Button asChild variant="urgent" size="lg" className="text-lg font-bold" aria-label="Appeler Mon p'tit Dépanneur">
              <a href="tel:0328634868">
                <Phone className="w-6 h-6" />
                Appel d'urgence
              </a>
            </Button>
            <Button variant="hero" size="lg" className="text-lg">
              Devis gratuit
            </Button>
          </div>

          {/* Rating */}
          <div className="flex items-center justify-center gap-2 mb-16">
            <div className="flex items-center">
              {[...Array(5)].map((_, i) => (
                <Star key={i} className="w-5 h-5 fill-accent text-accent" />
              ))}
            </div>
            <span className="text-primary-foreground/90 ml-2">
              4,9/5 sur plus de 600 avis clients
            </span>
          </div>

          {/* Feature cards */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {features.map((feature, index) => (
              <Card key={index} className="p-6 bg-card/95 backdrop-blur-sm border-none shadow-card hover:shadow-elevated transition-all duration-300 transform hover:scale-105">
                <div className="text-center">
                  <feature.icon className={`w-12 h-12 mx-auto mb-4 ${feature.color}`} />
                  <h3 className="font-bold text-lg mb-2 text-card-foreground">{feature.title}</h3>
                  <p className="text-muted-foreground">{feature.description}</p>
                </div>
              </Card>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;