import { Phone, Mail, MapPin } from "lucide-react";
import { useLegalModal } from "@/hooks/useLegalModal";
import { LegalModal } from "@/components/modals/LegalModal";

const Footer = () => {
  const { isOpen, openModal, closeModal } = useLegalModal();
  // Function to generate URL from service name that matches UniversalRouter patterns
  const generateServiceUrl = (serviceName: string) => {
    // Extract service type and city from the service name
    const lowerName = serviceName.toLowerCase();
    
    // Map service names to router patterns
    const serviceMapping: { [key: string]: string } = {
      'plombier': 'plombier',
      'chauffagiste': 'chauffagiste', 
      'vitrier': 'vitrier',
      'serrurier': 'serrurier',
      'pompe à chaleur': 'pompe-a-chaleur',
      'climatisation': 'climatisation',
      'rénovation salle de bains': 'renovation-salle-de-bains'
    };
    
    // Find the service type
    let serviceSlug = '';
    let cityPart = '';
    
    for (const [serviceName, slug] of Object.entries(serviceMapping)) {
      if (lowerName.startsWith(serviceName)) {
        serviceSlug = slug;
        cityPart = lowerName.substring(serviceName.length).trim();
        break;
      }
    }
    
    if (!serviceSlug) return '#'; // Fallback for unrecognized services
    
    // Clean up city name for URL
    const citySlug = cityPart
      .replace(/^(à|de|d'|du|des|le|la|les)\s+/g, '') // Remove articles
      .replace(/à /g, "a-")
      .replace(/é/g, "e")
      .replace(/è/g, "e")
      .replace(/ç/g, "c")
      .replace(/œ/g, "oe")
      .replace(/'/g, "-")
      .replace(/ /g, "-")
      .replace(/--+/g, "-")
      .replace(/^-+|-+$/g, ''); // Remove leading/trailing dashes
    
    return `/${serviceSlug}-${citySlug}`;
  };

  const services = {
    plomberie: [
      "Plombier Lille",
      "Plombier Vieux-Lille", 
      "Plombier Villeneuve-d'Ascq",
      "Plombier Marcq-en-Barœul",
      "Plombier Bondues",
      "Plombier La Madeleine",
      "Plombier Lambersart",
      "Plombier Saint-André-lez-Lille",
      "Plombier Lomme"
    ],
    chauffage: [
      "Chauffagiste Lille",
      "Chauffagiste Vieux-Lille",
      "Chauffagiste Villeneuve-d'Ascq", 
      "Chauffagiste Marcq-en-Barœul",
      "Chauffagiste Bondues",
      "Chauffagiste La Madeleine",
      "Chauffagiste Lambersart",
      "Chauffagiste Saint-André-lez-Lille",
      "Chauffagiste Lomme"
    ],
    pompeAChaleur: [
      "Pompe à chaleur Lille",
      "Pompe à chaleur Vieux-Lille",
      "Pompe à chaleur Villeneuve-d'Ascq",
      "Pompe à chaleur Marcq-en-Barœul", 
      "Pompe à chaleur Bondues",
      "Pompe à chaleur La Madeleine",
      "Pompe à chaleur Lambersart",
      "Pompe à chaleur Saint-André-lez-Lille",
      "Pompe à chaleur Lomme"
    ],
    climatisation: [
      "Climatisation Lille",
      "Climatisation Vieux-Lille",
      "Climatisation Villeneuve-d'Ascq",
      "Climatisation Marcq-en-Barœul",
      "Climatisation Bondues", 
      "Climatisation La Madeleine",
      "Climatisation Lambersart",
      "Climatisation Saint-André-lez-Lille",
      "Climatisation Lomme"
    ],
    salleDeBains: [
      "Rénovation salle de bains Lille",
      "Rénovation salle de bains Vieux-Lille",
      "Rénovation salle de bains Villeneuve-d'Ascq",
      "Rénovation salle de bains Marcq-en-Barœul",
      "Rénovation salle de bains Bondues",
      "Rénovation salle de bains La Madeleine", 
      "Rénovation salle de bains Lambersart",
      "Rénovation salle de bains Saint-André-lez-Lille"
    ],
    serrurerie: [
      "Serrurier Lille",
      "Serrurier Vieux-Lille",
      "Serrurier Villeneuve-d'Ascq",
      "Serrurier Marcq-en-Barœul",
      "Serrurier Bondues",
      "Serrurier La Madeleine",
      "Serrurier Lambersart",
      "Serrurier Saint-André-lez-Lille", 
      "Serrurier Lomme"
    ],
    vitrerie: [
      "Vitrier Lille",
      "Vitrier Vieux-Lille", 
      "Vitrier Villeneuve-d'Ascq",
      "Vitrier Marcq-en-Barœul",
      "Vitrier Bondues",
      "Vitrier La Madeleine",
      "Vitrier Lambersart",
      "Vitrier Saint-André-lez-Lille",
      "Vitrier Lomme"
    ]
  };

  return (
    <footer className="bg-black text-white py-16">
      <div className="container mx-auto px-4">
        {/* Top Section - 3 colonnes comme dans le modèle */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12 mb-16">
          {/* Company Info */}
          <div>
            <div className="flex items-center gap-4 mb-6">
              <img 
                src="https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/logo-mon-ptit-depanneur-contour-blanc.webp" 
                alt="Mon p'tit Dépanneur" 
                className="h-16 w-auto"
              />
            </div>
            <h3 className="text-2xl font-bold text-white mb-4">Mon p'tit Dépanneur</h3>
            <p className="text-gray-300 leading-relaxed">
              Votre artisan de confiance à Lille et ses environs pour tous vos travaux de 
              chauffage, plomberie, serrurerie et vitrerie.
            </p>
          </div>

          {/* Quick Access */}
          <div>
            <h4 className="text-xl font-bold text-white mb-6">Accès rapide</h4>
            <ul className="space-y-3">
              <li><a href="/contact" className="text-gray-300 hover:text-white transition-colors">Nous écrire</a></li>
              <li><a href="/entreprise" className="text-gray-300 hover:text-white transition-colors">Notre société</a></li>
              <li><a href="/carnet" className="text-gray-300 hover:text-white transition-colors">Nos bons conseils</a></li>
              <li><a href="/avis" className="text-gray-300 hover:text-white transition-colors">Avis et Photos</a></li>
              <li><button onClick={openModal} className="text-gray-300 hover:text-white transition-colors text-left">Mentions légales</button></li>
            </ul>
          </div>

          {/* Contact Info */}
          <div>
            <h4 className="text-xl font-bold text-white mb-6">Contact</h4>
            <div className="space-y-4">
              <a href="tel:0328534868" className="flex items-center gap-3 text-gray-300 hover:text-white transition-colors">
                <Phone className="w-5 h-5" />
                03 28 53 48 68
              </a>
              <a href="mailto:contact@monptitdepanneur.fr" className="flex items-center gap-3 text-gray-300 hover:text-white transition-colors">
                <Mail className="w-5 h-5" />
                contact@monptitdepanneur.fr
              </a>
              <div className="flex items-start gap-3 text-gray-300">
                <MapPin className="w-5 h-5 mt-1 flex-shrink-0" />
                <div>
                  21 Rue Edouard Delesalle,<br />
                  59000 Lille
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Services Grid - 2 lignes de 4 colonnes comme dans le modèle */}
        <div className="space-y-12 mb-16">
          {/* Première ligne : Plomberie, Chauffage, Pompe à chaleur, Climatisation */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {/* Plomberie */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Plomberie</h4>
              <ul className="space-y-2">
                {services.plomberie.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Chauffage */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Chauffage</h4>
              <ul className="space-y-2">
                {services.chauffage.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Pompe à chaleur */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Pompe à chaleur</h4>
              <ul className="space-y-2">
                {services.pompeAChaleur.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Climatisation */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Climatisation</h4>
              <ul className="space-y-2">
                {services.climatisation.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Deuxième ligne : Salle de bains, Serrurier, Vitre */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {/* Salle de bains */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Salle de bains</h4>
              <ul className="space-y-2">
                {services.salleDeBains.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Serrurier */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Serrurier</h4>
              <ul className="space-y-2">
                {services.serrurerie.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Vitre */}
            <div>
              <h4 className="text-lg font-bold text-white mb-4">Vitre</h4>
              <ul className="space-y-2">
                {services.vitrerie.map((service, index) => (
                  <li key={index}>
                    <a href={generateServiceUrl(service)} className="text-gray-400 hover:text-white transition-colors text-sm">
                      {service}
                    </a>
                  </li>
                ))}
              </ul>
            </div>

            {/* Colonne vide */}
            <div></div>
          </div>
        </div>

        {/* Bottom Border */}
        <div className="border-t border-gray-800 pt-8 text-center">
          <p className="text-gray-400 text-sm">
            © 2024 Mon p'tit Dépanneur - Tous droits réservés
          </p>
        </div>
      </div>
      
      <LegalModal isOpen={isOpen} onClose={closeModal} />
    </footer>
  );
};

export default Footer;