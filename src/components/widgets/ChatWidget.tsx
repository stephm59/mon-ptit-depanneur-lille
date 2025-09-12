import { MessageCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { ContactForm } from "@/components/forms/ContactForm";
import { useContactForm } from "@/hooks/useContactForm";

export const ChatWidget = () => {
  const { isOpen, openForm, closeForm } = useContactForm();

  return (
    <>
      <Button
        onClick={openForm}
        className="fixed bottom-6 right-6 h-14 w-14 rounded-full bg-accent hover:bg-accent/90 text-accent-foreground shadow-lg hover:shadow-xl transition-all duration-300 z-40"
        size="icon"
      >
        <MessageCircle className="h-6 w-6" />
      </Button>

      <ContactForm
        isOpen={isOpen}
        onClose={closeForm}
        title="Besoin d'aide ?"
        description="Posez-nous votre question ou demandez un devis gratuit. Nous vous répondons rapidement !"
      />
    </>
  );
};