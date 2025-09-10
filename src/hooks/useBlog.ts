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
      let query = supabase
        .from("blog_posts")
        .select("*")
        .eq("published", true)
        .order("created_at", { ascending: false })
        .limit(limit);

      if (currentSlug) {
        query = query.neq("slug", currentSlug);
      }

      if (serviceId) {
        query = query.eq("service_id", serviceId);
      }

      const { data, error } = await query;
      if (error) throw error;
      return data || [];
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