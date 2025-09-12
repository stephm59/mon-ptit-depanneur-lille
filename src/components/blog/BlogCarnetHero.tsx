import { useRef, useState } from "react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Volume2, VolumeX, Clock, Shield, Wrench, Star } from "lucide-react";
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

      </div>

      {/* Feature cards - overlapping at bottom */}
      <div className="absolute left-1/2 -translate-x-1/2 bottom-[-60px] md:bottom-[-70px] w-full max-w-6xl px-4 z-20">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {[
            {
              icon: Clock,
              title: "Intervention < 1h",
              description: "Dans Lille et environs",
              color: "text-accent"
            },
            {
              icon: Shield,
              title: "Garantie décennale",
              description: "Travaux assurés",
              color: "text-success"
            },
            {
              icon: Wrench,
              title: "Devis gratuit",
              description: "Sans engagement",
              color: "text-primary-light"
            },
            {
              icon: Star,
              title: "Artisan de confiance",
              description: "Service de qualité",
              color: "text-accent"
            }
          ].map((feature, index) => (
            <Card key={index} className="p-6 bg-card/95 backdrop-blur-sm border-none shadow-card hover:shadow-elevated transition-all duration-300 transform hover:scale-105">
              <div className="text-center">
                <feature.icon className={`w-12 h-12 mx-auto mb-4 ${feature.color}`} />
                <h3 className="font-bold text-lg mb-2 text-card-foreground">{feature.title}</h3>
                <p className="text-muted-foreground">{feature.description}</p>
              </div>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};