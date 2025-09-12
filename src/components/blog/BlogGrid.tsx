import { BlogCard } from "./BlogCard";
import { BlogPost } from "@/hooks/useBlog";

interface BlogGridProps {
  posts: (BlogPost & { 
    services?: { 
      id: string; 
      name: string; 
      slug: string; 
    } | null;
  })[];
  isLoading?: boolean;
}

export const BlogGrid = ({ posts, isLoading }: BlogGridProps) => {
  if (isLoading) {
    return (
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {Array.from({ length: 6 }).map((_, index) => (
            <div key={index} className="animate-pulse">
              <div className="bg-muted rounded-lg h-48 mb-4"></div>
              <div className="space-y-2">
                <div className="bg-muted h-4 w-3/4 rounded"></div>
                <div className="bg-muted h-4 w-1/2 rounded"></div>
                <div className="bg-muted h-3 w-full rounded"></div>
                <div className="bg-muted h-3 w-2/3 rounded"></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    );
  }

  if (posts.length === 0) {
    return (
      <div className="container mx-auto px-4 py-12">
        <div className="text-center py-16">
          <div className="w-24 h-24 mx-auto mb-6 bg-muted rounded-full flex items-center justify-center">
            <svg className="w-12 h-12 text-muted-foreground" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
            </svg>
          </div>
          <h3 className="text-xl font-semibold mb-2">Aucun article trouvé</h3>
          <p className="text-muted-foreground">
            Essayez de modifier vos critères de recherche ou de sélectionner une autre catégorie.
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="container mx-auto px-4 py-12">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {posts.map((post) => (
          <BlogCard key={post.id} post={post} />
        ))}
      </div>
    </div>
  );
};