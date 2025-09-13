import { Link } from "react-router-dom";
import { ReactNode } from "react";

// Mots-clés pour les services et leurs liens correspondants
const SERVICE_KEYWORDS = {
  "plomberie": ["/plombier-lille", "/plombier-villeneuve-d-ascq", "/plombier-roubaix"],
  "plombier": ["/plombier-lille", "/plombier-villeneuve-d-ascq", "/plombier-roubaix"],
  "chauffage": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq", "/chauffage-roubaix"],
  "chauffagiste": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq", "/chauffage-roubaix"],
  "chaudière": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq"],
  "chaudières": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq"],
  "climatisation": ["/climatisation-lille", "/climatisation-villeneuve-d-ascq"],
  "pompe à chaleur": ["/pompe-a-chaleur-lille", "/pompe-a-chaleur-villeneuve-d-ascq"],
  "pompes à chaleur": ["/pompe-a-chaleur-lille", "/pompe-a-chaleur-villeneuve-d-ascq"],
  "serrurerie": ["/serrurier-lille", "/serrurier-villeneuve-d-ascq"],
  "serrurier": ["/serrurier-lille", "/serrurier-villeneuve-d-ascq"],
  "vitrerie": ["/vitrier-lille", "/vitrier-villeneuve-d-ascq"],
  "vitrier": ["/vitrier-lille", "/vitrier-villeneuve-d-ascq"],
  "fuite d'eau": ["/plombier-lille", "/plombier-villeneuve-d-ascq"],
  "fuites d'eau": ["/plombier-lille", "/plombier-villeneuve-d-ascq"],
  "débouchage": ["/plombier-lille", "/plombier-villeneuve-d-ascq"],
  "canalisation": ["/plombier-lille", "/plombier-villeneuve-d-ascq"],
  "canalisations": ["/plombier-lille", "/plombier-villeneuve-d-ascq"],
  "radiateur": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq"],
  "radiateurs": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq"],
  "chauffe-eau": ["/plombier-lille", "/chauffage-lille"],
  "ballon d'eau chaude": ["/plombier-lille", "/chauffage-lille"],
  "entretien chaudière": ["/chauffage-lille", "/chauffage-villeneuve-d-ascq"],
  "dépannage": ["/plombier-lille", "/chauffage-lille", "/serrurier-lille"],
  "réparation": ["/plombier-lille", "/chauffage-lille", "/vitrier-lille"],
  "installation": ["/plombier-lille", "/chauffage-lille", "/climatisation-lille"]
};

// Villes clés pour les liens géographiques
const CITY_KEYWORDS = {
  "lille": ["/plombier-lille", "/chauffage-lille", "/climatisation-lille"],
  "villeneuve-d'ascq": ["/plombier-villeneuve-d-ascq", "/chauffage-villeneuve-d-ascq"],
  "villeneuve d'ascq": ["/plombier-villeneuve-d-ascq", "/chauffage-villeneuve-d-ascq"],
  "roubaix": ["/plombier-roubaix", "/chauffage-roubaix"],
  "tourcoing": ["/plombier-tourcoing", "/chauffage-tourcoing"],
  "valenciennes": ["/plombier-valenciennes", "/chauffage-valenciennes"]
};

interface InternalLinkEnhancerProps {
  content: string;
  currentSlug?: string;
}

export const InternalLinkEnhancer = ({ content, currentSlug }: InternalLinkEnhancerProps) => {
  // Fonction pour convertir le texte en liens internes
  const enhanceWithInternalLinks = (text: string): ReactNode => {
    let processedText = text;
    const linksAdded = new Set<string>(); // Pour éviter de dupliquer les liens sur la même page

    // Remplacer les mots-clés par des liens (maximum 3 liens par article pour éviter le sur-linkage)
    let linkCount = 0;
    const maxLinks = 3;

    // Combiner tous les mots-clés
    const allKeywords = { ...SERVICE_KEYWORDS, ...CITY_KEYWORDS };

    // Trier les mots-clés par longueur décroissante pour éviter les conflits
    const sortedKeywords = Object.keys(allKeywords).sort((a, b) => b.length - a.length);

    for (const keyword of sortedKeywords) {
      if (linkCount >= maxLinks) break;

      const regex = new RegExp(`\\b${keyword.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}\\b`, 'gi');
      const possibleLinks = allKeywords[keyword];
      
      if (processedText.match(regex) && possibleLinks.length > 0) {
        // Choisir le premier lien qui n'est pas la page courante
        const targetLink = possibleLinks.find(link => {
          const linkSlug = link.substring(1); // Enlever le /
          return linkSlug !== currentSlug && !linksAdded.has(link);
        });

        if (targetLink) {
          const linkElement = `<internal-link href="${targetLink}">${keyword}</internal-link>`;
          processedText = processedText.replace(regex, linkElement);
          linksAdded.add(targetLink);
          linkCount++;
        }
      }
    }

    // Convertir les balises internes en composants Link React
    const parts = processedText.split(/(<internal-link[^>]*>.*?<\/internal-link>)/);
    
    return parts.map((part, index) => {
      const linkMatch = part.match(/<internal-link href="([^"]*)">(.*?)<\/internal-link>/);
      
      if (linkMatch) {
        const [, href, text] = linkMatch;
        return (
          <Link 
            key={index} 
            to={href} 
            className="text-primary hover:underline font-medium"
          >
            {text}
          </Link>
        );
      }
      
      return part;
    });
  };

  return <>{enhanceWithInternalLinks(content)}</>;
};