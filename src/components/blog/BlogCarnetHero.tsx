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
      <div className="relative z-20 text-center text-white max-w-4xl mx-auto px-4 pt-20">
        <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6 leading-tight text-white">
          Les bons conseils de Mon p'tit Dépanneur
        </h1>
        
        <p className="text-xl md:text-2xl mb-8 text-white/90 max-w-2xl mx-auto leading-relaxed">
          Retrouvez toutes les astuces de votre artisan préféré dans notre carnet
        </p>
      </div>
    </section>
  );
};