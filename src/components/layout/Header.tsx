import { useState } from "react";
import { Phone, Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const navigation = [
    { name: "Plomberie", href: "/plomberie" },
    { name: "Chauffage", href: "/chauffage" },
    { name: "Climatisation", href: "/climatisation" },
    { name: "Pompe à chaleur", href: "/pompe-chaleur" },
    { name: "Salle de bain", href: "/salle-de-bain" },
    { name: "Serrure", href: "/serrure" },
    { name: "Vitre", href: "/vitre" },
  ];

  return (
    <header className="bg-primary text-primary-foreground shadow-elevated sticky top-0 z-50">
      <div className="container mx-auto px-4">
        {/* Main navigation */}
        <div className="py-4">
          <div className="flex justify-between items-center">
            {/* Logo */}
            <div className="flex items-center">
              <img 
                src="https://res.cloudinary.com/dit7nfyiy/image/upload/v1755088306/logo-mon-ptit-depanneur-contour-blanc_la7i2t.webp" 
                alt="Mon p'tit Dépanneur" 
                className="h-12 w-auto"
                loading="eager"
                decoding="async"
              />
            </div>

            {/* Desktop Navigation */}
            <nav className="hidden lg:flex items-center space-x-6">
              {navigation.map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  className="text-primary-foreground/90 hover:text-accent transition-colors duration-200 font-medium"
                >
                  {item.name}
                </a>
              ))}
            </nav>

            {/* CTA Buttons */}
            <div className="flex items-center gap-3">
              <div className="hidden sm:block">
                <Button variant="hero" size="sm">
                  Devis gratuit
                </Button>
              </div>
              <Button asChild variant="urgent" size="sm" className="font-bold" aria-label="Appeler Mon p'tit Dépanneur">
                <a href="tel:0328634868">
                  <Phone className="w-4 h-4" />
                  Appel d'urgence
                </a>
              </Button>

              {/* Mobile menu button */}
              <button
                className="lg:hidden p-2"
                onClick={() => setIsMenuOpen(!isMenuOpen)}
              >
                {isMenuOpen ? (
                  <X className="w-6 h-6" />
                ) : (
                  <Menu className="w-6 h-6" />
                )}
              </button>
            </div>
          </div>

          {/* Mobile Navigation */}
          {isMenuOpen && (
            <nav className="lg:hidden mt-4 pb-4 border-t border-primary-light/20 pt-4">
              <div className="flex flex-col space-y-3">
                {navigation.map((item) => (
                  <a
                    key={item.name}
                    href={item.href}
                    className="text-primary-foreground/90 hover:text-accent transition-colors duration-200 font-medium py-2"
                    onClick={() => setIsMenuOpen(false)}
                  >
                    {item.name}
                  </a>
                ))}
              </div>
            </nav>
          )}
        </div>
      </div>
    </header>
  );
};

export default Header;