import { Phone } from "lucide-react";
import { useIsMobile } from "@/hooks/use-mobile";

export const FixedCallButton = () => {
  const isMobile = useIsMobile();

  // Only show on mobile
  if (!isMobile) return null;

  return (
    <a
      href="tel:0328634868"
      className="fixed bottom-4 left-1/2 -translate-x-1/2 z-50 inline-flex items-center gap-2 text-white bg-accent px-6 py-3 rounded-full hover:bg-accent/90 transition-colors shadow-lg font-semibold"
      aria-label="Appeler Mon p'tit Dépanneur"
    >
      <Phone className="w-5 h-5" />
      03 28 63 48 68
    </a>
  );
};