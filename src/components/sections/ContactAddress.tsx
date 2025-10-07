import { MapPin, Phone, Clock } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";

const ContactAddress = () => {
  const contactInfo = [
    {
      icon: MapPin,
      title: "Adresse",
      details: ["21 Rue Edouard Delesalle", "59000 Lille"],
      color: "text-primary"
    },
    {
      icon: Phone, 
      title: "Téléphone",
      details: ["03 28 53 48 68"],
      color: "text-accent"
    },
    {
      icon: Clock,
      title: "Horaires",
      details: ["Lun-Ven : 8h-18h"],
      color: "text-warning"
    }
  ];

  return (
    <section className="py-20 bg-muted/30">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Nos coordonnées
          </h2>
          <p className="text-lg text-muted-foreground max-w-3xl mx-auto">
            Retrouvez toutes nos informations de contact pour nous joindre facilement
          </p>
        </div>

        {/* Contact Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 max-w-5xl mx-auto">
          {contactInfo.map((info, index) => (
            <Card key={index} className="text-center hover:shadow-lg transition-shadow duration-300">
              <CardContent className="p-8">
                <div className={`w-16 h-16 mx-auto mb-6 rounded-full bg-background flex items-center justify-center shadow-md`}>
                  <info.icon className={`w-8 h-8 ${info.color}`} />
                </div>
                <h3 className="font-bold text-xl mb-4 text-foreground">
                  {info.title}
                </h3>
                <div className="space-y-1">
                  {info.details.map((detail, idx) => (
                    <p key={idx} className="text-muted-foreground">
                      {detail}
                    </p>
                  ))}
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};

export default ContactAddress;