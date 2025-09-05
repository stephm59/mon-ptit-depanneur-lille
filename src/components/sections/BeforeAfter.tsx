import { ImageIcon, Search, X } from "lucide-react";
import { useState } from "react";

const BeforeAfter = () => {
  const [selectedImage, setSelectedImage] = useState<string | null>(null);

  const transformations = [
    {
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755069456/avant-apres-7_b4oq8w.webp",
      alt: "Transformation salle de bain 7 - Avant/Après"
    },
    {
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755068815/avant-apres-6_lfp4ij.webp", 
      alt: "Transformation salle de bain 6 - Avant/Après"
    },
    {
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755068727/avant-apres-5_q500yy.webp",
      alt: "Transformation salle de bain 5 - Avant/Après"
    },
    {
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755068656/avant-apres-4_ue3l39.webp",
      alt: "Transformation salle de bain 4 - Avant/Après"
    },
    {
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755068554/avant-apres-3_teciad.webp",
      alt: "Transformation salle de bain 3 - Avant/Après"
    },
    {
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755068440/avant-apres-2_spbeyg.webp",
      alt: "Transformation salle de bain 2 - Avant/Après"
    }
  ];

  return (
    <section className="py-20 bg-gray-50">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16 max-w-4xl mx-auto">
          <div className="flex items-center justify-center gap-3 mb-6">
            <ImageIcon className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Avant / Après
            </h2>
          </div>
          <p className="text-lg text-muted-foreground">
            Découvrez la transformation de nos interventions à travers quelques exemples de nos réalisations
          </p>
        </div>

        {/* Gallery Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-7xl mx-auto">
          {transformations.map((transformation, index) => (
            <div 
              key={index} 
              className="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 cursor-pointer"
              onClick={() => setSelectedImage(transformation.url)}
            >
              <div className="aspect-[4/3] overflow-hidden">
                <img 
                  src={transformation.url}
                  alt={transformation.alt}
                  className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"
                  loading="lazy"
                />
              </div>
              {/* Overlay with magnifying glass */}
              <div className="absolute inset-0 bg-black/0 group-hover:bg-black/40 transition-all duration-300 flex items-center justify-center">
                <div className="opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  <div className="w-16 h-16 bg-white/90 backdrop-blur-sm rounded-full flex items-center justify-center shadow-lg">
                    <Search className="w-8 h-8 text-primary" />
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Image Popup */}
        {selectedImage && (
          <div 
            className="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4"
            onClick={() => setSelectedImage(null)}
          >
            <div className="relative max-w-5xl max-h-[90vh] w-full">
              {/* Close button */}
              <button
                className="absolute top-4 right-4 z-10 w-10 h-10 bg-white/90 backdrop-blur-sm rounded-full flex items-center justify-center shadow-lg hover:bg-white transition-colors"
                onClick={(e) => {
                  e.stopPropagation();
                  setSelectedImage(null);
                }}
              >
                <X className="w-6 h-6 text-gray-800" />
              </button>
              
              {/* Image */}
              <img 
                src={selectedImage}
                alt="Transformation agrandie"
                className="w-full h-full object-contain rounded-lg"
                onClick={(e) => e.stopPropagation()}
              />
            </div>
          </div>
        )}
      </div>
    </section>
  );
};

export default BeforeAfter;