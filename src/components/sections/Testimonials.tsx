import { Star } from "lucide-react";
import { Card } from "@/components/ui/card";
import { useGenericTestimonials } from "@/hooks/useServiceCityPage";
import { Carousel, CarouselContent, CarouselItem, CarouselNext, CarouselPrevious } from "@/components/ui/carousel";

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

        {/* Testimonials Carousel */}
        <div className="max-w-6xl mx-auto">
          <Carousel className="w-full">
            <CarouselContent className="-ml-2 md:-ml-4">
              {testimonials.map((testimonial) => (
                <CarouselItem key={testimonial.id} className="pl-2 md:pl-4 md:basis-1/2 lg:basis-1/3">
                  <Card className="p-8 bg-white border border-gray-200 hover:shadow-lg transition-shadow h-full">
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
                    <blockquote className="text-gray-700 italic text-lg leading-relaxed mb-6 flex-1">
                      "{testimonial.content}"
                    </blockquote>
                    
                    {/* Author */}
                    <div>
                      <div className="font-semibold text-gray-900 mb-1">
                        {(() => {
                          const nameParts = testimonial.author_name.split(' ');
                          const firstName = nameParts[0];
                          const lastNameInitial = nameParts[1] ? `${nameParts[1].charAt(0)}.` : '';
                          return `${firstName} ${lastNameInitial}`;
                        })()}
                      </div>
                      <div className="text-gray-500 text-sm">
                        {testimonial.location || testimonial.cities?.name || 'Région lilloise'}
                      </div>
                    </div>
                  </Card>
                </CarouselItem>
              ))}
            </CarouselContent>
            <CarouselPrevious className="left-0" />
            <CarouselNext className="right-0" />
          </Carousel>
        </div>
      </div>
    </section>
  );
};

export default Testimonials;