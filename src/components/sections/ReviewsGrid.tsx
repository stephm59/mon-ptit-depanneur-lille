import { Star } from "lucide-react";
import { Card } from "@/components/ui/card";

const ReviewsGrid = () => {
  const reviews = [
    {
      text: "Intervention rapide et efficace pour une fuite d'eau. Technicien très professionnel et sympathique. Je recommande vivement !",
      name: "Sophie L.",
      location: "Lille",
      rating: 5,
      service: "Plomberie"
    },
    {
      text: "Excellent service pour le dépannage de ma chaudière. David est arrivé rapidement et a résolu le problème en moins d'une heure.",
      name: "Marc D.",
      location: "Roubaix", 
      rating: 5,
      service: "Chauffage"
    },
    {
      text: "Très satisfait de l'installation de ma nouvelle pompe à chaleur. Travail soigné et équipe compétente.",
      name: "Catherine M.",
      location: "Tourcoing",
      rating: 5,
      service: "Chauffage"
    },
    {
      text: "Service de serrurerie impeccable ! Porte débloquée en quelques minutes, tarif honnête. Je recommande !",
      name: "Pierre J.",
      location: "Villeneuve-d'Ascq",
      rating: 5,
      service: "Serrurerie"
    },
    {
      text: "Remplacement de ma vitre cassée fait avec soin. Intervention rapide et prix correct.",
      name: "Marie F.",
      location: "Wasquehal",
      rating: 5,
      service: "Vitrerie"
    },
    {
      text: "Installation de salle de bain parfaite ! Travail propre et dans les délais. Merci à toute l'équipe.",
      name: "Jean-Claude H.",
      location: "Lille",
      rating: 5,
      service: "Plomberie"
    },
    {
      text: "Dépannage électrique réalisé en urgence. Technicien compétent et service client au top !",
      name: "Isabelle R.",
      location: "Marcq-en-Barœul",
      rating: 5,
      service: "Électricité"
    },
    {
      text: "Changement de serrure suite à cambriolage. Intervention dans l'heure, prix honnête. Parfait !",
      name: "Thomas B.",
      location: "La Madeleine",
      rating: 5,
      service: "Serrurerie"
    },
    {
      text: "Rénovation complète de ma salle de bain. Résultat magnifique et dans le budget annoncé.",
      name: "Sylvie M.",
      location: "Lambersart", 
      rating: 5,
      service: "Plomberie"
    }
  ];

  return (
    <section className="py-20 bg-gray-50 mt-20">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Star className="w-8 h-8 text-primary fill-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Avis de nos clients
            </h2>
          </div>
          <p className="text-lg text-muted-foreground max-w-3xl mx-auto">
            Découvrez les témoignages authentiques de nos clients satisfaits dans la région lilloise.
          </p>
        </div>

        {/* Reviews Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto">
          {reviews.map((review, index) => (
            <Card key={index} className="p-6 bg-white border border-gray-200 hover:shadow-lg transition-shadow h-full">
              {/* Service Badge */}
              <div className="inline-block px-3 py-1 bg-primary/10 text-primary text-sm font-medium rounded-full mb-4">
                {review.service}
              </div>

              {/* Stars */}
              <div className="flex gap-1 mb-4">
                {[...Array(5)].map((_, i) => (
                  <Star key={i} className="w-4 h-4 fill-rating text-rating" />
                ))}
              </div>
              
              {/* Review Text */}
              <blockquote className="text-gray-700 leading-relaxed mb-4 flex-1">
                "{review.text}"
              </blockquote>
              
              {/* Author */}
              <div className="border-t pt-4">
                <div className="font-semibold text-gray-900 mb-1">
                  {review.name}
                </div>
                <div className="text-gray-500 text-sm">
                  {review.location}
                </div>
              </div>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};

export default ReviewsGrid;