import { Link } from "react-router-dom";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { BlogPost } from "@/hooks/useBlog";

interface BlogCardProps {
  post: BlogPost & { 
    services?: { 
      id: string; 
      name: string; 
      slug: string; 
    } | null;
  };
}

export const BlogCard = ({ post }: BlogCardProps) => {
  const getCategoryColor = (serviceName?: string) => {
    switch (serviceName) {
      case 'Chauffage':
        return 'bg-orange-100 text-orange-800 hover:bg-orange-200';
      case 'Plomberie':
        return 'bg-blue-100 text-blue-800 hover:bg-blue-200';
      case 'Climatisation':
        return 'bg-cyan-100 text-cyan-800 hover:bg-cyan-200';
      case 'Serrure':
        return 'bg-yellow-100 text-yellow-800 hover:bg-yellow-200';
      case 'Pompe à chaleur':
        return 'bg-green-100 text-green-800 hover:bg-green-200';
      default:
        return 'bg-gray-100 text-gray-800 hover:bg-gray-200';
    }
  };

  return (
    <Card className="group hover:shadow-lg transition-all duration-300 hover:scale-[1.02] overflow-hidden">
      <Link to={`/carnet/${post.slug}`} className="block">
        {post.cover_image_url && (
          <div className="aspect-video overflow-hidden relative">
            <img
              src={post.cover_image_url}
              alt={post.title}
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
            />
            
            {/* Badges en overlay sur l'image */}
            <div className="absolute top-3 left-3 flex flex-col gap-1">
              {post.isPopular && (
                <Badge 
                  variant="default"
                  className="bg-red-500 hover:bg-red-600 text-white text-xs font-medium shadow-lg"
                >
                  Populaire
                </Badge>
              )}
              {post.services && (
                <Badge 
                  variant="secondary"
                  className={`${getCategoryColor(post.services.name)} text-xs font-medium shadow-lg`}
                >
                  {post.services.name}
                </Badge>
              )}
            </div>
          </div>
        )}
        
        <CardHeader className="pb-3">
          <h3 className="font-semibold text-lg leading-tight group-hover:text-primary transition-colors duration-200 line-clamp-2">
            {post.title}
          </h3>
        </CardHeader>
        
        <CardContent className="pt-0">
          {post.excerpt && (
            <p className="text-muted-foreground text-sm line-clamp-3 leading-relaxed">
              {post.excerpt}
            </p>
          )}
          
          <div className="mt-4 flex items-center text-primary font-medium text-sm group-hover:text-primary/80 transition-colors">
            Lire l'article
            <svg className="ml-1 w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
            </svg>
          </div>
        </CardContent>
      </Link>
    </Card>
  );
};