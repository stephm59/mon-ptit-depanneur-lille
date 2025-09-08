import { Handshake } from "lucide-react";

const BrandPartners = () => {
  const brandLogos = [
    {
      name: "Vaillant",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071373/logo-vaillant_g0swcc.webp"
    },
    {
      name: "ELM Leblanc",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071373/logo-elm-leblanc_ue3vvd.webp"
    },
    {
      name: "Viessmann",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071374/logo-viessmann_avki0y.webp"
    },
    {
      name: "Atlantic",
      url: "/lovable-uploads/e9fd0773-3ac7-4a67-b9a6-a3121ece566a.png"
    },
    {
      name: "Saunier Duval",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071377/logo-saunier-duval_qnyqkk.webp"
    },
    {
      name: "Frisquet",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071378/logo-frisquet_mi9zho.webp"
    },
    {
      name: "De Dietrich",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071379/logo-de-dietrich_nbtepf.webp"
    },
    {
      name: "Picard Serrures",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071677/logo-picard-serrures_etqogr.webp"
    },
    {
      name: "Vachette",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071678/logo-vachette_onodjj.webp"
    },
    {
      name: "Fichet",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071680/logo-fichet_pthgpr.webp"
    },
    {
      name: "Bricard",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071682/logo-bricard_fa2qzz.webp"
    },
    {
      name: "JPM",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755071683/logo-jpm_ncauva.webp"
    }
  ];

  // Dupliquer les logos pour un défilement infini
  const duplicatedLogos = [...brandLogos, ...brandLogos];

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16 max-w-4xl mx-auto">
          <div className="flex items-center justify-center gap-3 mb-6">
            <Handshake className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Nos marques partenaires
            </h2>
          </div>
          <p className="text-lg text-muted-foreground">
            Nous travaillons avec les plus grandes marques du secteur pour vous garantir des équipements 
            de qualité et des pièces détachées disponibles
          </p>
        </div>

        {/* Carousel avec défilement continu */}
        <div className="mb-12">
          <div className="overflow-hidden">
            <div className="flex gap-12 animate-scroll-continuous">
              {duplicatedLogos.map((logo, index) => (
                <div key={`${logo.name}-${index}`} className="flex-shrink-0 w-56">
                  <div className="flex items-center justify-center h-32">
                    <img 
                      src={logo.url}
                      alt={`Logo ${logo.name}`}
                      className="max-h-28 max-w-56 object-contain transition-all duration-300 hover:scale-110"
                      loading="lazy"
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default BrandPartners;