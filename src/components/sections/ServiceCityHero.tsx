import { Button } from "@/components/ui/button";
import { Phone } from "lucide-react";

interface ServiceCityHeroProps {
  page: {
    h1?: string | null;
    h2_intro?: string | null;
    intro_description?: string | null;
    cta_title?: string | null;
    cta_subtitle: string;
    services: { name: string };
    cities: { name: string };
  };
}

export const ServiceCityHero = ({ page }: ServiceCityHeroProps) => {
  return (
    <section className="bg-gradient-primary py-24">
      <div className="container mx-auto px-6 text-center">
        <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">
          {page.h1 || `${page.services.name} à ${page.cities.name}`}
        </h1>
        
        {page.h2_intro && (
          <h2 className="text-xl md:text-2xl text-white/90 mb-6 max-w-3xl mx-auto">
            {page.h2_intro}
          </h2>
        )}
        
        {page.intro_description && (
          <p className="text-lg text-white/80 mb-8 max-w-4xl mx-auto leading-relaxed">
            {page.intro_description}
          </p>
        )}

        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Button size="lg" variant="secondary">
            Recevoir un devis gratuit
          </Button>
          <Button size="lg" variant="outline" className="text-white border-white hover:bg-white hover:text-primary">
            <Phone className="mr-2 h-5 w-5" />
            09 72 10 19 19
          </Button>
        </div>

        {(page.cta_title || page.cta_subtitle) && (
          <div className="mt-12 p-6 bg-white/10 rounded-lg backdrop-blur-sm">
            {page.cta_title && (
              <h3 className="text-2xl font-semibold text-white mb-2">
                {page.cta_title}
              </h3>
            )}
            <p className="text-white/90">
              {page.cta_subtitle}
            </p>
          </div>
        )}
      </div>
    </section>
  );
};