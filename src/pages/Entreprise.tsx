import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import Hero from "@/components/sections/Hero";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Phone, MapPin, Users, Award, Clock, Shield, Check, Star, Quote } from "lucide-react";

const Entreprise = () => {
  const services = [
    {
      emoji: "🔥",
      title: "Chauffage",
      description: "installation, entretien et dépannage de chaudières"
    },
    {
      emoji: "🛠",
      title: "Serrurerie", 
      description: "ouverture de porte, remplacement de barillet, sécurisation"
    },
    {
      emoji: "🚰",
      title: "Plomberie",
      description: "installation de cumulus, réparation de fuites, entretien réseaux"
    },
    {
      emoji: "🪟",
      title: "Vitrerie",
      description: "remplacement de vitres cassées, interventions rapides"
    }
  ];

  const localValues = [
    { icon: "📍", text: "Basée à Lille, au cœur de la métropole" },
    { icon: "🤝", text: "Agréée par 20 compagnies d'assurances (Macif, Maaf, Gan…)" },
    { icon: "👷", text: "12 artisans qualifiés formés aux dernières normes" },
    { icon: "⚡", text: "Intervention rapide sous 30 km autour de Lille" }
  ];

  const values = [
    { icon: Check, title: "Réactivité", description: "un appel → une intervention planifiée rapidement" },
    { icon: Check, title: "Qualité", description: "des artisans certifiés, des équipements fiables" },
    { icon: Check, title: "Transparence", description: "devis clairs, pas de surprise sur la facture" },
    { icon: Check, title: "Proximité", description: "une équipe à taille humaine, à l'écoute de ses clients" }
  ];

  const certifications = [
    "RGE (Reconnu Garant de l'Environnement)",
    "Qualibat et QualiPAC", 
    "Professionnel du Gaz (PG)"
  ];

  const testimonials = [
    {
      rating: 5,
      text: "Dépannage rapide sur ma chaudière en plein hiver. Merci à l'équipe !",
      author: "Claire",
      location: "Marcq-en-Barœul"
    },
    {
      rating: 5,
      text: "Serrurier pro et sympa, ma porte a été ouverte en moins de 20 minutes.",
      author: "Julien", 
      location: "Lambersart"
    }
  ];

  const engagements = [
    "Intervention 7j/7 sur rendez-vous ou en urgence",
    "Devis gratuits et détaillés",
    "Garantie sur chaque intervention",
    "Service après-vente assuré"
  ];

  return (
    <>
      <Helmet>
        <title>Mon p'tit Dépanneur : une équipe d'artisans à votre service depuis 20 ans</title>
        <meta name="description" content="Découvrez Mon p'tit Dépanneur, créée il y a plus de 20 ans par David Vanmarcke. 12 experts qualifiés interviennent à Lille pour vos urgences plomberie, chauffage, serrurerie et vitrerie." />
        <link rel="canonical" href="https://monptitdepanneur.fr/entreprise" />
      </Helmet>

      <Header />
      
      {/* Hero section with reassurance cards */}
      <Hero />
      
      <main className="bg-gray-50 pt-28">
        {/* Main title */}
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto text-center">
              <h1 className="text-4xl md:text-5xl font-bold mb-8 text-primary">
                Mon p'tit Dépanneur : une équipe d'artisans à votre service depuis 20 ans
              </h1>
            </div>
          </div>
        </section>

        {/* Company story */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <p className="text-lg text-gray-700 leading-relaxed mb-8">
                Créée il y a plus de 20 ans par <strong>David Vanmarcke</strong>, la société Mon p'tit Dépanneur est devenue une référence à Lille et dans la métropole.
                Avec une équipe de <strong>12 experts qualifiés</strong>, nous intervenons chaque jour pour résoudre vos urgences et vos projets dans 4 domaines :
              </p>

              {/* Services grid */}
              <div className="grid md:grid-cols-2 gap-6 mb-16">
                {services.map((service, index) => (
                  <Card key={index} className="p-6 bg-white border-l-4 border-l-primary hover:shadow-lg transition-shadow">
                    <div className="flex items-start gap-4">
                      <span className="text-2xl">{service.emoji}</span>
                      <div>
                        <h3 className="text-xl font-semibold text-primary mb-2">{service.title}</h3>
                        <p className="text-gray-600">{service.description}</p>
                      </div>
                    </div>
                  </Card>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Local company section */}
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-primary">Une entreprise locale et reconnue</h2>
              <div className="grid md:grid-cols-2 gap-6">
                {localValues.map((item, index) => (
                  <div key={index} className="flex items-start gap-3 p-4 bg-gray-50 rounded-lg">
                    <span className="text-xl flex-shrink-0">{item.icon}</span>
                    <p className="text-gray-700">{item.text}</p>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Values section */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-primary">Nos valeurs</h2>
              <div className="grid md:grid-cols-2 gap-6">
                {values.map((value, index) => (
                  <div key={index} className="flex items-start gap-4 p-6 bg-white rounded-lg shadow-sm">
                    <Check className="w-6 h-6 text-success flex-shrink-0 mt-1" />
                    <div>
                      <h3 className="text-xl font-semibold mb-2">{value.title}</h3>
                      <p className="text-gray-600">{value.description}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Certifications */}
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-primary">Labels et certifications</h2>
              <p className="text-lg text-gray-700 mb-6">Nous travaillons avec des artisans certifiés :</p>
              
              <div className="space-y-4 mb-8">
                {certifications.map((cert, index) => (
                  <div key={index} className="flex items-center gap-3 p-4 bg-gray-50 rounded-lg">
                    <Award className="w-6 h-6 text-accent flex-shrink-0" />
                    <span className="font-medium text-gray-800">{cert}</span>
                  </div>
                ))}
              </div>

              <div className="bg-accent/10 p-6 rounded-lg border-l-4 border-l-accent">
                <p className="text-gray-700">
                  <strong>👉 Ces certifications</strong> garantissent des travaux réalisés dans les règles de l'art et ouvrent droit aux aides financières (MaPrimeRénov', CEE).
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* Testimonial from manager */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-primary">Témoignage du gérant</h2>
              <Card className="p-8 bg-white relative">
                <Quote className="w-12 h-12 text-primary/20 absolute top-4 left-4" />
                <blockquote className="text-xl italic text-gray-700 mb-6 pl-8">
                  « Être artisan, c'est donner le meilleur de soi-même pour satisfaire ses clients. »
                </blockquote>
                <cite className="text-primary font-semibold">
                  David Vanmarcke — Gérant de Mon p'tit Dépanneur
                </cite>
              </Card>
            </div>
          </div>
        </section>

        {/* Client commitments */}
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-primary">Nos engagements clients</h2>
              <div className="grid md:grid-cols-2 gap-4">
                {engagements.map((engagement, index) => (
                  <div key={index} className="flex items-center gap-3 p-4 bg-gray-50 rounded-lg">
                    <Check className="w-5 h-5 text-success flex-shrink-0" />
                    <span className="text-gray-700">{engagement}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Client testimonials */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-primary">Avis clients</h2>
              <div className="grid md:grid-cols-2 gap-8">
                {testimonials.map((testimonial, index) => (
                  <Card key={index} className="p-6 bg-white">
                    <div className="flex items-center gap-1 mb-4">
                      {[...Array(testimonial.rating)].map((_, i) => (
                        <Star key={i} className="w-5 h-5 fill-rating text-rating" />
                      ))}
                    </div>
                    <blockquote className="text-gray-700 mb-4 italic">
                      « {testimonial.text} »
                    </blockquote>
                    <cite className="text-sm text-gray-600">
                      {testimonial.author}, {testimonial.location}
                    </cite>
                  </Card>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Final CTA */}
        <section className="py-16 bg-primary text-white">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto text-center">
              <h2 className="text-3xl font-bold mb-6">Besoin d'un artisan de confiance ?</h2>
              <p className="text-xl mb-8">
                👉 Contactez Mon p'tit Dépanneur au <strong>03 28 53 48 68</strong> ou via notre formulaire de contact
              </p>
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <Button asChild size="lg" variant="secondary" className="bg-white text-primary hover:bg-gray-100">
                  <a href="/contact">
                    Formulaire de contact
                  </a>
                </Button>
                <Button asChild size="lg" variant="outline" className="border-white text-white hover:bg-white/10">
                  <a href="tel:0328534868">
                    <Phone className="w-5 h-5 mr-2" />
                    03 28 53 48 68
                  </a>
                </Button>
              </div>
            </div>
          </div>
        </section>

        {/* Map section */}
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <div className="max-w-6xl mx-auto">
              <h2 className="text-3xl font-bold mb-8 text-center text-primary">Notre zone d'intervention</h2>
              <div className="bg-gray-100 rounded-lg overflow-hidden shadow-lg">
                <iframe
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2531.1234567890!2d3.0586!3d50.6365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47c2d579b103b1a1%3A0x123456789abcdef!2s21%20Rue%20Edouard%20Delesalle%2C%2059000%20Lille%2C%20France!5e0!3m2!1sfr!2sfr!4v1234567890"
                  width="100%"
                  height="400"
                  style={{ border: 0 }}
                  allowFullScreen={true}
                  loading="lazy"
                  referrerPolicy="no-referrer-when-downgrade"
                  title="Localisation Mon p'tit Dépanneur"
                ></iframe>
              </div>
              <div className="mt-6 text-center">
                <div className="flex items-center justify-center gap-2 text-gray-600">
                  <MapPin className="w-5 h-5" />
                  <span>21 Rue Edouard Delesalle, 59000 Lille</span>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
      
      <Footer />
    </>
  );
};

export default Entreprise;