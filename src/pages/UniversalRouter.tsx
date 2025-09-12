import { useParams, Navigate } from "react-router-dom";
import { useServiceCityPage } from "@/hooks/useServiceCityPage";
import ServiceCity from "./ServiceCity";
import NotFound from "./NotFound";
import { Loading } from "@/components/ui/loading";

const UniversalRouter = () => {
  const { slug } = useParams<{ slug: string }>();
  
  // Parse the slug to determine if it's a service-city combination
  const parseSlug = (fullSlug: string) => {
    // All service patterns that actually exist in the database
    const servicePatterns = [
      'plombier', 'chauffage', 'vitrier', 'serrure',
      'pompe-a-chaleur', 'climatisation', 'renovation-salle-de-bains'
    ];
    
    // Also handle common variations that should redirect to the correct service
    const serviceRedirects: Record<string, string> = {
      'chauffagiste': 'chauffage',
      'serrurier': 'serrure',
      'electricien': 'serrure' // assuming electricien maps to serrure, or add electricien to services
    };
    
    // First, check direct service patterns
    for (const service of servicePatterns) {
      if (fullSlug.startsWith(`${service}-`)) {
        const citySlug = fullSlug.substring(service.length + 1);
        return { serviceSlug: service, citySlug };
      }
    }
    
    // Then check service redirects (e.g., chauffagiste -> chauffage)
    for (const [oldService, newService] of Object.entries(serviceRedirects)) {
      if (fullSlug.startsWith(`${oldService}-`)) {
        const citySlug = fullSlug.substring(oldService.length + 1);
        return { serviceSlug: newService, citySlug };
      }
    }
    
    return null;
  };

  const parsed = slug ? parseSlug(slug) : null;
  
  // Only handle service-city pages now
  const { data: serviceCityPage, isLoading: isLoadingServiceCity } = useServiceCityPage(
    parsed?.serviceSlug || "", 
    parsed?.citySlug || ""
  );

  if (isLoadingServiceCity) {
    return <Loading />;
  }

  // If we have a service-city pattern and found data, render it
  if (parsed && serviceCityPage) {
    return <ServiceCity />;
  }

  // If we have a service-city pattern but no data, redirect to home instead of 404
  if (parsed && !serviceCityPage) {
    return <Navigate to="/" replace />;
  }

  // If no service-city page found, show 404
  return <NotFound />;
};

export default UniversalRouter;