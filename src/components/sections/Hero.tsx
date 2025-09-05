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
    <section className="relative min-h-[60vh] flex items-center overflow-visible pt-28 pb-24">
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
      <div className="absolute inset-0 bg-gradient-to-b from-black/60 via-black/40 to-black/20" />
      <div className="relative z-10 container mx-auto px-4 py-20">
        <div className="max-w-4xl mx-auto text-center">
          {/* Main headline */}
          <h1 className="text-4xl md:text-6xl font-bold mb-6 leading-tight text-white">
            Mon p'tit dépanneur, votre artisan de confiance 
            <span className="block text-accent">depuis plus de 20 ans</span>
          </h1>
          
          <p className="text-xl md:text-2xl mb-8 text-white/90">
            à Lille & ses alentours
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-12">
            <Button asChild size="lg" className="bg-accent text-accent-foreground hover:bg-accent/90 shadow-elevated text-lg font-bold">
              <a href="#devis">
                Demander un devis
              </a>
            </Button>
            <Button asChild variant="outline" size="lg" className="border-black/30 text-black bg-transparent hover:bg-black/5 text-lg" aria-label="Appeler Mon p'tit Dépanneur">
              <a href="tel:0328634868">
                <Phone className="w-6 h-6" />
                03 28 63 48 68
              </a>
            </Button>
          </div>

          {/* Rating */}
          <div className="flex items-center justify-center gap-2 mb-16">
            <div className="flex items-center">
              {[...Array(4)].map((_, i) => (
                <Star key={i} className="w-5 h-5 fill-accent text-accent" />
              ))}
              <div className="relative w-5 h-5">
                <Star className="absolute inset-0 w-5 h-5 text-white/40" />
                <div className="overflow-hidden w-1/2 h-full">
                  <Star className="w-5 h-5 fill-accent text-accent" />
                </div>
              </div>
            </div>
            <span className="text-white/90 ml-2">
              4,5/5 sur plus de 600 avis clients
            </span>
          </div>
        </div>
      </div>

      {/* Feature cards - overlapping at bottom */}
      <div className="absolute left-1/2 -translate-x-1/2 bottom-[-60px] md:bottom-[-70px] w-full max-w-6xl px-4 z-20">
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
    </section>
  );
};

export default Hero;