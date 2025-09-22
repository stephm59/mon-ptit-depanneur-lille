import { useState } from "react";
import { X, ChevronLeft, ChevronRight, Camera } from "lucide-react";
import { Button } from "@/components/ui/button";

const PhotoGallery = () => {
  const [selectedImage, setSelectedImage] = useState<number | null>(null);
  
  const photos = [
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-1.webp",
      title: "Rénovation salle de bain moderne",
      description: "Installation complète avec douche à l'italienne"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-2.webp", 
      title: "Salle de bain contemporaine",
      description: "Carrelage haut de gamme et robinetterie design"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-3.webp",
      title: "Rénovation salle d'eau",
      description: "Optimisation de l'espace avec rangements intégrés"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-4.webp",
      title: "Installation sanitaires",
      description: "Pose de WC suspendu et vasque design"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-5.webp",
      title: "Douche italienne",
      description: "Réalisation sur mesure avec évacuation au sol"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-6.webp",
      title: "Salle de bain familiale", 
      description: "Aménagement fonctionnel pour toute la famille"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-7.webp",
      title: "Rénovation complète",
      description: "Transformation totale avec finitions soignées"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-8.webp",
      title: "Salle de bain design",
      description: "Style épuré avec matériaux nobles"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-9.webp",
      title: "Installation moderne",
      description: "Équipements dernière génération"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-10.webp",
      title: "Salle d'eau optimisée",
      description: "Solution gain de place intelligente"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pac-1.webp",
      title: "Installation pompe à chaleur",
      description: "Pompe à chaleur air-eau haute performance"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pac-2.webp",
      title: "Pompe à chaleur extérieure",
      description: "Installation professionnelle en extérieur"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pac-3.webp",
      title: "Système de chauffage PAC",
      description: "Solution écologique et économique"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pac-4.webp",
      title: "Installation PAC complète",
      description: "Mise en service et raccordements"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/pac-5.webp",
      title: "Pompe à chaleur moderne",
      description: "Technologie dernière génération"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/chaudiere.webp",
      title: "Installation chaudière",
      description: "Chaudière gaz haute efficacité"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/chaudiere-2.webp",
      title: "Chaudière condensation",
      description: "Installation avec évacuation optimisée"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/chaudiere-3.webp",
      title: "Système de chauffage",
      description: "Raccordement professionnel"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/climatisation-1.webp",
      title: "Installation climatisation",
      description: "Climatiseur split mural"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/climatisation-2.webp",
      title: "Unité intérieure clim",
      description: "Design discret et performant"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/climatisation-3.webp",
      title: "Climatisation réversible",
      description: "Chauffage et rafraîchissement"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/climatisation-4.webp",
      title: "Installation clim murale",
      description: "Pose professionnelle sur mesure"
    },
    {
      url: "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/climatisation-5.webp",
      title: "Système climatisation",
      description: "Solution complète de confort"
    }
  ];

  const openModal = (index: number) => {
    setSelectedImage(index);
  };

  const closeModal = () => {
    setSelectedImage(null);
  };

  const previousImage = () => {
    if (selectedImage !== null) {
      setSelectedImage(selectedImage > 0 ? selectedImage - 1 : photos.length - 1);
    }
  };

  const nextImage = () => {
    if (selectedImage !== null) {
      setSelectedImage(selectedImage < photos.length - 1 ? selectedImage + 1 : 0);
    }
  };

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Camera className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Nos réalisations
            </h2>
          </div>
          <p className="text-lg text-muted-foreground max-w-3xl mx-auto">
            Découvrez quelques-unes de nos plus belles réalisations de salles de bain dans la région lilloise.
          </p>
        </div>

        {/* Photo Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 max-w-7xl mx-auto">
          {photos.map((photo, index) => (
            <div
              key={index}
              className="group relative aspect-square overflow-hidden rounded-lg shadow-md hover:shadow-xl transition-all duration-300 cursor-pointer"
              onClick={() => openModal(index)}
            >
              <img
                src={photo.url}
                alt={photo.title}
                className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                <div className="absolute bottom-4 left-4 right-4 text-white">
                  <h3 className="font-bold text-sm mb-1">{photo.title}</h3>
                  <p className="text-xs text-white/90">{photo.description}</p>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Modal */}
        {selectedImage !== null && (
          <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/90" onClick={closeModal}>
            <div className="relative max-w-4xl max-h-[90vh] mx-4">
              {/* Close Button */}
              <Button
                variant="outline"
                size="icon"
                className="absolute -top-12 right-0 bg-white/20 border-white/30 text-white hover:bg-white/30 z-10"
                onClick={closeModal}
              >
                <X className="w-5 h-5" />
              </Button>

              {/* Navigation Buttons */}
              <Button
                variant="outline"
                size="icon"
                className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/20 border-white/30 text-white hover:bg-white/30 z-10"
                onClick={(e) => {
                  e.stopPropagation();
                  previousImage();
                }}
              >
                <ChevronLeft className="w-5 h-5" />
              </Button>

              <Button
                variant="outline"
                size="icon"
                className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/20 border-white/30 text-white hover:bg-white/30 z-10"
                onClick={(e) => {
                  e.stopPropagation();
                  nextImage();
                }}
              >
                <ChevronRight className="w-5 h-5" />
              </Button>

              {/* Image */}
              <img
                src={photos[selectedImage].url}
                alt={photos[selectedImage].title}
                className="w-full h-auto max-h-[90vh] object-contain rounded-lg"
                onClick={(e) => e.stopPropagation()}
              />

              {/* Image Info */}
              <div className="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/80 to-transparent p-6 text-white rounded-b-lg">
                <h3 className="text-xl font-bold mb-2">{photos[selectedImage].title}</h3>
                <p className="text-white/90">{photos[selectedImage].description}</p>
              </div>
            </div>
          </div>
        )}
      </div>
    </section>
  );
};

export default PhotoGallery;