import { MapPin } from "lucide-react";

interface ServiceCityZonesProps {
  zonesText: string;
  cityName: string;
}

export const ServiceCityZones = ({ zonesText, cityName }: ServiceCityZonesProps) => {
  return (
    <section className="py-16 bg-muted/30">
      <div className="container mx-auto px-6">
        <div className="text-center mb-12">
          <div className="flex items-center justify-center gap-2 mb-4">
            <MapPin className="h-8 w-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Zones d'intervention
            </h2>
          </div>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto mb-8">
            Nous intervenons à {cityName} et dans les communes environnantes
          </p>
        </div>

        <div className="max-w-4xl mx-auto">
          <div className="bg-card p-8 rounded-lg border border-border">
            <p className="text-foreground leading-relaxed text-lg">
              {zonesText}
            </p>
          </div>
        </div>
      </div>
    </section>
  );
};