import { useState } from "react";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { BlogCarnetHero } from "@/components/blog/BlogCarnetHero";
import { BlogSearchAndFilters } from "@/components/blog/BlogSearchAndFilters";
import { BlogGrid } from "@/components/blog/BlogGrid";
import { useFilteredBlogPosts } from "@/hooks/useBlog";
import { FixedCallButton } from "@/components/widgets/FixedCallButton";
import { SEOHead } from "@/components/seo/SEOHead";

const BlogCarnet = () => {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedServiceId, setSelectedServiceId] = useState<string | null>(null);

  const { data: posts = [], isLoading } = useFilteredBlogPosts(searchTerm, selectedServiceId);

  return (
    <>
      <SEOHead
        title="Les bons conseils de Mon p'tit Dépanneur"
        description="Retrouvez toutes les astuces de votre artisan préféré dans notre carnet.."
        canonical="/carnet"
        keywords="conseils plomberie, astuces chauffage, guide dépannage, blog artisan lille"
      />

      <div className="min-h-screen">
        <Header />
        
        <main>
          <BlogCarnetHero />
          
          <BlogSearchAndFilters
            searchTerm={searchTerm}
            onSearchChange={setSearchTerm}
            selectedServiceId={selectedServiceId}
            onServiceChange={setSelectedServiceId}
            totalPosts={posts.length}
          />
          
          <BlogGrid posts={posts} isLoading={isLoading} />
        </main>
        
        <Footer />
        <FixedCallButton />
      </div>
    </>
  );
};

export default BlogCarnet;