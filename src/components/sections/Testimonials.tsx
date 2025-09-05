import { Star, ChevronLeft, ChevronRight } from "lucide-react";
import { useState } from "react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

const Testimonials = () => {
  const testimonials = [
    {
      text: "Intervention rapide et efficace pour une fuite d'eau. Technicien très professionnel et sympathique. Je recommande vivement !",
      name: "Sophie L.",
      location: "Lille",
      rating: 5
    },
    {
      text: "Excellent service pour le dépannage de ma chaudière. David est arrivé rapidement et a résolu le problème en moins d'une heure.",
      name: "Marc D.",
      location: "Roubaix",
      rating: 5
    },
    {
      text: "Très satisfait de l'installation de ma nouvelle pompe à chaleur. Travail soigné et équipe compétente.",
      name: "Catherine M.",
      location: "Tourcoing",
      rating: 5
    },
    {
      text: "Service de serrurerie impeccable ! Porte débloquée en quelques minutes, tarif honnête. Je recommande !",
      name: "Pierre J.",
      location: "Villeneuve-d'Ascq",
      rating: 5
    },
    {
      text: "Remplacement de ma vitre cassée fait avec soin. Intervention rapide et prix correct.",
      name: "Marie F.",
      location: "Wasquehal",
      rating: 5
    }
  ];

  const [currentIndex, setCurrentIndex] = useState(0);
  const testimonialsPerView = 3;

  const nextSlide = () => {
    setCurrentIndex((prevIndex) => 
      prevIndex + testimonialsPerView >= testimonials.length ? 0 : prevIndex + 1
    );
  };

  const prevSlide = () => {
    setCurrentIndex((prevIndex) => 
      prevIndex === 0 ? Math.max(0, testimonials.length - testimonialsPerView) : prevIndex - 1
    );
  };

  const visibleTestimonials = testimonials.slice(currentIndex, currentIndex + testimonialsPerView);
  const totalSlides = Math.ceil(testimonials.length / testimonialsPerView);
  const currentSlide = Math.floor(currentIndex / testimonialsPerView);

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Star className="w-8 h-8 text-primary fill-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Ce que disent nos clients
            </h2>
          </div>
          <p className="text-lg text-muted-foreground max-w-3xl mx-auto">
            Plus de 600 avis positifs sur Google témoignent de notre engagement envers la qualité et la satisfaction client.
          </p>
        </div>

        {/* Testimonials Carousel */}
        <div className="relative max-w-6xl mx-auto">
          {/* Navigation Arrows */}
          <Button
            variant="outline"
            size="icon"
            className="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-4 z-10 bg-white hover:bg-gray-50 border-gray-300"
            onClick={prevSlide}
            disabled={currentIndex === 0}
          >
            <ChevronLeft className="w-5 h-5" />
          </Button>
          
          <Button
            variant="outline"
            size="icon"
            className="absolute right-0 top-1/2 -translate-y-1/2 translate-x-4 z-10 bg-white hover:bg-gray-50 border-gray-300"
            onClick={nextSlide}
            disabled={currentIndex + testimonialsPerView >= testimonials.length}
          >
            <ChevronRight className="w-5 h-5" />
          </Button>

          {/* Testimonials Grid */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {visibleTestimonials.map((testimonial, index) => (
              <Card key={currentIndex + index} className="p-8 bg-white border border-gray-200 hover:shadow-lg transition-shadow">
                {/* Stars */}
                <div className="flex gap-1 mb-6">
                  {[...Array(5)].map((_, i) => (
                    <Star key={i} className="w-5 h-5 fill-rating text-rating" />
                  ))}
                </div>
                
                {/* Testimonial Text */}
                <blockquote className="text-gray-700 italic text-lg leading-relaxed mb-6">
                  "{testimonial.text}"
                </blockquote>
                
                {/* Author */}
                <div>
                  <div className="font-semibold text-gray-900 mb-1">
                    {testimonial.name}
                  </div>
                  <div className="text-gray-500 text-sm">
                    {testimonial.location}
                  </div>
                </div>
              </Card>
            ))}
          </div>

          {/* Dots Navigation */}
          <div className="flex justify-center gap-2 mt-8">
            {Array.from({ length: totalSlides }).map((_, index) => (
              <button
                key={index}
                className={`w-3 h-3 rounded-full transition-colors ${
                  index === currentSlide ? 'bg-primary' : 'bg-gray-300'
                }`}
                onClick={() => setCurrentIndex(index * testimonialsPerView)}
              />
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default Testimonials;