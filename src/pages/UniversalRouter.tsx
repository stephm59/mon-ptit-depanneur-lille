import { useParams } from "react-router-dom";
import { useServiceCityPage } from "@/hooks/useServiceCityPage";
import { useBlogPost } from "@/hooks/useBlog";
import ServiceCity from "./ServiceCity";
import BlogPost from "./BlogPost";
import NotFound from "./NotFound";
import { Loading } from "@/components/ui/loading";

const UniversalRouter = () => {
  const { slug } = useParams<{ slug: string }>();
  
  // Parse the slug to determine if it's a service-city combination
  const parseSlug = (fullSlug: string) => {
    // Common service patterns
    const servicePatterns = ['plombier', 'chauffagiste', 'electricien', 'vitrier', 'serrurier'];
    
    for (const service of servicePatterns) {
      if (fullSlug.startsWith(`${service}-`)) {
        const citySlug = fullSlug.substring(service.length + 1);
        return { serviceSlug: service, citySlug };
      }
    }
    
    return null;
  };

  const parsed = slug ? parseSlug(slug) : null;
  
  // First check if it's a service-city page
  const { data: serviceCityPage, isLoading: isLoadingServiceCity } = useServiceCityPage(
    parsed?.serviceSlug || "", 
    parsed?.citySlug || ""
  );
  
  // Then check if it's a blog post
  const { data: blogPost, isLoading: isLoadingBlog } = useBlogPost(slug || "");

  if (isLoadingServiceCity || isLoadingBlog) {
    return <Loading />;
  }

  // If we found a service-city page, render it
  if (serviceCityPage) {
    return <ServiceCity />;
  }

  // If we found a blog post, render it
  if (blogPost) {
    return <BlogPost />;
  }

  // If neither found, show 404
  return <NotFound />;
};

export default UniversalRouter;