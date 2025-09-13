import { Star } from "lucide-react";
import { Card } from "@/components/ui/card";
import { useGenericTestimonials } from "@/hooks/useServiceCityPage";

const Testimonials = () => {
  const { data: testimonials, isLoading } = useGenericTestimonials();

  if (isLoading || !testimonials?.length) return null;

  return (
    <section className="py-20 bg-gray-50">
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

        {/* Testimonials Grid - 6 avis génériques */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto">
          {testimonials.map((testimonial) => (
            <Card key={testimonial.id} className="p-8 bg-white border border-gray-200 hover:shadow-lg transition-shadow">
              {/* Service Badge */}
              <div className="inline-block px-3 py-1 bg-primary/10 text-primary text-sm font-medium rounded-full mb-4">
                {testimonial.services?.name || 'Service'}
              </div>

              {/* Stars */}
              <div className="flex gap-1 mb-6">
                {Array.from({ length: 5 }, (_, i) => (
                  <Star key={i} className="w-5 h-5 fill-rating text-rating" />
                ))}
              </div>
              
              {/* Testimonial Text */}
              <blockquote className="text-gray-700 italic text-lg leading-relaxed mb-6">
                "{testimonial.content}"
              </blockquote>
              
              {/* Author */}
              <div>
                <div className="font-semibold text-gray-900 mb-1">
                  {testimonial.author_name}
                </div>
                <div className="text-gray-500 text-sm">
                  {testimonial.location || testimonial.cities?.name || 'Région lilloise'}
                </div>
              </div>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Testimonials;