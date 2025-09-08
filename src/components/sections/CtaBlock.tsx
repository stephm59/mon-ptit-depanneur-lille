import { Button } from "@/components/ui/button";
import { Phone } from "lucide-react";

interface CtaBlockProps {
  title?: string;
  subtitle?: string;
  className?: string;
  id?: string;
  showMap?: boolean;
}

export const CtaBlock = ({ 
  title = "Besoin d'une intervention ?", 
  subtitle = "Contactez-nous pour un devis gratuit et sans engagement",
  className = "",
  id,
  showMap = false
}: CtaBlockProps) => {
  return (
    <section id={id} className={`py-12 bg-gradient-primary ${className}`}>
      <div className="container mx-auto px-6 text-center">
        <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
          {title}
        </h2>
        
        <p className="text-xl text-white/90 mb-8 max-w-3xl mx-auto">
          {subtitle}
        </p>

        <div className="flex flex-col sm:flex-row gap-4 justify-center mb-8">
          <Button size="lg" variant="secondary">
            Recevoir un devis gratuit
          </Button>
          <Button size="lg" variant="phone">
            <Phone className="mr-2 h-5 w-5" />
            03 28 63 48 68
          </Button>
        </div>

        {showMap && (
          <div className="max-w-4xl mx-auto mt-12">
            <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
              <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2530.7059302239863!2d3.0639534767775842!3d50.6325794742331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47c2d58f1a1b39a3%3A0xc50987d8e1d3f5d6!2sMon%20P&#39;tit%20D%C3%A9panneur!5e0!3m2!1sfr!2sfr!4v1757079283815!5m2!1sfr!2sfr"
                className="w-full h-64 md:h-80"
                style={{ border: 0 }}
                allowFullScreen={true}
                loading="lazy"
                referrerPolicy="no-referrer-when-downgrade"
                title="Zone d'intervention Mon p'tit Dépanneur - Lille et environs"
              />
            </div>
            
            {/* Contact Info Card */}
            <div className="mt-6 bg-white rounded-2xl shadow-lg p-6 text-center">
              <h3 className="text-lg font-bold text-foreground mb-3">
                Notre siège social
              </h3>
              <div className="text-muted-foreground text-sm">
                <p className="mb-1">Mon P'tit Dépanneur</p>
                <p className="mb-2">21 Rue Édouard Delesalle, 59000 Lille</p>
                <p className="font-semibold text-primary">📞 03 28 63 48 68</p>
              </div>
            </div>
          </div>
        )}
      </div>
    </section>
  );
};