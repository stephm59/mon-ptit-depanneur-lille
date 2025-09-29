import { useState } from "react";
import { Wrench, Volume2, VolumeX } from "lucide-react";
import { BUBBLE_VIDEO_URL, PLUMBER_VIDEO_URL, HEATING_VIDEO_URL } from "@/config/media";
import { Button } from "@/components/ui/button";

interface ServiceCityIntroProps {
  page: {
    h2_intro?: string | null;
    intro_description?: string | null;
    services: { name: string };
    cities: { name: string };
  };
}

export const ServiceCityIntro = ({ page }: ServiceCityIntroProps) => {
  const [isMuted, setIsMuted] = useState(true);
  
  // Detect service type for video selection
  const isPlumbingService = page.services.name.toLowerCase().includes('plomb') || 
                           (page.services as any).slug?.includes('plomb');
  const isHeatingService = page.services.name.toLowerCase().includes('chauffage') || 
                          (page.services as any).slug?.includes('chauffagiste');
  
  // Choose the appropriate video URL
  const videoUrl = isPlumbingService ? PLUMBER_VIDEO_URL : 
                   isHeatingService ? HEATING_VIDEO_URL : 
                   BUBBLE_VIDEO_URL;
  
  return (
    <section className="pt-32 pb-20 bg-background">
      <div className="container mx-auto px-4">
        <div className="flex flex-col lg:flex-row gap-8 items-start max-w-6xl mx-auto">
          {/* Video Section */}
          <div className="flex-shrink-0 flex justify-center lg:justify-start">
            <div className="relative">
              <video
                ref={(video) => {
                  if (video) {
                    video.muted = isMuted;
                  }
                }}
                className="w-64 h-64 object-cover rounded-full border-4 border-primary shadow-elevated"
                style={{ objectPosition: 'center 45%' }}
                src={videoUrl}
                autoPlay
                loop
                muted={isMuted}
                playsInline
                preload="metadata"
                onLoadStart={() => console.log('Video loading started')}
                onCanPlay={() => console.log('Video can play')}
                onError={(e) => {
                  console.error('Video failed to load:', e);
                  // Fallback to a static image if video fails to load
                  const target = e.currentTarget;
                  target.style.display = 'none';
                  const img = document.createElement('img');
                  img.src = '/src/assets/logo-mon-ptit-depanneur.png';
                  img.className = 'w-64 h-64 object-cover rounded-full border-4 border-primary shadow-elevated';
                  img.alt = 'Mon p\'tit Dépanneur';
                  target.parentNode?.appendChild(img);
                }}
              />
              
              {/* Sound control button */}
              <Button
                variant="outline"
                size="icon"
                className="absolute bottom-2 right-2 w-8 h-8 rounded-full bg-background/80 backdrop-blur-sm border-primary/20 hover:bg-background/90 transition-all duration-200"
                onClick={() => setIsMuted(!isMuted)}
                aria-label={isMuted ? "Activer le son" : "Couper le son"}
              >
                {isMuted ? (
                  <VolumeX className="w-4 h-4 text-muted-foreground" />
                ) : (
                  <Volume2 className="w-4 h-4 text-primary" />
                )}
              </Button>
            </div>
          </div>

          {/* Content Section */}
          <div className="flex-1">
            <div className="flex items-start mb-6">
              <Wrench className="w-8 h-8 text-primary mr-4 mt-1 flex-shrink-0" />
              <div>
                <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-2">
                  {page.h2_intro || `${page.services.name} à ${page.cities.name} : notre expertise à votre service`}
                </h2>
              </div>
            </div>

            <div className="prose prose-lg max-w-none">
              <p className="text-muted-foreground leading-relaxed">
                {page.intro_description || `Créée par David Vanmarcke il y a 20 ans, la société Mon p'tit Dépanneur emploie aujourd'hui 12 personnes et intervient dans les domaines suivants : Chauffage (installation de chaudière, réparation, entretien), serrurerie (porte bloquée, barillet à changer), plomberie (installation et entretien de cumulus, réparation de fuites) & vitrerie (remplacement de petites vitres cassées)...`}
              </p>
              
              <p className="text-muted-foreground leading-relaxed mt-4">
                Basée à Lille, Mon p'tit Dépanneur est agréée par une vingtaine de compagnies d'assurances (Macif, Maaf, Gan, Groupama...). Les équipes se déplacent chez vous, sur simple demande ou sur rendez-vous.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};