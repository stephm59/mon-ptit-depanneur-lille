import { useRef, useState } from "react";
import { Button } from "@/components/ui/button";
import { Volume2, VolumeX } from "lucide-react";
import { HERO_VIDEO_URL } from "@/config/media";

export const BlogCarnetHero = () => {
  const [isMuted, setIsMuted] = useState(true);
  const videoRef = useRef<HTMLVideoElement>(null);

  const toggleMute = () => {
    if (videoRef.current) {
      videoRef.current.muted = !videoRef.current.muted;
      setIsMuted(videoRef.current.muted);
    }
  };

  return (
    <section className="relative min-h-[60vh] flex items-center justify-center overflow-hidden">
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
        <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6 leading-tight">
          Les bons conseils de{" "}
          <span className="text-primary">Mon p'tit Dépanneur</span>
        </h1>
        
        <p className="text-xl md:text-2xl mb-8 text-white/90 max-w-2xl mx-auto leading-relaxed">
          Retrouvez toutes les astuces de votre artisan préféré dans notre carnet
        </p>

        <div className="flex flex-col sm:flex-row items-center gap-4 text-white/80">
          <div className="flex items-center gap-2">
            <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
            </svg>
            <span>Conseils d'experts</span>
          </div>
          <div className="flex items-center gap-2">
            <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
            </svg>
            <span>Guides pratiques</span>
          </div>
          <div className="flex items-center gap-2">
            <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
            </svg>
            <span>Astuces économiques</span>
          </div>
        </div>
      </div>
    </section>
  );
};