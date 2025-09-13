import { useMemo } from "react";
import { useServices } from "@/hooks/useServices";
import { useCities } from "@/hooks/useCities";

export interface InternalLinkSuggestion {
  text: string;
  url: string;
  type: 'service' | 'city' | 'blog';
}

export const useInternalLinks = (content: string, currentSlug?: string) => {
  const { data: services } = useServices();
  const { data: cities } = useCities();

  return useMemo(() => {
    const suggestions: InternalLinkSuggestion[] = [];
    
    if (!content) return suggestions;

    // Mots-clés de services à détecter
    const serviceKeywords = {
      "plomberie": "plombier",
      "plombier": "plombier", 
      "chauffage": "chauffage",
      "chauffagiste": "chauffage",
      "climatisation": "climatisation",
      "pompe à chaleur": "pompe-a-chaleur",
      "pompes à chaleur": "pompe-a-chaleur",
      "serrurerie": "serrurier",
      "serrurier": "serrurier",
      "vitrerie": "vitrier",
      "vitrier": "vitrier"
    };

    // Détecter les mentions de services et créer des liens
    services?.forEach(service => {
      const serviceSlug = service.slug;
      
      Object.entries(serviceKeywords).forEach(([keyword, serviceType]) => {
        if (serviceType === serviceSlug && content.toLowerCase().includes(keyword.toLowerCase())) {
          // Suggérer des liens vers les principales villes
          suggestions.push({
            text: keyword,
            url: `/${serviceSlug}-lille`,
            type: 'service'
          });
        }
      });
    });

    // Détecter les mentions de villes
    cities?.forEach(city => {
      const cityName = city.name.toLowerCase();
      if (content.toLowerCase().includes(cityName) && city.slug !== currentSlug) {
        // Suggérer des liens vers les services dans cette ville
        suggestions.push({
          text: city.name,
          url: `/plombier-${city.slug}`,
          type: 'city'
        });
      }
    });

    // Limiter le nombre de suggestions pour éviter le sur-linkage
    return suggestions.slice(0, 5);
  }, [content, services, cities, currentSlug]);
};