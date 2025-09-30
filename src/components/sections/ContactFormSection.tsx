import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import emailjs from "@emailjs/browser";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
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
import { Phone, Mail, Upload, Send, MessageSquare } from "lucide-react";
import { useToast } from "@/hooks/use-toast";

const contactFormSchema = z.object({
  firstName: z.string().min(2, "Le prénom doit contenir au moins 2 caractères"),
  lastName: z.string().min(2, "Le nom doit contenir au moins 2 caractères"),
  email: z.string().email("Veuillez saisir une adresse email valide"),
  phone: z.string().min(10, "Veuillez saisir un numéro de téléphone valide"),
  message: z.string().min(10, "Votre message doit contenir au moins 10 caractères"),
  file: z.instanceof(File).optional(),
});

type ContactFormValues = z.infer<typeof contactFormSchema>;

const ContactFormSection = () => {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const { toast } = useToast();
  
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

  const onSubmit = async (values: ContactFormValues) => {
    setIsSubmitting(true);
    
    try {
      const templateParams = {
        from_name: `${values.firstName} ${values.lastName}`,
        from_email: values.email,
        phone: values.phone,
        message: values.message,
        hasAttachment: values.file ? 'Oui (fichier joint non transmis par email)' : 'Non',
      };

      await emailjs.send(
        'service_5uollxl',
        'template_5n8krc1',
        templateParams
      );
      
      toast({
        title: "Message envoyé avec succès !",
        description: "Nous vous recontacterons dans les plus brefs délais.",
      });
      
      form.reset();
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

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      // Vérifier la taille du fichier (max 10MB)
      if (file.size > 10 * 1024 * 1024) {
        toast({
          title: "Fichier trop volumineux",
          description: "Le fichier ne doit pas dépasser 10 MB.",
          variant: "destructive",
        });
        return;
      }
      form.setValue("file", file);
    }
  };

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-4">
            <MessageSquare className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Contactez-nous
            </h2>
          </div>
          <p className="text-lg text-muted-foreground max-w-3xl mx-auto">
            Une question, un projet ou une urgence ? Remplissez le formulaire ci-dessous 
            et nous vous recontacterons rapidement pour vous proposer la meilleure solution.
          </p>
        </div>

        {/* Form */}
        <div className="max-w-4xl mx-auto">
          <Card className="shadow-lg">
            <CardContent className="p-8">
              <Form {...form}>
                <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
                  {/* Prénom et Nom */}
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <FormField
                      control={form.control}
                      name="firstName"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel className="text-foreground font-medium">Prénom *</FormLabel>
                          <FormControl>
                            <Input 
                              placeholder="Votre prénom" 
                              className="bg-background border-input focus:border-primary focus:ring-primary h-12"
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
                              placeholder="Votre nom" 
                              className="bg-background border-input focus:border-primary focus:ring-primary h-12"
                              {...field} 
                            />
                          </FormControl>
                          <FormMessage />
                        </FormItem>
                      )}
                    />
                  </div>

                  {/* Email et Téléphone */}
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <FormField
                      control={form.control}
                      name="email"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel className="text-foreground font-medium flex items-center gap-2">
                            <Mail className="w-4 h-4" />
                            Email *
                          </FormLabel>
                          <FormControl>
                            <Input 
                              type="email" 
                              placeholder="votre@email.com" 
                              className="bg-background border-input focus:border-primary focus:ring-primary h-12"
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
                          <FormLabel className="text-foreground font-medium flex items-center gap-2">
                            <Phone className="w-4 h-4" />
                            Téléphone *
                          </FormLabel>
                          <FormControl>
                            <Input 
                              type="tel" 
                              placeholder="06 12 34 56 78" 
                              className="bg-background border-input focus:border-primary focus:ring-primary h-12"
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
                            placeholder="Décrivez votre projet, le type d'intervention souhaité, vos besoins spécifiques..."
                            className="bg-background border-input focus:border-primary focus:ring-primary min-h-[120px] resize-none"
                            {...field} 
                          />
                        </FormControl>
                        <FormMessage />
                      </FormItem>
                    )}
                  />

                  {/* Upload de fichier */}
                  <div className="space-y-3">
                    <label className="text-sm font-medium text-foreground flex items-center gap-2">
                      <Upload className="w-4 h-4" />
                      Pièce jointe (optionnel)
                    </label>
                    <div className="border-2 border-dashed border-input rounded-lg p-6 hover:border-primary/50 transition-colors">
                      <input
                        type="file"
                        accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
                        onChange={handleFileChange}
                        className="w-full text-sm text-muted-foreground file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:bg-secondary file:text-foreground hover:file:bg-secondary/80"
                      />
                      <p className="text-xs text-muted-foreground mt-2">
                        Formats acceptés : PDF, DOC, DOCX, JPG, PNG (max. 10 MB)
                      </p>
                    </div>
                  </div>

                  {/* Bouton submit */}
                  <div className="pt-4">
                    <Button 
                      type="submit" 
                      size="lg"
                      className="w-full md:w-auto bg-accent hover:bg-accent/90 text-accent-foreground"
                      disabled={isSubmitting}
                    >
                      {isSubmitting ? (
                        "Envoi en cours..."
                      ) : (
                        <>
                          <Send className="w-5 h-5 mr-2" />
                          Envoyer le message
                        </>
                      )}
                    </Button>
                  </div>
                </form>
              </Form>
            </CardContent>
          </Card>
        </div>
      </div>
    </section>
  );
};

export default ContactFormSection;