import { useState, useRef } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import emailjs from "@emailjs/browser";
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Phone, Mail, Send } from "lucide-react";
import { useToast } from "@/hooks/use-toast";

const contactFormSchema = z.object({
  firstName: z.string().min(2, "Le prénom doit contenir au moins 2 caractères"),
  lastName: z.string().min(2, "Le nom doit contenir au moins 2 caractères"),
  email: z.string().email("Veuillez saisir une adresse email valide"),
  phone: z.string().min(10, "Veuillez saisir un numéro de téléphone valide"),
  message: z.string().min(10, "Votre message doit contenir au moins 10 caractères"),
});

type ContactFormValues = z.infer<typeof contactFormSchema>;

interface ContactFormProps {
  isOpen: boolean;
  onClose: () => void;
  title?: string;
  description?: string;
}

export const ContactForm = ({ 
  isOpen, 
  onClose, 
  title = "Demander un devis gratuit",
  description = "Remplissez ce formulaire et nous vous recontacterons dans les plus brefs délais pour établir votre devis personnalisé."
}: ContactFormProps) => {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const { toast } = useToast();
  const formRef = useRef<HTMLFormElement>(null);
  
  const form = useForm<ContactFormValues>({
    resolver: zodResolver(contactFormSchema),
    defaultValues: {
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      message: "",
    },
  });

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    
    try {
      if (!formRef.current) return;

      await emailjs.sendForm(
        'service_5uollxl',
        'template_5n8krc1',
        formRef.current
      );
      
      toast({
        title: "Demande envoyée avec succès !",
        description: "Nous vous recontacterons dans les plus brefs délais.",
      });
      
      form.reset();
      onClose();
    } catch (error) {
      console.error('EmailJS Error:', error);
      toast({
        title: "Erreur d'envoi",
        description: "Impossible d'envoyer votre message. Veuillez réessayer ou nous appeler directement.",
        variant: "destructive",
      });
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-[600px] max-h-[90vh] overflow-y-auto">
        <DialogHeader className="space-y-3">
          <DialogTitle className="text-2xl font-bold text-primary flex items-center gap-2">
            <Mail className="w-6 h-6 text-accent" />
            {title}
          </DialogTitle>
          <DialogDescription className="text-base text-muted-foreground">
            {description}
          </DialogDescription>
        </DialogHeader>

        <Form {...form}>
          <form ref={formRef} onSubmit={onSubmit} className="space-y-6 pt-4">
            {/* Prénom et Nom */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <FormField
                control={form.control}
                name="firstName"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-foreground font-medium">Prénom *</FormLabel>
                    <FormControl>
                      <Input 
                        name="firstName"
                        placeholder="Votre prénom" 
                        className="bg-background border-input focus:border-primary focus:ring-primary"
                        {...field} 
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
              
              <FormField
                control={form.control}
                name="lastName"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-foreground font-medium">Nom *</FormLabel>
                    <FormControl>
                      <Input 
                        name="lastName"
                        placeholder="Votre nom" 
                        className="bg-background border-input focus:border-primary focus:ring-primary"
                        {...field} 
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            {/* Email et Téléphone */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <FormField
                control={form.control}
                name="email"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-foreground font-medium flex items-center gap-1">
                      <Mail className="w-4 h-4" />
                      Email *
                    </FormLabel>
                    <FormControl>
                      <Input 
                        name="from_email"
                        type="email" 
                        placeholder="votre@email.com" 
                        className="bg-background border-input focus:border-primary focus:ring-primary"
                        {...field} 
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
              
              <FormField
                control={form.control}
                name="phone"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel className="text-foreground font-medium flex items-center gap-1">
                      <Phone className="w-4 h-4" />
                      Téléphone *
                    </FormLabel>
                    <FormControl>
                      <Input 
                        name="phone"
                        type="tel" 
                        placeholder="06 12 34 56 78" 
                        className="bg-background border-input focus:border-primary focus:ring-primary"
                        {...field} 
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            {/* Message */}
            <FormField
              control={form.control}
              name="message"
              render={({ field }) => (
                <FormItem>
                  <FormLabel className="text-foreground font-medium">Message *</FormLabel>
                  <FormControl>
                    <Textarea 
                      name="message"
                      placeholder="Décrivez votre projet, le type d'intervention souhaité, vos besoins spécifiques..."
                      className="bg-background border-input focus:border-primary focus:ring-primary min-h-[100px] resize-none"
                      {...field} 
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Boutons */}
            <div className="flex flex-col sm:flex-row gap-3 pt-4 border-t border-border">
              <Button 
                type="button" 
                variant="outline" 
                onClick={onClose}
                className="sm:flex-1"
                disabled={isSubmitting}
              >
                Annuler
              </Button>
              <Button 
                type="submit" 
                className="sm:flex-1 bg-accent hover:bg-accent/90 text-accent-foreground"
                disabled={isSubmitting}
              >
                {isSubmitting ? (
                  "Envoi en cours..."
                ) : (
                  <>
                    <Send className="w-4 h-4 mr-2" />
                    Envoyer ma demande
                  </>
                )}
              </Button>
            </div>
          </form>
        </Form>
      </DialogContent>
    </Dialog>
  );
};

export default ContactForm;