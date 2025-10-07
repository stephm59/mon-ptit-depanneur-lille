import { Button } from "@/components/ui/button";
import { Phone } from "lucide-react";
import { ContactForm } from "@/components/forms/ContactForm";
import { useContactForm } from "@/hooks/useContactForm";

interface CtaBlockProps {
  title?: string;
  subtitle?: string;
  className?: string;
  id?: string;
}

export const CtaBlock = ({ 
  title = "Besoin d'une intervention ?", 
  subtitle = "Contactez-nous pour un devis gratuit et sans engagement",
  className = "",
  id
}: CtaBlockProps) => {
  const { isOpen, openForm, closeForm } = useContactForm();

  return (
    <>
      <section id={id} className={`py-12 bg-gradient-primary ${className}`}>
        <div className="container mx-auto px-6 text-center">
          <h2 className="text-3xl md:text-4xl font-bold text-white mb-4">
            {title}
          </h2>
          
          <p className="text-xl text-white/90 mb-8 max-w-3xl mx-auto">
            {subtitle}
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button size="lg" variant="secondary" onClick={openForm}>
              Recevoir un devis gratuit
            </Button>
            <Button size="lg" variant="phone">
              <Phone className="mr-2 h-5 w-5" />
              03 28 63 48 68
            </Button>
          </div>
        </div>
      </section>

      <ContactForm 
        isOpen={isOpen} 
        onClose={closeForm}
        title={title}
        description="Décrivez-nous votre projet et recevez un devis personnalisé et gratuit dans les plus brefs délais."
      />
    </>
  );
};