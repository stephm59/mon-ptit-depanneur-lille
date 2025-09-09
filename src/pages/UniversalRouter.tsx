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
  
  console.log('UniversalRouter Debug:', {
    slug,
    parsed,
    blogSlugToFetch: parsed ? "" : (slug || ""),
    serviceSlugToFetch: parsed?.serviceSlug || "",
    citySlugToFetch: parsed?.citySlug || ""
  });
  
  // If we detected a service-city pattern, check for service-city page first
  const { data: serviceCityPage, isLoading: isLoadingServiceCity } = useServiceCityPage(
    parsed?.serviceSlug || "", 
    parsed?.citySlug || ""
  );
  
  // Only check for blog post if it's not a service-city pattern
  const { data: blogPost, isLoading: isLoadingBlog } = useBlogPost(
    parsed ? "" : (slug || "")
  );
  
  console.log('UniversalRouter Data:', {
    serviceCityPage,
    isLoadingServiceCity,
    blogPost,
    isLoadingBlog
  });

  if (isLoadingServiceCity || isLoadingBlog) {
    return <Loading />;
  }

  // If we have a service-city pattern and found data, render it
  if (parsed && serviceCityPage) {
    return <ServiceCity />;
  }

  // If we found a blog post and it's not a service-city pattern, render it
  if (!parsed && blogPost) {
    return <BlogPost />;
  }
  // If neither found, show 404
  return <NotFound />;
};

export default UniversalRouter;