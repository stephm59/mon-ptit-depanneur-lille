import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Star, ChevronLeft, ChevronRight } from "lucide-react";
import { useServiceCityTestimonials } from "@/hooks/useServiceCityPage";
import { useState } from "react";

interface ServiceCityTestimonialsProps {
  serviceId: string;
  cityId: string;
}

export const ServiceCityTestimonials = ({ serviceId, cityId }: ServiceCityTestimonialsProps) => {
  const { data: testimonials, isLoading } = useServiceCityTestimonials(serviceId, cityId);
  const [currentIndex, setCurrentIndex] = useState(0);

  if (isLoading || !testimonials?.length) return null;

  const testimonialsPerView = 3;
  const maxIndex = Math.max(0, testimonials.length - testimonialsPerView);

  const nextSlide = () => {
    setCurrentIndex((prevIndex) => 
      prevIndex >= maxIndex ? 0 : prevIndex + 1
    );
  };

  const prevSlide = () => {
    setCurrentIndex((prevIndex) => 
      prevIndex === 0 ? maxIndex : prevIndex - 1
    );
  };

  const visibleTestimonials = testimonials.slice(currentIndex, currentIndex + testimonialsPerView);
  const totalSlides = Math.ceil(testimonials.length / testimonialsPerView);
  const currentSlide = Math.floor(currentIndex / testimonialsPerView);

  return (
    <section id="testimonials" className="py-20 bg-background">
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
          {testimonials.length > testimonialsPerView && (
            <>
              <Button
                variant="outline"
                size="icon"
                className="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-4 z-10 bg-background hover:bg-muted/50 border-border"
                onClick={prevSlide}
              >
                <ChevronLeft className="w-5 h-5" />
              </Button>
              
              <Button
                variant="outline"
                size="icon"
                className="absolute right-0 top-1/2 -translate-y-1/2 translate-x-4 z-10 bg-background hover:bg-muted/50 border-border"
                onClick={nextSlide}
              >
                <ChevronRight className="w-5 h-5" />
              </Button>
            </>
          )}

          {/* Testimonials Grid */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {visibleTestimonials.map((testimonial, index) => (
              <Card key={testimonial.id} id={`review-${currentIndex + index}`} className="p-8 bg-card border-border hover:shadow-lg transition-shadow">
                {/* Stars */}
                 <div className="flex gap-1 mb-6">
                   {Array.from({ length: 5 }, (_, i) => (
                     <Star key={i} className="w-5 h-5 fill-rating text-rating" />
                   ))}
                 </div>
                
                {/* Testimonial Text */}
                <blockquote className="text-foreground italic text-lg leading-relaxed mb-6">
                  "{testimonial.content}"
                </blockquote>
                
                {/* Author */}
                <div>
                  <div className="font-semibold text-foreground mb-1">
                    {testimonial.author_name}
                  </div>
                  {testimonial.location && (
                    <div className="text-muted-foreground text-sm">
                      {testimonial.location}
                    </div>
                  )}
                </div>
              </Card>
            ))}
          </div>

          {/* Dots Navigation */}
          {testimonials.length > testimonialsPerView && (
            <div className="flex justify-center gap-2 mt-8">
              {Array.from({ length: totalSlides }).map((_, index) => (
                <button
                  key={index}
                  className={`w-3 h-3 rounded-full transition-colors ${
                    index === currentSlide ? 'bg-primary' : 'bg-muted-foreground/30'
                  }`}
                  onClick={() => setCurrentIndex(index * testimonialsPerView)}
                />
              ))}
            </div>
          )}
        </div>
      </div>
    </section>
  );
};