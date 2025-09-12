import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import Hero from "@/components/sections/Hero";
import Map from "@/components/Map";
import { Phone, Mail, MapPin, Send, Upload } from "lucide-react";
import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { useToast } from "@/hooks/use-toast";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";

const contactFormSchema = z.object({
  firstName: z.string().min(2, "Le prénom doit contenir au moins 2 caractères"),
  lastName: z.string().min(2, "Le nom doit contenir au moins 2 caractères"),
  email: z.string().email("Veuillez saisir une adresse email valide"),
  phone: z.string().min(10, "Veuillez saisir un numéro de téléphone valide"),
  message: z.string().min(10, "Votre message doit contenir au moins 10 caractères"),
  file: z.instanceof(File).optional(),
});

type ContactFormValues = z.infer<typeof contactFormSchema>;

const Contact = () => {
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
      // Simuler l'envoi du formulaire
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      toast({
        title: "Message envoyé avec succès !",
        description: "Nous vous recontacterons dans les plus brefs délais.",
      });
      
      form.reset();
    } catch (error) {
      toast({
        title: "Erreur",
        description: "Une erreur s'est produite. Veuillez réessayer.",
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
    <>
      <Helmet>
        <title>Contact - Devis gratuit - Mon p'tit Dépanneur Lille</title>
        <meta name="description" content="Contactez Mon p'tit Dépanneur pour un devis gratuit. Plombier, chauffagiste, serrurier, vitrier à Lille. Intervention rapide et professionnelle." />
        <meta name="keywords" content="contact plombier lille, devis gratuit chauffagiste, serrurier lille contact, vitrier lille devis" />
        <link rel="canonical" href="https://monptitdepanneur.fr/contact" />
      </Helmet>

      <Header />
      
      <Hero 
        title="Contactez-nous pour un devis gratuit"
        subtitle="Intervention rapide à Lille et ses environs"
      />
      
      <main className="min-h-screen bg-gray-50 py-32">
        <div className="container mx-auto px-4">
          <div className="max-w-6xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-16">
              {/* Contact Form */}
              <div className="bg-white p-8 rounded-lg shadow-lg">
                <h2 className="text-3xl font-bold mb-2 text-foreground flex items-center gap-2">
                  <Mail className="w-7 h-7 text-accent" />
                  Demander un devis
                </h2>
                <p className="text-muted-foreground mb-8">
                  Remplissez ce formulaire et nous vous recontacterons rapidement pour établir votre devis personnalisé et sans engagement.
                </p>

                <Form {...form}>
                  <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
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
                    <div className="space-y-2">
                      <label className="text-sm font-medium text-foreground flex items-center gap-1">
                        <Upload className="w-4 h-4" />
                        Pièce jointe (optionnel)
                      </label>
                      <div className="border-2 border-dashed border-input rounded-lg p-4 hover:border-primary/50 transition-colors">
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

                    {/* Bouton d'envoi */}
                    <Button 
                      type="submit" 
                      className="w-full bg-accent hover:bg-accent/90 text-accent-foreground text-lg py-3"
                      disabled={isSubmitting}
                    >
                      {isSubmitting ? (
                        "Envoi en cours..."
                      ) : (
                        <>
                          <Send className="w-5 h-5 mr-2" />
                          Envoyer ma demande
                        </>
                      )}
                    </Button>
                  </form>
                </Form>
              </div>

              {/* Contact Info */}
              <div className="space-y-8">
                <div className="bg-white p-8 rounded-lg shadow-lg">
                  <h2 className="text-3xl font-bold mb-8 text-foreground">Nos coordonnées</h2>
                  <div className="space-y-8">
                    <div className="flex items-center gap-4">
                      <div className="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center">
                        <Phone className="w-6 h-6 text-primary" />
                      </div>
                      <div>
                        <p className="font-semibold text-lg text-foreground">Téléphone</p>
                        <a href="tel:0328534868" className="text-primary hover:underline text-lg font-medium">
                          03 28 53 48 68
                        </a>
                        <p className="text-sm text-muted-foreground">Disponible 7j/7 pour les urgences</p>
                      </div>
                    </div>
                    
                    <div className="flex items-center gap-4">
                      <div className="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center">
                        <Mail className="w-6 h-6 text-primary" />
                      </div>
                      <div>
                        <p className="font-semibold text-lg text-foreground">Email</p>
                        <a href="mailto:contact@monptitdepanneur.fr" className="text-primary hover:underline text-lg font-medium">
                          contact@monptitdepanneur.fr
                        </a>
                        <p className="text-sm text-muted-foreground">Réponse sous 24h maximum</p>
                      </div>
                    </div>
                    
                    <div className="flex items-start gap-4">
                      <div className="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center">
                        <MapPin className="w-6 h-6 text-primary" />
                      </div>
                      <div>
                        <p className="font-semibold text-lg text-foreground">Adresse</p>
                        <p className="text-muted-foreground text-lg">
                          21 Rue Edouard Delesalle<br />
                          59000 Lille
                        </p>
                        <p className="text-sm text-muted-foreground mt-1">Zone d'intervention : Lille et environs</p>
                      </div>
                    </div>
                  </div>
                </div>

                {/* Horaires */}
                <div className="bg-white p-8 rounded-lg shadow-lg">
                  <h3 className="text-2xl font-bold mb-6 text-foreground">Horaires d'ouverture</h3>
                  <div className="space-y-3">
                    <div className="flex justify-between">
                      <span className="font-medium">Lundi - Vendredi</span>
                      <span className="text-muted-foreground">8h00 - 18h00</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Map Section */}
            <div className="mt-16">
              <h2 className="text-3xl font-bold mb-8 text-center text-foreground">Notre localisation</h2>
              <Map />
            </div>
          </div>
        </div>
      </main>
      
      <Footer />
    </>
  );
};

export default Contact;