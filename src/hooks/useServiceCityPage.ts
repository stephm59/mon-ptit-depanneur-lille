import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export const useServiceCityPage = (serviceSlug: string, citySlug: string) => {
  return useQuery({
    queryKey: ["service-city-page", serviceSlug, citySlug],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("service_city_pages")
        .select(`
          *,
          services!inner(slug, name),
          cities!inner(slug, name)
        `)
        .eq("services.slug", serviceSlug)
        .eq("cities.slug", citySlug)
        .eq("published", true)
        .maybeSingle();

      if (error) throw error;
      return data;
    },
    enabled: !!serviceSlug && !!citySlug,
  });
};

export const useServiceCityOffers = (pageId: string) => {
  return useQuery({
    queryKey: ["service-city-offers", pageId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("service_city_offers")
        .select("*")
        .eq("page_id", pageId)
        .order("position");

      if (error) throw error;
      return data;
    },
    enabled: !!pageId,
  });
};

export const useServiceCityFaqs = (serviceId: string, cityId: string) => {
  return useQuery({
    queryKey: ["service-city-faqs", serviceId, cityId],
    queryFn: async () => {
      // D'abord récupérer les FAQs locales
      const { data: localFaqs, error: localError } = await supabase
        .from("service_city_faqs")
        .select("*")
        .eq("service_id", serviceId)
        .eq("city_id", cityId)
        .eq("published", true)
        .order("position");

      if (localError) throw localError;

      // Ensuite les FAQs génériques pour ce service
      const { data: genericFaqs, error: genericError } = await supabase
        .from("service_faqs_generic")
        .select("*")
        .eq("service_id", serviceId)
        .eq("published", true)
        .order("position");

      if (genericError) throw genericError;

      // Combiner les FAQs (locales en premier)
      return [...(localFaqs || []), ...(genericFaqs || [])];
    },
    enabled: !!serviceId && !!cityId,
  });
};

export const useServiceCityTestimonials = (serviceId?: string, cityId?: string) => {
  return useQuery({
    queryKey: ["service-city-testimonials", serviceId, cityId],
    queryFn: async () => {
      let query = supabase
        .from("testimonials")
        .select("*")
        .eq("published", true);

      if (serviceId) {
        query = query.eq("service_id", serviceId);
      }
      
      if (cityId) {
        query = query.eq("city_id", cityId);
      }

      const { data, error } = await query
        .order("created_at", { ascending: false })
        .limit(6); // Limiter à 6 avis pour les pages service-city

      if (error) throw error;
      return data;
    },
    enabled: !!serviceId || !!cityId,
  });
};

export const useGenericTestimonials = () => {
  return useQuery({
    queryKey: ["generic-testimonials"],
    queryFn: async () => {
      // Récupérer plus de témoignages pour avoir une diversité
      const { data, error } = await supabase
        .from("testimonials")
        .select(`
          *,
          services!inner(name),
          cities!inner(name)
        `)
        .eq("published", true)
        .order("created_at", { ascending: false })
        .limit(30); // Récupérer plus pour pouvoir diversifier

      if (error) throw error;
      
      if (!data) return [];

      // Diversifier les témoignages par service (max 2 par service)
      const serviceGroups = new Map();
      const diversifiedTestimonials = [];

      for (const testimonial of data) {
        const serviceName = testimonial.services?.name || 'Autre';
        const currentCount = serviceGroups.get(serviceName) || 0;
        
        if (currentCount < 2) {
          serviceGroups.set(serviceName, currentCount + 1);
          diversifiedTestimonials.push(testimonial);
          
          // Arrêter quand on a 6 témoignages diversifiés
          if (diversifiedTestimonials.length >= 6) break;
        }
      }

      return diversifiedTestimonials;
    },
  });
};

export const useServiceBlogPosts = (serviceId: string) => {
  return useQuery({
    queryKey: ["service-blog-posts", serviceId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("blog_posts")
        .select("*")
        .eq("service_id", serviceId)
        .eq("published", true)
        .order("published_at", { ascending: false })
        .limit(6);

      if (error) throw error;
      return data;
    },
    enabled: !!serviceId,
  });
};