import { useParams } from "react-router-dom";
import { useServiceCityPage } from "@/hooks/useServiceCityPage";
import ServiceCity from "./ServiceCity";
import NotFound from "./NotFound";
import { Loading } from "@/components/ui/loading";

const UniversalRouter = () => {
  const { slug } = useParams<{ slug: string }>();
  
  // Parse the slug to determine if it's a service-city combination
  const parseSlug = (fullSlug: string) => {
    // All service patterns (now match the URLs directly)
    const servicePatterns = [
      'plombier', 'chauffagiste', 'pompe-a-chaleur', 'climatisation', 
      'renovation-salle-de-bains', 'serrurier', 'vitrier'
    ];
    
    // Check if slug matches any service pattern
    for (const service of servicePatterns) {
      if (fullSlug.startsWith(`${service}-`)) {
        const citySlug = fullSlug.substring(service.length + 1);
        return { serviceSlug: service, citySlug };
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

  // If we have a service-city pattern but no data, show 404
  if (parsed && !serviceCityPage) {
    return <NotFound />;
  }

  // If no service-city page found, show 404
  return <NotFound />;
};

export default UniversalRouter;