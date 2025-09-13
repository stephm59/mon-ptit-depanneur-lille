import { ReactNode, forwardRef } from 'react';
import { useScrollAnimation } from '@/hooks/useScrollAnimation';
import { cn } from '@/lib/utils';

interface AnimatedSectionProps {
  children: ReactNode;
  className?: string;
  animation?: 'fade-in-up' | 'fade-in-left' | 'fade-in-right' | 'scale-in';
  delay?: number;
}

export const AnimatedSection = forwardRef<HTMLElement, AnimatedSectionProps>(
  ({ children, className, animation = 'fade-in-up', delay = 0 }, ref) => {
    const { elementRef, isVisible } = useScrollAnimation({
      threshold: 0.1,
      rootMargin: '50px'
    });

    return (
      <section
        ref={ref || elementRef}
        className={cn(
          animation,
          isVisible && 'animate',
          className
        )}
        style={{
          animationDelay: `${delay}ms`
        }}
      >
        {children}
      </section>
    );
  }
);

AnimatedSection.displayName = 'AnimatedSection';