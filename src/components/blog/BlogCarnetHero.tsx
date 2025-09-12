import { useRef, useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Volume2, VolumeX, Search, X } from "lucide-react";
import { HERO_VIDEO_URL } from "@/config/media";
import { useServices } from "@/hooks/useServices";

interface BlogCarnetHeroProps {
  searchTerm: string;
  onSearchChange: (term: string) => void;
  selectedServiceId: string | null;
  onServiceChange: (serviceId: string | null) => void;
}

export const BlogCarnetHero = ({
  searchTerm,
  onSearchChange,
  selectedServiceId,
  onServiceChange
}: BlogCarnetHeroProps) => {
  const [isMuted, setIsMuted] = useState(true);
  const [localSearchTerm, setLocalSearchTerm] = useState(searchTerm);
  const videoRef = useRef<HTMLVideoElement>(null);
  const { data: services } = useServices();

  const toggleMute = () => {
    if (videoRef.current) {
      videoRef.current.muted = !videoRef.current.muted;
      setIsMuted(videoRef.current.muted);
    }
  };

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearchChange(localSearchTerm);
  };

  const clearSearch = () => {
    setLocalSearchTerm("");
    onSearchChange("");
  };

  return (
    <section className="relative min-h-[70vh] flex items-center justify-center overflow-hidden">
      {/* Background Video */}
      <video
        ref={videoRef}
        autoPlay
        loop
        muted={isMuted}
        playsInline
        className="absolute inset-0 w-full h-full object-cover z-0"
      >
        <source src={HERO_VIDEO_URL} type="video/mp4" />
      </video>

      {/* Overlay */}
      <div className="absolute inset-0 bg-gradient-to-r from-black/60 via-black/40 to-black/60 z-10" />

      {/* Mute/Unmute Button */}
      <Button
        variant="ghost"
        size="icon"
        onClick={toggleMute}
        className="absolute top-4 right-4 z-30 bg-black/20 hover:bg-black/40 text-white border border-white/20"
      >
        {isMuted ? <VolumeX className="h-4 w-4" /> : <Volume2 className="h-4 w-4" />}
      </Button>

      {/* Content */}
      <div className="relative z-20 text-center text-white max-w-4xl mx-auto px-4">
        <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6 leading-tight text-white">
          Les bons conseils de Mon p'tit Dépanneur
        </h1>
        
        <p className="text-xl md:text-2xl mb-12 text-white/90 max-w-2xl mx-auto leading-relaxed">
          Retrouvez toutes les astuces de votre artisan préféré dans notre carnet
        </p>

        {/* Search Section */}
        <div className="max-w-2xl mx-auto mb-8">
          {/* Search Bar */}
          <form onSubmit={handleSearchSubmit} className="mb-6">
            <div className="relative">
              <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-muted-foreground w-5 h-5" />
              <Input
                type="text"
                placeholder="Rechercher un article..."
                value={localSearchTerm}
                onChange={(e) => setLocalSearchTerm(e.target.value)}
                className="pl-12 pr-12 h-14 text-lg bg-white/95 backdrop-blur-sm border-none shadow-lg rounded-full"
              />
              {localSearchTerm && (
                <button
                  type="button"
                  onClick={clearSearch}
                  className="absolute right-4 top-1/2 transform -translate-y-1/2 text-muted-foreground hover:text-foreground"
                >
                  <X className="w-5 h-5" />
                </button>
              )}
            </div>
          </form>

          {/* Category Filters */}
          <div className="flex flex-wrap gap-3 justify-center">
            <Button
              variant={!selectedServiceId ? "default" : "secondary"}
              size="sm"
              onClick={() => onServiceChange(null)}
              className="rounded-full bg-white/90 hover:bg-white text-gray-900 border-none shadow-md"
            >
              Tous
            </Button>
            {services?.map((service) => (
              <Button
                key={service.id}
                variant={selectedServiceId === service.id ? "default" : "secondary"}
                size="sm"
                onClick={() => onServiceChange(service.id)}
                className="rounded-full bg-white/90 hover:bg-white text-gray-900 border-none shadow-md"
              >
                {service.name}
              </Button>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};