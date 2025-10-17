import { useState, ImgHTMLAttributes } from 'react';
import { cn } from '@/lib/utils';

interface ResponsiveImageProps extends Omit<ImgHTMLAttributes<HTMLImageElement>, 'loading' | 'src'> {
  src: string;
  alt: string;
  priority?: boolean;
  className?: string;
  avifSrc?: string;
  webpSrc?: string;
  srcSet?: string;
  sizes?: string;
}

export const ResponsiveImage = ({ 
  src, 
  alt, 
  priority = false,
  avifSrc,
  webpSrc,
  srcSet,
  sizes = "(max-width: 768px) 100vw, 50vw",
  className, 
  ...props 
}: ResponsiveImageProps) => {
  const [isLoaded, setIsLoaded] = useState(false);
  const [hasError, setHasError] = useState(false);

  const handleLoad = () => {
    setIsLoaded(true);
  };

  const handleError = () => {
    setHasError(true);
    setIsLoaded(true);
  };

  return (
    <div className={cn("relative overflow-hidden", className)}>
      {!isLoaded && (
        <div className="absolute inset-0 bg-muted animate-pulse rounded-lg" />
      )}
      
      {(avifSrc || webpSrc) ? (
        <picture>
          {avifSrc && (
            <source 
              type="image/avif" 
              srcSet={avifSrc}
              sizes={sizes}
            />
          )}
          {webpSrc && (
            <source 
              type="image/webp" 
              srcSet={webpSrc}
              sizes={sizes}
            />
          )}
          <img
            {...props}
            src={src}
            alt={alt}
            loading={priority ? 'eager' : 'lazy'}
            decoding={priority ? 'sync' : 'async'}
            fetchPriority={priority ? 'high' : 'auto'}
            onLoad={handleLoad}
            onError={handleError}
            className={cn(
              "transition-opacity duration-300",
              isLoaded ? "opacity-100" : "opacity-0",
              hasError && "opacity-50",
              className
            )}
          />
        </picture>
      ) : (
        <img
          {...props}
          src={src}
          srcSet={srcSet}
          sizes={sizes}
          alt={alt}
          loading={priority ? 'eager' : 'lazy'}
          decoding={priority ? 'sync' : 'async'}
          fetchPriority={priority ? 'high' : 'auto'}
          onLoad={handleLoad}
          onError={handleError}
          className={cn(
            "transition-opacity duration-300",
            isLoaded ? "opacity-100" : "opacity-0",
            hasError && "opacity-50",
            className
          )}
        />
      )}
    </div>
  );
};
