import { Wrench } from "lucide-react";
import { GENERAL_VIDEO_URL } from "@/config/media";
import { useScrollAnimation } from "@/hooks/useScrollAnimation";
import { cn } from "@/lib/utils";

const About = () => {
  const { elementRef, isVisible } = useScrollAnimation({ threshold: 0.2 });

  return (
    <section className="pt-32 pb-20 bg-background">
      <div 
        ref={elementRef}
        className={cn(
          "container mx-auto px-4 fade-in-up",
          isVisible && "animate"
        )}
      >
        <div className="flex flex-col lg:flex-row gap-8 items-start max-w-6xl mx-auto">
          {/* Video Section - Plus petite */}
          <div className="flex-shrink-0">
            <div className="relative">
              <video
                className="w-64 h-64 object-cover rounded-full border-4 border-primary shadow-elevated"
                src={GENERAL_VIDEO_URL}
                autoPlay
                loop
                muted
                playsInline
                preload="metadata"
              />
            </div>
          </div>

          {/* Content Section - Prend plus de place */}
          <div className="flex-1">
            <div className="flex items-start mb-6">
              <Wrench className="w-8 h-8 text-primary mr-4 mt-1 flex-shrink-0" />
              <div>
                <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-2">
                  Dépannage, réparation, installation. On s'occupe de tout !
                </h2>
              </div>
            </div>

            <div className="prose prose-lg max-w-none">
              <p className="text-muted-foreground leading-relaxed mb-6">
                Créée par David Vanmarcke il y a 20 ans, la société Mon p'tit Dépanneur emploie aujourd'hui 12 personnes et 
                intervient dans les domaines suivants : Chauffage (installation de chaudière, réparation, entretien), serrurerie (porte 
                bloquée, barillet à changer), plomberie (installation et entretien de cumulus, réparation de fuites) & vitrerie 
                (remplacement de petites vitres cassées)...
              </p>
              
              <p className="text-muted-foreground leading-relaxed">
                Basée à Lille, Mon p'tit Dépanneur est agréée par une vingtaine de compagnies d'assurances (Macif, Maaf, Gan, 
                Groupama...). Les équipes se déplacent chez vous, sur simple demande ou sur rendez-vous.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default About;