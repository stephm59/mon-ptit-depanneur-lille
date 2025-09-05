import { Star, Quote } from "lucide-react";
import { Card } from "@/components/ui/card";

const Testimonials = () => {
  const testimonials = [
    {
      name: "Sophie L.",
      location: "Lille",
      rating: 5,
      text: "Intervention rapide et efficace pour une fuite d'eau. Technicien très professionnel et sympathique. Je recommande vivement !",
    },
    {
      name: "Marc D.",
      location: "Roubaix",
      rating: 5,
      text: "Excellent service pour le dépannage de ma chaudière. David est arrivé rapidement et a résolu le problème en moins d'une heure.",
    },
    {
      name: "Catherine M.",
      location: "Tourcoing",
      rating: 5,
      text: "Très satisfait de l'installation de ma nouvelle pompe à chaleur. Travail soigné et équipe compétente.",
    },
    {
      name: "Jean-Pierre V.",
      location: "Villeneuve-d'Ascq",
      rating: 5,
      text: "Rénovation complète de ma salle de bain. Résultat magnifique et dans les délais. Service irréprochable !",
    },
    {
      name: "Marie C.",
      location: "Lambersart",
      rating: 5,
      text: "Dépannage serrure en urgence un dimanche. Intervention rapide et tarifs honnêtes. Merci beaucoup !",
    },
    {
      name: "Paul R.",
      location: "Wasquehal",
      rating: 5,
      text: "Installation de climatisation parfaite. Conseil personnalisé et travail de qualité. Je recommande.",
    }
  ];

  return (
    <section className="py-20 bg-muted/30">
      <div className="container mx-auto px-4">
        {/* Section header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center mb-4">
            <Star className="w-6 h-6 text-accent mr-2" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">Ce que disent nos clients</h2>
          </div>
          <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
            Plus de 600 avis positifs sur Google témoignent de notre engagement envers la qualité et la satisfaction client.
          </p>
        </div>

        {/* Testimonials grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {testimonials.map((testimonial, index) => (
            <Card key={index} className="p-6 hover:shadow-elevated transition-all duration-300 transform hover:scale-105 bg-card border-none shadow-card">
              <div className="flex items-center mb-4">
                <Quote className="w-8 h-8 text-accent mr-3" />
                <div className="flex">
                  {[...Array(testimonial.rating)].map((_, i) => (
                    <Star key={i} className="w-4 h-4 fill-accent text-accent" />
                  ))}
                </div>
              </div>
              
              <blockquote className="text-card-foreground mb-4 leading-relaxed">
                "{testimonial.text}"
              </blockquote>
              
              <div className="border-t pt-4">
                <cite className="font-semibold text-primary not-italic">
                  {testimonial.name}
                </cite>
                <p className="text-sm text-muted-foreground">
                  {testimonial.location}
                </p>
              </div>
            </Card>
          ))}
        </div>

        {/* Call to action */}
        <div className="text-center mt-12">
          <p className="text-lg text-muted-foreground mb-4">
            Rejoignez nos clients satisfaits
          </p>
          <div className="flex items-center justify-center gap-2">
            <div className="flex">
              {[...Array(5)].map((_, i) => (
                <Star key={i} className="w-6 h-6 fill-accent text-accent" />
              ))}
            </div>
            <span className="text-xl font-bold text-primary ml-2">
              4,9/5 sur plus de 600 avis Google
            </span>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Testimonials;