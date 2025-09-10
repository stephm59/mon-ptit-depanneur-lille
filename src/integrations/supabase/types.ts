export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "13.0.4"
  }
  public: {
    Tables: {
      blog_post_faqs: {
        Row: {
          answer: string
          blog_post_id: string
          created_at: string
          id: string
          position: number | null
          question: string
          updated_at: string
        }
        Insert: {
          answer: string
          blog_post_id: string
          created_at?: string
          id?: string
          position?: number | null
          question: string
          updated_at?: string
        }
        Update: {
          answer?: string
          blog_post_id?: string
          created_at?: string
          id?: string
          position?: number | null
          question?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "blog_post_faqs_blog_post_id_fkey"
            columns: ["blog_post_id"]
            isOneToOne: false
            referencedRelation: "blog_posts"
            referencedColumns: ["id"]
          },
        ]
      }
      blog_posts: {
        Row: {
          content: string | null
          cover_image_url: string | null
          created_at: string
          excerpt: string | null
          id: string
          published: boolean
          published_at: string | null
          service_id: string | null
          slug: string
          title: string
          updated_at: string
        }
        Insert: {
          content?: string | null
          cover_image_url?: string | null
          created_at?: string
          excerpt?: string | null
          id?: string
          published?: boolean
          published_at?: string | null
          service_id?: string | null
          slug: string
          title: string
          updated_at?: string
        }
        Update: {
          content?: string | null
          cover_image_url?: string | null
          created_at?: string
          excerpt?: string | null
          id?: string
          published?: boolean
          published_at?: string | null
          service_id?: string | null
          slug?: string
          title?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "blog_posts_service_id_fkey"
            columns: ["service_id"]
            isOneToOne: false
            referencedRelation: "services"
            referencedColumns: ["id"]
          },
        ]
      }
      cities: {
        Row: {
          created_at: string
          department: string | null
          id: string
          name: string
          published: boolean
          region: string | null
          slug: string
          updated_at: string
        }
        Insert: {
          created_at?: string
          department?: string | null
          id?: string
          name: string
          published?: boolean
          region?: string | null
          slug: string
          updated_at?: string
        }
        Update: {
          created_at?: string
          department?: string | null
          id?: string
          name?: string
          published?: boolean
          region?: string | null
          slug?: string
          updated_at?: string
        }
        Relationships: []
      }
      redirects: {
        Row: {
          created_at: string
          from_path: string
          id: string
          status_code: number
          to_path: string
          updated_at: string
        }
        Insert: {
          created_at?: string
          from_path: string
          id?: string
          status_code?: number
          to_path: string
          updated_at?: string
        }
        Update: {
          created_at?: string
          from_path?: string
          id?: string
          status_code?: number
          to_path?: string
          updated_at?: string
        }
        Relationships: []
      }
      service_city_faqs: {
        Row: {
          answer: string
          city_id: string
          created_at: string
          id: string
          position: number
          published: boolean
          question: string
          service_id: string
          updated_at: string
        }
        Insert: {
          answer: string
          city_id: string
          created_at?: string
          id?: string
          position?: number
          published?: boolean
          question: string
          service_id: string
          updated_at?: string
        }
        Update: {
          answer?: string
          city_id?: string
          created_at?: string
          id?: string
          position?: number
          published?: boolean
          question?: string
          service_id?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "service_city_faqs_city_id_fkey"
            columns: ["city_id"]
            isOneToOne: false
            referencedRelation: "cities"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "service_city_faqs_service_id_fkey"
            columns: ["service_id"]
            isOneToOne: false
            referencedRelation: "services"
            referencedColumns: ["id"]
          },
        ]
      }
      service_city_offers: {
        Row: {
          created_at: string
          description: string
          emoji: string | null
          icon_name: string | null
          id: string
          page_id: string
          position: number
          title: string
          updated_at: string
        }
        Insert: {
          created_at?: string
          description: string
          emoji?: string | null
          icon_name?: string | null
          id?: string
          page_id: string
          position: number
          title: string
          updated_at?: string
        }
        Update: {
          created_at?: string
          description?: string
          emoji?: string | null
          icon_name?: string | null
          id?: string
          page_id?: string
          position?: number
          title?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "service_city_offers_page_id_fkey"
            columns: ["page_id"]
            isOneToOne: false
            referencedRelation: "service_city_pages"
            referencedColumns: ["id"]
          },
        ]
      }
      service_city_pages: {
        Row: {
          city_id: string
          created_at: string
          cta_subtitle: string
          cta_title: string | null
          h1: string | null
          h2_intro: string | null
          id: string
          intro_description: string | null
          meta_description: string | null
          meta_title: string | null
          published: boolean
          published_at: string | null
          service_id: string
          updated_at: string
          zones_text: string | null
        }
        Insert: {
          city_id: string
          created_at?: string
          cta_subtitle?: string
          cta_title?: string | null
          h1?: string | null
          h2_intro?: string | null
          id?: string
          intro_description?: string | null
          meta_description?: string | null
          meta_title?: string | null
          published?: boolean
          published_at?: string | null
          service_id: string
          updated_at?: string
          zones_text?: string | null
        }
        Update: {
          city_id?: string
          created_at?: string
          cta_subtitle?: string
          cta_title?: string | null
          h1?: string | null
          h2_intro?: string | null
          id?: string
          intro_description?: string | null
          meta_description?: string | null
          meta_title?: string | null
          published?: boolean
          published_at?: string | null
          service_id?: string
          updated_at?: string
          zones_text?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "service_city_pages_city_id_fkey"
            columns: ["city_id"]
            isOneToOne: false
            referencedRelation: "cities"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "service_city_pages_service_id_fkey"
            columns: ["service_id"]
            isOneToOne: false
            referencedRelation: "services"
            referencedColumns: ["id"]
          },
        ]
      }
      service_faqs_generic: {
        Row: {
          answer: string
          created_at: string
          id: string
          position: number
          published: boolean
          question: string
          service_id: string
          updated_at: string
        }
        Insert: {
          answer: string
          created_at?: string
          id?: string
          position?: number
          published?: boolean
          question: string
          service_id: string
          updated_at?: string
        }
        Update: {
          answer?: string
          created_at?: string
          id?: string
          position?: number
          published?: boolean
          question?: string
          service_id?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "service_faqs_generic_service_id_fkey"
            columns: ["service_id"]
            isOneToOne: false
            referencedRelation: "services"
            referencedColumns: ["id"]
          },
        ]
      }
      services: {
        Row: {
          created_at: string
          description: string | null
          id: string
          name: string
          published: boolean
          slug: string
          updated_at: string
        }
        Insert: {
          created_at?: string
          description?: string | null
          id?: string
          name: string
          published?: boolean
          slug: string
          updated_at?: string
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: string
          name?: string
          published?: boolean
          slug?: string
          updated_at?: string
        }
        Relationships: []
      }
      staging_service_city_faqs: {
        Row: {
          answer: string
          city_slug: string
          position: number
          published: boolean | null
          question: string
          service_slug: string
        }
        Insert: {
          answer: string
          city_slug: string
          position: number
          published?: boolean | null
          question: string
          service_slug: string
        }
        Update: {
          answer?: string
          city_slug?: string
          position?: number
          published?: boolean | null
          question?: string
          service_slug?: string
        }
        Relationships: []
      }
      staging_service_city_offers: {
        Row: {
          city_slug: string
          description: string | null
          emoji: string | null
          icon_name: string | null
          position: number
          service_slug: string
          title: string
        }
        Insert: {
          city_slug: string
          description?: string | null
          emoji?: string | null
          icon_name?: string | null
          position: number
          service_slug: string
          title: string
        }
        Update: {
          city_slug?: string
          description?: string | null
          emoji?: string | null
          icon_name?: string | null
          position?: number
          service_slug?: string
          title?: string
        }
        Relationships: []
      }
      staging_service_city_pages: {
        Row: {
          city_slug: string
          cta_subtitle: string | null
          cta_title: string | null
          h1: string | null
          h2_intro: string | null
          intro_description: string | null
          meta_description: string | null
          meta_title: string | null
          published: boolean | null
          published_at: string | null
          service_slug: string
          zones_text: string | null
        }
        Insert: {
          city_slug: string
          cta_subtitle?: string | null
          cta_title?: string | null
          h1?: string | null
          h2_intro?: string | null
          intro_description?: string | null
          meta_description?: string | null
          meta_title?: string | null
          published?: boolean | null
          published_at?: string | null
          service_slug: string
          zones_text?: string | null
        }
        Update: {
          city_slug?: string
          cta_subtitle?: string | null
          cta_title?: string | null
          h1?: string | null
          h2_intro?: string | null
          intro_description?: string | null
          meta_description?: string | null
          meta_title?: string | null
          published?: boolean | null
          published_at?: string | null
          service_slug?: string
          zones_text?: string | null
        }
        Relationships: []
      }
      staging_testimonials: {
        Row: {
          author_name: string
          city_slug: string | null
          content: string
          location: string | null
          published: boolean | null
          rating: number | null
          service_slug: string | null
        }
        Insert: {
          author_name: string
          city_slug?: string | null
          content: string
          location?: string | null
          published?: boolean | null
          rating?: number | null
          service_slug?: string | null
        }
        Update: {
          author_name?: string
          city_slug?: string | null
          content?: string
          location?: string | null
          published?: boolean | null
          rating?: number | null
          service_slug?: string | null
        }
        Relationships: []
      }
      testimonials: {
        Row: {
          author_name: string
          city_id: string | null
          content: string
          created_at: string
          id: string
          location: string | null
          published: boolean
          rating: number
          service_id: string | null
          updated_at: string
        }
        Insert: {
          author_name: string
          city_id?: string | null
          content: string
          created_at?: string
          id?: string
          location?: string | null
          published?: boolean
          rating: number
          service_id?: string | null
          updated_at?: string
        }
        Update: {
          author_name?: string
          city_id?: string | null
          content?: string
          created_at?: string
          id?: string
          location?: string | null
          published?: boolean
          rating?: number
          service_id?: string | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "testimonials_city_id_fkey"
            columns: ["city_id"]
            isOneToOne: false
            referencedRelation: "cities"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "testimonials_service_id_fkey"
            columns: ["service_id"]
            isOneToOne: false
            referencedRelation: "services"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const
