import { Star } from "lucide-react";
import { Card } from "@/components/ui/card";
import { useGenericTestimonials } from "@/hooks/useServiceCityPage";

const ReviewsGrid = () => {
  const { data: testimonials, isLoading } = useGenericTestimonials();

  if (isLoading || !testimonials?.length) return null;

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
          {testimonials.map((testimonial, index) => (
            <Card key={testimonial.id} className="p-6 bg-white border border-gray-200 hover:shadow-lg transition-shadow h-full">
              {/* Service Badge */}
              <div className="inline-block px-3 py-1 bg-primary/10 text-primary text-sm font-medium rounded-full mb-4">
                {testimonial.services?.name || 'Service'}
              </div>

              {/* Stars */}
              <div className="flex gap-1 mb-4">
                {Array.from({ length: 5 }, (_, i) => (
                  <Star key={i} className="w-4 h-4 fill-rating text-rating" />
                ))}
              </div>
              
              {/* Review Text */}
              <blockquote className="text-gray-700 leading-relaxed mb-4 flex-1">
                "{testimonial.content}"
              </blockquote>
              
              {/* Author */}
              <div className="border-t pt-4">
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

export default ReviewsGrid;