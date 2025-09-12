import { useState } from "react";
import { Phone, Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const navigation = [
    { name: "Plombier", href: "/plombier-lille" },
    { name: "Chauffage", href: "/chauffagiste-lille" },
    { name: "Climatisation", href: "/climatisation-lille" },
    { name: "Pompe à chaleur", href: "/pompe-a-chaleur-lille" },
    { name: "Salle de bains", href: "/renovation-salle-de-bains-lille" },
    { name: "Serrurier", href: "/serrurier-lille" },
    { name: "Vitrier", href: "/vitrier-lille" },
  ];

  return (
    <header className="absolute top-0 inset-x-0 z-50 text-white">
      <div className="container mx-auto px-4">
        {/* Main navigation */}
        <div className="py-4">
          <div className="flex justify-between items-start">
            {/* Logo */}
            <div className="flex items-center">
              <img 
                src="https://res.cloudinary.com/dit7nfyiy/image/upload/v1755088306/logo-mon-ptit-depanneur-contour-blanc_la7i2t.webp" 
                alt="Mon p'tit Dépanneur" 
                className="h-40 md:h-40 w-auto"
                loading="eager"
                decoding="async"
              />
            </div>

            {/* Desktop Navigation */}
            <nav className="hidden lg:flex items-start space-x-6 pt-4">
              {navigation.map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  className="text-white/90 hover:text-accent transition-colors duration-200 font-medium"
                >
                  {item.name}
                </a>
              ))}
            </nav>

            {/* CTA Buttons */}
            <div className="flex items-start gap-4 pt-4">
              <div className="hidden sm:block">
                <Button variant="outline" size="sm" className="bg-black text-white border-black hover:bg-black/90 h-10">
                  Devis gratuit
                </Button>
              </div>
              <a 
                href="tel:0328634868" 
                className="inline-flex items-center gap-2 text-white bg-accent px-4 py-2 rounded-lg hover:bg-accent/90 transition-colors shadow-lg h-10"
                aria-label="Appeler Mon p'tit Dépanneur"
              >
                <Phone className="w-5 h-5" />
                03 28 63 48 68
              </a>

              {/* Mobile menu button */}
              <button
                className="lg:hidden p-2 text-white"
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
            <nav className="lg:hidden mt-4 pb-4 border-t border-white/20 pt-4 bg-black/60 backdrop-blur-md rounded-lg">
              <div className="flex flex-col space-y-3 px-4">
                {navigation.map((item) => (
                  <a
                    key={item.name}
                    href={item.href}
                    className="text-white/90 hover:text-accent transition-colors duration-200 font-medium py-2"
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