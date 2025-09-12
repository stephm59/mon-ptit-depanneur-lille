import { useState, useEffect } from "react";
import { CheckCircle, X, Star } from "lucide-react";
import { Button } from "@/components/ui/button";

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
  const [currentReview, setCurrentReview] = useState(localReviews[0]);
  const [isVisible, setIsVisible] = useState(false);
  const [isClosing, setIsClosing] = useState(false);
  const [isDisabled, setIsDisabled] = useState(false);

  useEffect(() => {
    if (isDisabled) return;

    let showTimeout: NodeJS.Timeout;
    let hideTimeout: NodeJS.Timeout;

    const showNextReview = () => {
      // Sélectionner un avis aléatoire
      const randomReview = localReviews[Math.floor(Math.random() * localReviews.length)];
      setCurrentReview(randomReview);
      setIsVisible(true);
      setIsClosing(false);

      // Masquer après 3 secondes
      hideTimeout = setTimeout(() => {
        handleAutoClose();
      }, 3000);
    };

    // Première apparition après 3 secondes
    showTimeout = setTimeout(() => {
      showNextReview();
    }, 3000);

    // Puis un nouvel avis toutes les 8 secondes (3s d'affichage + 5s d'attente)
    const interval = setInterval(() => {
      if (!isVisible && !isDisabled) {
        showNextReview();
      }
    }, 8000);

    return () => {
      clearTimeout(showTimeout);
      clearTimeout(hideTimeout);
      clearInterval(interval);
    };
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
  };

  if (!isVisible || isDisabled) return null;

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