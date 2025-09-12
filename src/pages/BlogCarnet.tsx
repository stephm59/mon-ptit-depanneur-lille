import { useState } from "react";
import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { BlogCarnetHero } from "@/components/blog/BlogCarnetHero";
import { BlogSearchAndFilters } from "@/components/blog/BlogSearchAndFilters";
import { BlogGrid } from "@/components/blog/BlogGrid";
import { useFilteredBlogPosts } from "@/hooks/useBlog";
import { FixedCallButton } from "@/components/widgets/FixedCallButton";

const BlogCarnet = () => {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedServiceId, setSelectedServiceId] = useState<string | null>(null);

  const { data: posts = [], isLoading } = useFilteredBlogPosts(searchTerm, selectedServiceId);

  return (
    <>
      <Helmet>
        <title>Les bons conseils de Mon p'tit Dépanneur</title>
        <meta name="description" content="Retrouvez toutes les astuces de votre artisan préféré dans notre carnet.." />
        <meta property="og:title" content="Les bons conseils de Mon p'tit Dépanneur" />
        <meta property="og:description" content="Retrouvez toutes les astuces de votre artisan préféré dans notre carnet.." />
        <meta property="og:type" content="website" />
        <link rel="canonical" href="https://www.monptitdepanneur.com/carnet" />
      </Helmet>

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