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
        className="fixed bottom-6 right-6 h-14 w-14 rounded-full bg-blue-600 hover:bg-blue-700 text-white shadow-lg hover:shadow-xl transition-all duration-300 z-[9999]"
        size="icon"
      >
        <MessageCircle className="h-6 w-6" />
        <div className="absolute -top-1 -right-1 bg-red-500 text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center">
          1
        </div>
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