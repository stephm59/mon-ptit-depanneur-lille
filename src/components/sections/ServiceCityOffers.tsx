import { Card, CardContent } from "@/components/ui/card";
import { useServiceCityOffers } from "@/hooks/useServiceCityPage";
import { Wrench, Droplets, Zap, Home, Shield, Clock } from "lucide-react";

interface ServiceCityOffersProps {
  pageId: string;
}

const iconMap = {
  wrench: Wrench,
  droplets: Droplets,
  zap: Zap,
  home: Home,
  shield: Shield,
  clock: Clock,
};

export const ServiceCityOffers = ({ pageId }: ServiceCityOffersProps) => {
  const { data: offers, isLoading } = useServiceCityOffers(pageId);

  if (isLoading || !offers?.length) return null;

  return (
    <section className="py-16 bg-background">
      <div className="container mx-auto px-6">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Nos prestations
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Découvrez notre gamme complète de services pour répondre à tous vos besoins
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {offers.map((offer) => {
            const IconComponent = offer.icon_name ? iconMap[offer.icon_name as keyof typeof iconMap] : null;
            
            return (
              <Card key={offer.id} className="hover:shadow-lg transition-shadow">
                <CardContent className="p-6">
                  <div className="flex items-start gap-4">
                    <div className="flex-shrink-0">
                      {offer.emoji ? (
                        <span className="text-3xl">{offer.emoji}</span>
                      ) : IconComponent ? (
                        <IconComponent className="h-8 w-8 text-primary" />
                      ) : (
                        <Wrench className="h-8 w-8 text-primary" />
                      )}
                    </div>
                    <div>
                      <h3 className="text-xl font-semibold text-foreground mb-2">
                        {offer.title}
                      </h3>
                      <p className="text-muted-foreground leading-relaxed">
                        {offer.description}
                      </p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            );
          })}
        </div>
      </div>
    </section>
  );
};