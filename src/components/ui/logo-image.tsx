import React, { useState } from "react";
import { AlertCircle } from "lucide-react";

interface LogoImageProps {
  src: string;
  alt: string;
  className?: string;
  fallbackText?: string;
}

export const LogoImage = ({ src, alt, className = "", fallbackText }: LogoImageProps) => {
  const [hasError, setHasError] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  const handleError = () => {
    setHasError(true);
    setIsLoading(false);
  };

  const handleLoad = () => {
    setIsLoading(false);
  };

  if (hasError) {
    return (
      <div className={`flex items-center justify-center bg-muted rounded ${className}`}>
        <div className="text-center p-2">
          <AlertCircle className="w-6 h-6 text-muted-foreground mx-auto mb-1" />
          <span className="text-xs text-muted-foreground">
            {fallbackText || alt}
          </span>
        </div>
      </div>
    );
  }

  return (
    <div className={`relative ${className}`}>
      {isLoading && (
        <div className="absolute inset-0 flex items-center justify-center bg-muted rounded animate-pulse">
          <div className="w-8 h-8 rounded bg-muted-foreground/20"></div>
        </div>
      )}
      <img
        src={src}
        alt={alt}
        className={`${className} ${isLoading ? 'invisible' : 'visible'} transition-all duration-300 hover:scale-110`}
        onError={handleError}
        onLoad={handleLoad}
        loading="lazy"
      />
    </div>
  );
};