import { MapPin } from "lucide-react";

const ContactMap = () => {
  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-4">
            <MapPin className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Nous localiser
            </h2>
          </div>
          <p className="text-lg text-muted-foreground max-w-3xl mx-auto">
            Situés au cœur de Lille, nous intervenons rapidement dans toute la métropole lilloise
          </p>
        </div>

        {/* Map Container */}
        <div className="max-w-5xl mx-auto">
          <div className="relative overflow-hidden rounded-2xl shadow-2xl h-96 md:h-[500px]">
            {/* Embedded Google Map */}
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2530.4687!2d3.0636!3d50.6292!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47c2d579b3256e11%3A0x40af13e816411030!2sLille%2C%20France!5e0!3m2!1sen!2sfr!4v1650000000000!5m2!1sen!2sfr"
              width="100%"
              height="100%"
              style={{ border: 0 }}
              allowFullScreen
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
              title="Localisation Mon p'tit Dépanneur à Lille"
              className="absolute inset-0"
            />
            
          </div>

          {/* Zone d'intervention */}
          <div className="mt-8 text-center">
            <h3 className="text-xl font-bold mb-4 text-foreground">
              Zone d'intervention
            </h3>
            <p className="text-muted-foreground">
              Nous intervenons dans un rayon de 30 km autour de Lille : 
              <span className="font-medium"> Roubaix, Tourcoing, Villeneuve-d'Ascq, Marcq-en-Barœul, Lambersart, 
              La Madeleine, Mons-en-Barœul, Wasquehal, Croix, Wattrelos</span> et bien d'autres communes.
            </p>
          </div>
        </div>
      </div>
    </section>
  );
};

export default ContactMap;