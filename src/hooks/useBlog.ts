import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export interface BlogPost {
  id: string;
  title: string;
  slug: string;
  excerpt: string | null;
  content: string | null;
  cover_image_url: string | null;
  published: boolean;
  published_at: string | null;
  created_at: string;
  updated_at: string;
  service_id: string | null;
  isPopular?: boolean;
}

export const useBlogPost = (slug: string) => {
  return useQuery({
    queryKey: ["blogPost", slug],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("blog_posts")
        .select(`
          *,
          services(id, name, slug)
        `)
        .eq("slug", slug)
        .eq("published", true)
        .maybeSingle();

      if (error) throw error;
      return data;
    },
    enabled: !!slug,
  });
};

export const useRelatedBlogPosts = (serviceId?: string | null, currentSlug?: string, limit = 3) => {
  return useQuery({
    queryKey: ["relatedBlogPosts", serviceId, currentSlug, limit],
    queryFn: async () => {
      // First, try to get posts from the same service category
      let relatedPosts = [];
      
      if (serviceId) {
        const { data: sameCategoryPosts, error: categoryError } = await supabase
          .from("blog_posts")
          .select("*")
          .eq("published", true)
          .eq("service_id", serviceId)
          .neq("slug", currentSlug || "")
          .order("created_at", { ascending: false })
          .limit(limit);

        if (categoryError) throw categoryError;
        relatedPosts = sameCategoryPosts || [];
      }

      // If we don't have enough posts from the same category, fill with other posts
      if (relatedPosts.length < limit) {
        const remainingLimit = limit - relatedPosts.length;
        let query = supabase
          .from("blog_posts")
          .select("*")
          .eq("published", true)
          .neq("slug", currentSlug || "");

        // Only add service_id filter if serviceId is provided
        if (serviceId) {
          query = query.not("service_id", "eq", serviceId);
        }

        const { data: otherPosts, error: otherError } = await query
          .order("created_at", { ascending: false })
          .limit(remainingLimit);

        if (otherError) throw otherError;
        relatedPosts = [...relatedPosts, ...(otherPosts || [])];
      }

      return relatedPosts.slice(0, limit);
    },
  });
};

export const useLatestBlogPosts = (limit = 6) => {
  return useQuery({
    queryKey: ["latestBlogPosts", limit],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("blog_posts")
        .select("*")
        .eq("published", true)
        .order("created_at", { ascending: false })
        .limit(limit);

      if (error) throw error;
      return data || [];
    },
  });
};

export const useAllBlogPosts = () => {
  return useQuery({
    queryKey: ["allBlogPosts"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("blog_posts")
        .select(`
          *,
          services(id, name, slug)
        `)
        .eq("published", true)
        .order("created_at", { ascending: false });

      if (error) throw error;
      return data || [];
    },
  });
};

// Liste des articles populaires basée sur le trafic (avec mots-clés pour une correspondance flexible)
const POPULAR_POST_KEYWORDS = [
  "types de tuyauterie",
  "fuite du groupe de sécurité",
  "compteur d'eau", 
  "pêne demi-tour",
  "robinet mélangeur",
  "mitigeur simple",
  "thermostatique",
  "chasse d'eau ne fonctionne",
  "code erreur",
  "chaudière",
  "serrure de porte",
  "mitigeur fonctionnel"
];

const isPopularPost = (title: string): boolean => {
  const titleLower = title.toLowerCase();
  return POPULAR_POST_KEYWORDS.some(keyword => 
    titleLower.includes(keyword.toLowerCase())
  );
};

export const useFilteredBlogPosts = (searchTerm: string = "", serviceId: string | null = null) => {
  return useQuery({
    queryKey: ["filteredBlogPosts", searchTerm, serviceId],
    queryFn: async () => {
      let query = supabase
        .from("blog_posts")
        .select(`
          *,
          services(id, name, slug)
        `)
        .eq("published", true)
        .not("cover_image_url", "is", null)
        .neq("cover_image_url", "");

      // Filter by service if provided
      if (serviceId) {
        query = query.eq("service_id", serviceId);
      }

      const { data, error } = await query.order("created_at", { ascending: false });

      if (error) throw error;
      
      let posts = data || [];

      // Filter by search term if provided
      if (searchTerm) {
        const searchLower = searchTerm.toLowerCase();
        posts = posts.filter(post => 
          post.title.toLowerCase().includes(searchLower) ||
          (post.excerpt && post.excerpt.toLowerCase().includes(searchLower))
        );
      }

      // Ajouter la propriété isPopular et trier pour mettre les populaires en premier
      posts = posts.map(post => ({
        ...post,
        isPopular: isPopularPost(post.title)
      })).sort((a, b) => {
        // Les articles populaires d'abord
        if (a.isPopular && !b.isPopular) return -1;
        if (!a.isPopular && b.isPopular) return 1;
        // Ensuite par date de création (plus récent d'abord)
        return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
      });

      return posts;
    },
  });
};

export const useBlogPostFaqs = (blogPostId?: string) => {
  return useQuery({
    queryKey: ["blogPostFaqs", blogPostId],
    queryFn: async () => {
      if (!blogPostId) return [];
      
      const { data, error } = await supabase
        .from("blog_post_faqs")
        .select("*")
        .eq("blog_post_id", blogPostId)
        .order("position", { ascending: true });

      if (error) throw error;
      return data || [];
    },
    enabled: !!blogPostId,
  });
};