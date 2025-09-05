import { ImageIcon } from "lucide-react";

const BeforeAfter = () => {
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
              className="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105"
            >
              <div className="aspect-[4/3] overflow-hidden">
                <img 
                  src={transformation.url}
                  alt={transformation.alt}
                  className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"
                  loading="lazy"
                />
              </div>
              {/* Overlay effect */}
              <div className="absolute inset-0 bg-black/0 group-hover:bg-black/20 transition-all duration-300 flex items-center justify-center">
                <div className="opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  <div className="bg-white/90 backdrop-blur-sm px-4 py-2 rounded-full">
                    <span className="text-primary font-semibold text-sm">Voir la transformation</span>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default BeforeAfter;