import { useState, useRef, VideoHTMLAttributes, forwardRef } from 'react';
import { useIsMobile } from '@/hooks/use-mobile';
import { Play } from 'lucide-react';
import { cn } from '@/lib/utils';

interface LazyVideoProps extends Omit<VideoHTMLAttributes<HTMLVideoElement>, 'poster'> {
  src: string;
  poster?: string;
  className?: string;
  mobilePoster?: string;
  onPlayClick?: () => void;
}

export const LazyVideo = forwardRef<HTMLVideoElement, LazyVideoProps>(({ 
  src, 
  poster, 
  mobilePoster,
  className,
  onPlayClick,
  ...props 
}, ref) => {
  const isMobile = useIsMobile();
  const [isLoaded, setIsLoaded] = useState(false);
  const [showPlayButton, setShowPlayButton] = useState(isMobile);
  const internalRef = useRef<HTMLVideoElement>(null);
  const videoRef = (ref as React.MutableRefObject<HTMLVideoElement>) || internalRef;

  const handleLoadVideo = () => {
    setIsLoaded(true);
    setShowPlayButton(false);
    if (videoRef.current) {
      videoRef.current.load();
      videoRef.current.play();
    }
    onPlayClick?.();
  };

  const posterUrl = isMobile && mobilePoster ? mobilePoster : poster;

  return (
    <div className={cn("relative", className)}>
      {!isLoaded && isMobile ? (
        <>
          <img 
            src={posterUrl} 
            alt="Video thumbnail"
            className={className}
          />
          <button
            onClick={handleLoadVideo}
            className="absolute inset-0 flex items-center justify-center bg-black/30 hover:bg-black/40 transition-colors"
            aria-label="Charger et lire la vidéo"
          >
            <div className="w-16 h-16 bg-white/90 rounded-full flex items-center justify-center shadow-lg">
              <Play className="w-8 h-8 text-primary ml-1" />
            </div>
          </button>
        </>
      ) : (
        <video
          ref={videoRef}
          {...props}
          poster={posterUrl}
          preload={isMobile ? "none" : "metadata"}
          className={className}
        >
          <source src={src} type="video/mp4" />
        </video>
      )}
    </div>
  );
});

LazyVideo.displayName = 'LazyVideo';
