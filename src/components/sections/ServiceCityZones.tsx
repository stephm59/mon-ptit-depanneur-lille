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
          <div className="bg-card p-8 rounded-lg border border-border mb-8">
            <p className="text-foreground leading-relaxed text-lg">
              {zonesText}
            </p>
          </div>

          {/* Map Container */}
          <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
            <iframe 
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2530.7059302239863!2d3.0639534767775842!3d50.6325794742331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47c2d58f1a1b39a3%3A0xc50987d8e1d3f5d6!2sMon%20P&#39;tit%20D%C3%A9panneur!5e0!3m2!1sfr!2sfr!4v1757079283815!5m2!1sfr!2sfr"
              className="w-full h-96 md:h-[500px]"
              style={{ border: 0 }}
              allowFullScreen={true}
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
              title="Zones d'intervention Mon p'tit Dépanneur - Lille et environs"
            />
          </div>
          
          {/* Contact Info Card */}
          <div className="mt-8 bg-white rounded-2xl shadow-lg p-8 text-center">
            <h3 className="text-xl font-bold text-foreground mb-4">
              Notre siège social
            </h3>
            <div className="text-muted-foreground">
              <p className="mb-2">Mon P'tit Dépanneur</p>
              <p className="mb-2">21 Rue Édouard Delesalle, 59000 Lille</p>
              <p className="font-semibold text-primary">📞 03 28 63 48 68</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};