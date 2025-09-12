import { Phone } from "lucide-react";
import { useIsMobile } from "@/hooks/use-mobile";

export const FixedCallButton = () => {
  const isMobile = useIsMobile();

  // Only show on mobile
  if (!isMobile) return null;

  return (
    <a
      href="tel:0328534868"
      className="fixed bottom-0 left-0 right-0 z-50 flex items-center justify-center gap-2 text-white bg-accent px-4 py-4 hover:bg-accent/90 transition-colors shadow-lg font-semibold"
      aria-label="Appeler Mon p'tit Dépanneur"
    >
      <Phone className="w-5 h-5" />
      03 28 53 48 68
    </a>
  );
};