import { useState, useEffect, useRef } from "react";
import { CheckCircle, X, Star } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useIsMobile } from "@/hooks/use-mobile";

const localReviews = [
  {
    name: "Sophie L.",
    city: "Lille",
    rating: 5,
    review: "Intervention rapide pour ma fuite d'eau. Très satisfaite !",
    time: "Aujourd'hui"
  },
  {
    name: "Marc D.",
    city: "Roubaix", 
    rating: 5,
    review: "Plombier très professionnel, je recommande !",
    time: "Hier"
  },
  {
    name: "Julie M.",
    city: "Tourcoing",
    rating: 5,
    review: "Dépannage chaudière parfait, merci beaucoup",
    time: "Il y a 2 jours"
  },
  {
    name: "Pierre R.",
    city: "Villeneuve-d'Ascq",
    rating: 5,
    review: "Service excellent, tarifs transparents",
    time: "Il y a 3 jours"
  },
  {
    name: "Anne B.",
    city: "Marcq-en-Barœul",
    rating: 5,
    review: "Très bon artisan, travail soigné et rapide",
    time: "Hier"
  },
  {
    name: "Thomas K.",
    city: "Wattrelos",
    rating: 5,
    review: "Installation impeccable, équipe sympathique",
    time: "Il y a 2 jours"
  },
  {
    name: "Marie C.",
    city: "Lomme",
    rating: 5,
    review: "Dépannage d'urgence, très réactif !",
    time: "Aujourd'hui"
  },
  {
    name: "David L.",
    city: "La Madeleine",
    rating: 5,
    review: "Parfait du début à la fin, je recommande",
    time: "Il y a 3 jours"
  }
];

export const LocalReviewsWidget = () => {
  const isMobile = useIsMobile();
  const [currentReview, setCurrentReview] = useState(localReviews[0]);
  const [isVisible, setIsVisible] = useState(false);
  const [isClosing, setIsClosing] = useState(false);
  const [isDisabled, setIsDisabled] = useState(false);
  
  const showTimeoutRef = useRef<NodeJS.Timeout>();
  const intervalRef = useRef<NodeJS.Timeout>();

  // Effect pour gérer l'affichage des notifications
  useEffect(() => {
    if (isDisabled) return;

    const showNextReview = () => {
      // Sélectionner un avis aléatoire
      const randomReview = localReviews[Math.floor(Math.random() * localReviews.length)];
      setCurrentReview(randomReview);
      setIsVisible(true);
      setIsClosing(false);
    };

    // Première apparition après 3 secondes
    showTimeoutRef.current = setTimeout(() => {
      showNextReview();
    }, 3000);

    // Puis un nouvel avis toutes les 8 secondes (3s d'affichage + 5s d'attente)
    intervalRef.current = setInterval(() => {
      showNextReview();
    }, 8000);

    return () => {
      if (showTimeoutRef.current) clearTimeout(showTimeoutRef.current);
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  }, [isDisabled]);

  // Effect séparé pour la fermeture automatique après 3 secondes
  useEffect(() => {
    if (isVisible && !isDisabled) {
      const autoCloseTimeout = setTimeout(() => {
        handleAutoClose();
      }, 3000);

      return () => clearTimeout(autoCloseTimeout);
    }
  }, [isVisible, isDisabled]);

  const handleAutoClose = () => {
    setIsClosing(true);
    setTimeout(() => {
      setIsVisible(false);
      setIsClosing(false);
    }, 300);
  };

  const handleManualClose = () => {
    setIsDisabled(true); // Désactive toutes les futures notifications
    setIsClosing(true);
    setTimeout(() => {
      setIsVisible(false);
      setIsClosing(false);
    }, 300);
    
    // Nettoyer les timeouts en cours
    if (showTimeoutRef.current) clearTimeout(showTimeoutRef.current);
    if (intervalRef.current) clearInterval(intervalRef.current);
  };

  // Don't show on mobile or if disabled/not visible
  if (!isVisible || isDisabled || isMobile) return null;

  return (
    <div 
      className={`fixed bottom-6 left-6 z-50 transition-all duration-300 transform ${
        isClosing ? 'translate-y-full opacity-0' : 'translate-y-0 opacity-100'
      }`}
    >
      <div className="bg-white rounded-lg shadow-xl border border-gray-200 p-4 max-w-sm relative animate-slide-in-left">
        {/* Barre bleue en haut */}
        <div className="absolute top-0 left-0 right-0 h-1 bg-blue-600 rounded-t-lg"></div>
        
        {/* Bouton fermer */}
        <Button
          onClick={handleManualClose}
          variant="ghost"
          size="sm"
          className="absolute top-2 right-2 h-6 w-6 p-0 hover:bg-gray-100"
        >
          <X className="h-4 w-4 text-gray-400" />
        </Button>

        {/* Contenu */}
        <div className="flex items-start gap-3 mt-2">
          {/* Icône de vérification */}
          <div className="flex-shrink-0 mt-1">
            <CheckCircle className="h-6 w-6 text-blue-600" />
          </div>

          {/* Contenu principal */}
          <div className="flex-1 pr-6">
            {/* Nom et ville */}
            <div className="flex items-center gap-2 mb-1">
              <span className="font-semibold text-gray-900">{currentReview.name}</span>
              <span className="text-gray-500">•</span>
              <span className="text-gray-600 text-sm">{currentReview.city}</span>
            </div>

            {/* Étoiles */}
            <div className="flex items-center gap-1 mb-2">
              {[...Array(currentReview.rating)].map((_, i) => (
                <Star 
                  key={i} 
                  className="h-4 w-4 fill-yellow-400 text-yellow-400" 
                />
              ))}
            </div>

            {/* Avis */}
            <p className="text-gray-800 text-sm leading-relaxed mb-2">
              "{currentReview.review}"
            </p>

            {/* Temps */}
            <p className="text-gray-500 text-xs">
              {currentReview.time}
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};