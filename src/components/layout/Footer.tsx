import { Phone, Mail, MapPin, Clock, Star, Facebook, Twitter, Instagram } from "lucide-react";
import { Button } from "@/components/ui/button";
import logo from "@/assets/logo-mon-ptit-depanneur.png";

const Footer = () => {
  const services = [
    { category: "Plomberie", items: ["Plombier Lille", "Plombier Villeneuve-d'Ascq", "Plombier Roubaix", "Plombier Tourcoing"] },
    { category: "Chauffage", items: ["Chauffagiste Lille", "Chauffagiste Villeneuve-d'Ascq", "Chauffagiste Roubaix"] },
    { category: "Climatisation", items: ["Climatisation Lille", "Climatisation Villeneuve-d'Ascq", "Climatisation Roubaix"] },
    { category: "Salle de bain", items: ["Rénovation salle de bain Lille", "Rénovation salle de bain Villeneuve-d'Ascq"] }
  ];

  return (
    <footer className="bg-primary text-primary-foreground">
      {/* Main footer content */}
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {/* Company info */}
          <div>
            <div className="flex items-center mb-6">
              <img src={logo} alt="Mon p'tit Dépanneur" className="h-10 w-auto mr-3" />
              <div>
                <h3 className="text-xl font-bold">Mon p'tit Dépanneur</h3>
                <p className="text-sm text-primary-foreground/80">Votre artisan de confiance</p>
              </div>
            </div>
            
            <p className="text-primary-foreground/90 mb-6 leading-relaxed">
              Votre artisan de confiance à Lille et ses environs pour tous vos travaux de 
              chauffage, plomberie, serrurerie et vitrerie.
            </p>

            {/* Social links */}
            <div className="flex space-x-4">
              <Button variant="ghost" size="icon" className="text-primary-foreground hover:text-accent">
                <Facebook className="w-5 h-5" />
              </Button>
              <Button variant="ghost" size="icon" className="text-primary-foreground hover:text-accent">
                <Twitter className="w-5 h-5" />
              </Button>
              <Button variant="ghost" size="icon" className="text-primary-foreground hover:text-accent">
                <Instagram className="w-5 h-5" />
              </Button>
            </div>
          </div>

          {/* Services grid */}
          {services.map((service, index) => (
            <div key={index}>
              <h4 className="text-lg font-semibold mb-4 text-accent">{service.category}</h4>
              <ul className="space-y-2">
                {service.items.map((item, itemIndex) => (
                  <li key={itemIndex}>
                    <a 
                      href="#" 
                      className="text-primary-foreground/80 hover:text-accent transition-colors duration-200 text-sm"
                    >
                      {item}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Contact section */}
        <div className="mt-12 pt-8 border-t border-primary-light/20">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Contact info */}
            <div>
              <h4 className="text-xl font-semibold mb-6 text-accent">Contact</h4>
              <div className="space-y-4">
                <div className="flex items-center">
                  <Phone className="w-5 h-5 mr-3 text-urgent" />
                  <div>
                    <p className="font-semibold">03 28 63 48 68</p>
                    <p className="text-sm text-primary-foreground/80">24h/24 - 7j/7</p>
                  </div>
                </div>
                
                <div className="flex items-center">
                  <Mail className="w-5 h-5 mr-3 text-accent" />
                  <div>
                    <p>contact@monptitdepanneur.fr</p>
                    <p className="text-sm text-primary-foreground/80">Réponse sous 24h</p>
                  </div>
                </div>
                
                <div className="flex items-center">
                  <MapPin className="w-5 h-5 mr-3 text-success" />
                  <div>
                    <p>21 Rue Édouard Delesalle</p>
                    <p className="text-sm text-primary-foreground/80">59000 Lille</p>
                  </div>
                </div>
                
                <div className="flex items-center">
                  <Clock className="w-5 h-5 mr-3 text-accent" />
                  <div>
                    <p>Lun-Ven: 8h-19h</p>
                    <p className="text-sm text-primary-foreground/80">Sam: 9h-17h - Urgences 24h/24</p>
                  </div>
                </div>
              </div>
            </div>

            {/* Quick contact */}
            <div>
              <h4 className="text-xl font-semibold mb-6 text-accent">Accès rapide</h4>
              <div className="space-y-4">
                <Button variant="urgent" size="lg" className="w-full">
                  <Phone className="w-5 h-5 mr-2" />
                  Appel d'urgence
                </Button>
                
                <Button variant="hero" size="lg" className="w-full">
                  Demander un devis
                </Button>

                {/* Rating display */}
                <div className="bg-primary-light/20 rounded-lg p-4 text-center">
                  <div className="flex justify-center mb-2">
                    {[...Array(5)].map((_, i) => (
                      <Star key={i} className="w-4 h-4 fill-accent text-accent" />
                    ))}
                  </div>
                  <p className="text-sm">
                    <span className="font-semibold">4.9/5</span> - Plus de 600 avis clients
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom bar */}
      <div className="border-t border-primary-light/20">
        <div className="container mx-auto px-4 py-4">
          <div className="flex flex-col md:flex-row justify-between items-center text-sm text-primary-foreground/80">
            <p>&copy; 2024 Mon p'tit Dépanneur. Tous droits réservés.</p>
            <div className="flex space-x-4 mt-2 md:mt-0">
              <a href="#" className="hover:text-accent transition-colors">Mentions légales</a>
              <a href="#" className="hover:text-accent transition-colors">CGV</a>
              <a href="#" className="hover:text-accent transition-colors">Politique de confidentialité</a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;