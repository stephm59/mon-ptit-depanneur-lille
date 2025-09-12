import React from 'react';
import { Helmet } from 'react-helmet';
import Header from '@/components/layout/Header';
import Footer from '@/components/layout/Footer';
import ContactForm from '@/components/forms/ContactForm';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Phone, Mail, MapPin, Clock, MessageCircle } from 'lucide-react';
import { useContactForm } from '@/hooks/useContactForm';

const Contact = () => {
  console.log("=== CONTACT PAGE - LOADED SUCCESSFULLY ===");
  
  const { isOpen, openForm, closeForm } = useContactForm();
  
  return (
    <>
      <Helmet>
        <title>Contact - Mon p'tit Dépanneur | Chauffagiste, Plombier, Serrurier Lille</title>
        <meta name="description" content="Contactez Mon p'tit Dépanneur pour tous vos besoins en plomberie, chauffage et serrurerie à Lille. Devis gratuit, intervention rapide." />
      </Helmet>

      <Header />
      
      <main className="min-h-screen bg-background pt-20">
        {/* Hero Section */}
        <section className="py-16 bg-gradient-primary text-white">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto text-center">
              <h1 className="text-4xl md:text-6xl font-bold mb-6">
                Contactez-nous
              </h1>
              <p className="text-xl md:text-2xl text-white/90 mb-8">
                Une urgence ? Un devis ? Nous sommes là pour vous aider
              </p>
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <Button 
                  size="lg" 
                  variant="secondary"
                  className="text-lg px-8 py-4"
                  onClick={openForm}
                >
                  <MessageCircle className="w-5 h-5 mr-2" />
                  Demander un devis gratuit
                </Button>
                <Button 
                  size="lg" 
                  className="bg-urgent hover:bg-urgent-hover text-lg px-8 py-4"
                  asChild
                >
                  <a href="tel:0328534868">
                    <Phone className="w-5 h-5 mr-2" />
                    03 28 53 48 68
                  </a>
                </Button>
              </div>
            </div>
          </div>
        </section>

        {/* Contact Information */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
              {/* Contact Direct */}
              <Card className="text-center">
                <CardHeader>
                  <Phone className="w-12 h-12 text-urgent mx-auto mb-4" />
                  <CardTitle>Urgences 24h/24</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-2xl font-bold text-urgent mb-2">03 28 53 48 68</p>
                  <p className="text-muted-foreground">
                    Intervention rapide pour toutes vos urgences
                  </p>
                </CardContent>
              </Card>

              {/* Email */}
              <Card className="text-center">
                <CardHeader>
                  <Mail className="w-12 h-12 text-primary mx-auto mb-4" />
                  <CardTitle>Email</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-lg font-semibold mb-2">contact@monptitdepanneur.fr</p>
                  <p className="text-muted-foreground">
                    Pour vos devis et demandes d'informations
                  </p>
                </CardContent>
              </Card>

              {/* Adresse */}
              <Card className="text-center md:col-span-2 lg:col-span-1">
                <CardHeader>
                  <MapPin className="w-12 h-12 text-accent mx-auto mb-4" />
                  <CardTitle>Zone d'intervention</CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-lg font-semibold mb-2">Lille et métropole</p>
                  <p className="text-muted-foreground">
                    Nous intervenons dans un rayon de 30km autour de Lille
                  </p>
                </CardContent>
              </Card>
            </div>
          </div>
        </section>

        {/* Horaires */}
        <section className="py-16 bg-muted">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <div className="text-center mb-12">
                <Clock className="w-16 h-16 text-primary mx-auto mb-6" />
                <h2 className="text-3xl font-bold mb-4">Nos horaires</h2>
                <p className="text-xl text-muted-foreground">
                  Service client et interventions
                </p>
              </div>

              <div className="grid md:grid-cols-2 gap-8">
                <Card>
                  <CardHeader>
                    <CardTitle className="text-center">Service Client</CardTitle>
                  </CardHeader>
                  <CardContent className="space-y-4">
                    <div className="flex justify-between">
                      <span>Lundi - Vendredi</span>
                      <span className="font-semibold">8h00 - 18h00</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Samedi</span>
                      <span className="font-semibold">8h00 - 12h00</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Dimanche</span>
                      <span className="font-semibold">Fermé</span>
                    </div>
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader>
                    <CardTitle className="text-center">Urgences</CardTitle>
                  </CardHeader>
                  <CardContent className="space-y-4">
                    <div className="text-center">
                      <p className="text-2xl font-bold text-urgent mb-2">24h/24 - 7j/7</p>
                      <p className="text-muted-foreground">
                        Fuite d'eau, panne de chauffage, porte claquée
                      </p>
                    </div>
                    <Button 
                      className="w-full bg-urgent hover:bg-urgent-hover"
                      size="lg"
                      asChild
                    >
                      <a href="tel:0328534868">
                        <Phone className="w-5 h-5 mr-2" />
                        Appeler maintenant
                      </a>
                    </Button>
                  </CardContent>
                </Card>
              </div>
            </div>
          </div>
        </section>

        {/* Call to Action */}
        <section className="py-16 bg-primary text-white">
          <div className="container mx-auto px-4 text-center">
            <h2 className="text-3xl font-bold mb-6">
              Prêt à résoudre votre problème ?
            </h2>
            <p className="text-xl mb-8 opacity-90">
              Demandez votre devis gratuit en 2 minutes
            </p>
            <Button 
              size="lg"
              variant="secondary"
              className="text-lg px-8 py-4"
              onClick={openForm}
            >
              <MessageCircle className="w-5 h-5 mr-2" />
              Obtenir mon devis gratuit
            </Button>
          </div>
        </section>
      </main>

      <Footer />
      
      <ContactForm 
        isOpen={isOpen}
        onClose={closeForm}
        title="Demande de devis"
        description="Décrivez-nous votre besoin et nous vous recontactons rapidement avec un devis personnalisé."
      />
    </>
  );
};

export default Contact;