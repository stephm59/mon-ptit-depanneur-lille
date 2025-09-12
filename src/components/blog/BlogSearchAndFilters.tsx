import { useState } from "react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Search, X } from "lucide-react";
import { useServices } from "@/hooks/useServices";

interface BlogSearchAndFiltersProps {
  searchTerm: string;
  onSearchChange: (term: string) => void;
  selectedServiceId: string | null;
  onServiceChange: (serviceId: string | null) => void;
  totalPosts: number;
}

export const BlogSearchAndFilters = ({
  searchTerm,
  onSearchChange,
  selectedServiceId,
  onServiceChange,
  totalPosts
}: BlogSearchAndFiltersProps) => {
  const { data: services } = useServices();
  const [localSearchTerm, setLocalSearchTerm] = useState(searchTerm);

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearchChange(localSearchTerm);
  };

  const clearSearch = () => {
    setLocalSearchTerm("");
    onSearchChange("");
  };

  const selectedService = services?.find(s => s.id === selectedServiceId);

  return (
    <div className="bg-background/80 backdrop-blur-sm border-b sticky top-0 z-10">
      <div className="container mx-auto px-4 py-6">
        {/* Search Bar */}
        <form onSubmit={handleSearchSubmit} className="mb-6">
          <div className="relative max-w-md mx-auto">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground w-4 h-4" />
            <Input
              type="text"
              placeholder="Rechercher un article..."
              value={localSearchTerm}
              onChange={(e) => setLocalSearchTerm(e.target.value)}
              className="pl-10 pr-10"
            />
            {localSearchTerm && (
              <button
                type="button"
                onClick={clearSearch}
                className="absolute right-3 top-1/2 transform -translate-y-1/2 text-muted-foreground hover:text-foreground"
              >
                <X className="w-4 h-4" />
              </button>
            )}
          </div>
        </form>

        {/* Category Filters */}
        <div className="flex flex-wrap gap-2 justify-center">
          <Button
            variant={!selectedServiceId ? "default" : "outline"}
            size="sm"
            onClick={() => onServiceChange(null)}
            className="rounded-full"
          >
            Tous
          </Button>
          {services?.map((service) => (
            <Button
              key={service.id}
              variant={selectedServiceId === service.id ? "default" : "outline"}
              size="sm"
              onClick={() => onServiceChange(service.id)}
              className="rounded-full"
            >
              {service.name}
            </Button>
          ))}
        </div>

        {/* Active Filters & Results Count */}
        <div className="mt-4 flex flex-wrap items-center justify-between gap-2">
          <div className="flex flex-wrap items-center gap-2">
            {searchTerm && (
              <Badge variant="secondary" className="gap-1">
                Recherche: "{searchTerm}"
                <button onClick={() => onSearchChange("")} className="ml-1 hover:bg-destructive/20 rounded-full p-0.5">
                  <X className="w-3 h-3" />
                </button>
              </Badge>
            )}
            {selectedService && (
              <Badge variant="secondary" className="gap-1">
                Catégorie: {selectedService.name}
                <button onClick={() => onServiceChange(null)} className="ml-1 hover:bg-destructive/20 rounded-full p-0.5">
                  <X className="w-3 h-3" />
                </button>
              </Badge>
            )}
          </div>
          
          <span className="text-sm text-muted-foreground">
            {totalPosts} article{totalPosts > 1 ? 's' : ''} trouvé{totalPosts > 1 ? 's' : ''}
          </span>
        </div>
      </div>
    </div>
  );
};