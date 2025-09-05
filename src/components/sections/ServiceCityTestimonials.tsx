import { Card, CardContent } from "@/components/ui/card";
import { Star } from "lucide-react";
import { useServiceCityTestimonials } from "@/hooks/useServiceCityPage";

interface ServiceCityTestimonialsProps {
  serviceId: string;
  cityId: string;
}

export const ServiceCityTestimonials = ({ serviceId, cityId }: ServiceCityTestimonialsProps) => {
  const { data: testimonials, isLoading } = useServiceCityTestimonials(serviceId, cityId);

  if (isLoading || !testimonials?.length) return null;

  return (
    <section className="py-16 bg-muted/30">
      <div className="container mx-auto px-6">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Témoignages clients
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Découvrez les avis de nos clients satisfaits
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {testimonials.slice(0, 6).map((testimonial) => (
            <Card key={testimonial.id} className="bg-card">
              <CardContent className="p-6">
                <div className="flex mb-4">
                  {Array.from({ length: testimonial.rating }, (_, i) => (
                    <Star
                      key={i}
                      className="h-5 w-5 fill-primary text-primary"
                    />
                  ))}
                </div>
                <blockquote className="text-foreground mb-4 leading-relaxed">
                  "{testimonial.content}"
                </blockquote>
                <div>
                  <cite className="font-semibold text-foreground not-italic">
                    {testimonial.author_name}
                  </cite>
                  {testimonial.location && (
                    <p className="text-sm text-muted-foreground">
                      {testimonial.location}
                    </p>
                  )}
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};