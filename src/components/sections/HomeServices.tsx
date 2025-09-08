import { Card, CardContent } from "@/components/ui/card";
import { Droplets, Flame, Wind, Thermometer, Bath, Lock } from "lucide-react";

const services = [
  {
    id: 1,
    title: "Plomberie",
    description: "Réparation de fuites, débouchage de canalisations, remplacement de robinetterie et installation sanitaire.",
    icon: Droplets,
    emoji: "🔧"
  },
  {
    id: 2,
    title: "Chauffage",
    description: "Installation, entretien et dépannage de tous types de systèmes de chauffage pour votre confort.",
    icon: Flame,
    emoji: "🔥"
  },
  {
    id: 3,
    title: "Climatisation",
    description: "Installation et maintenance de systèmes de climatisation pour un confort optimal toute l'année.",
    icon: Wind,
    emoji: "❄️"
  },
  {
    id: 4,
    title: "Pompe à chaleur",
    description: "Solutions écologiques et économiques avec installation et maintenance de pompes à chaleur.",
    icon: Thermometer,
    emoji: "♻️"
  },
  {
    id: 5,
    title: "Salle de bains",
    description: "Rénovation complète, modernisation et aménagement de votre salle de bains sur mesure.",
    icon: Bath,
    emoji: "🚿"
  },
  {
    id: 6,
    title: "Serrurerie",
    description: "Ouverture de porte, changement de serrure, blindage et sécurisation de votre domicile.",
    icon: Lock,
    emoji: "🔒"
  }
];

export const HomeServices = () => {
  return (
    <section className="py-16 bg-muted/30">
      <div className="container mx-auto px-6">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Nos services de proximité
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Des professionnels qualifiés pour tous vos besoins en dépannage, réparation et installation
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {services.map((service) => {
            const IconComponent = service.icon;
            
            return (
              <Card key={service.id} className="hover:shadow-lg transition-shadow border-border/50">
                <CardContent className="p-6">
                  <div className="flex items-start gap-4">
                    <div className="flex-shrink-0">
                      <span className="text-3xl">{service.emoji}</span>
                    </div>
                    <div>
                      <h3 className="text-xl font-semibold text-foreground mb-2">
                        {service.title}
                      </h3>
                      <p className="text-muted-foreground leading-relaxed">
                        {service.description}
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