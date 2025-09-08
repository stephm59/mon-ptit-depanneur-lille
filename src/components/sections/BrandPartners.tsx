import { Handshake } from "lucide-react";
import { LogoImage } from "@/components/ui/logo-image";

const BrandPartners = () => {
  const brandLogos = [
    {
      name: "Vaillant",
      url: "/lovable-uploads/7c27558a-585e-487a-a65a-eb753569819a.png"
    },
    {
      name: "ELM Leblanc",
      url: "/lovable-uploads/600e2f3c-90d4-4d0d-b6f1-bc7fa6d0df43.png"
    },
    {
      name: "Viessmann",
      url: "/lovable-uploads/f0a1c697-e1cf-4b87-8f91-955c7d296651.png"
    },
    {
      name: "Atlantic",
      url: "/lovable-uploads/e9fd0773-3ac7-4a67-b9a6-a3121ece566a.png"
    },
    {
      name: "Saunier Duval",
      url: "/lovable-uploads/5941c411-ff3d-466d-9f69-7dee22725955.png"
    },
    {
      name: "Frisquet",
      url: "/lovable-uploads/c459f3f6-53a2-476f-911f-3503735afc7b.png"
    },
    {
      name: "De Dietrich",
      url: "/lovable-uploads/1c91b80d-9472-4d96-8eec-6bdebb78562d.png"
    },
    {
      name: "Picard Serrures",
      url: "/lovable-uploads/9e84eab8-6740-44bb-ad2b-837f71e2c0d7.png"
    },
    {
      name: "Vachette",
      url: "/lovable-uploads/83044c8b-4928-4244-b395-3eec04874d6b.png"
    },
    {
      name: "Fichet",
      url: "/lovable-uploads/d123f701-58fe-402f-9076-450f1d13ca4f.png"
    },
    {
      name: "Bricard",
      url: "/lovable-uploads/8ffaf83d-5ea1-417e-b3cf-42f3d7d822b8.png"
    },
    {
      name: "JPM",
      url: "/lovable-uploads/b214e838-74f7-4d82-9bd9-f7438566255c.png"
    }
  ];

  // Dupliquer les logos pour un défilement infini
  const duplicatedLogos = [...brandLogos, ...brandLogos];

  return (
    <section className="pt-20 pb-6 bg-background">
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
              <div key={`${logo.name}-${index}`} className="flex-shrink-0 w-112">
                <div className="flex items-center justify-center h-64">
                    <LogoImage 
                      src={logo.url}
                      alt={`Logo ${logo.name}`}
                      className="max-h-56 max-w-112 object-contain"
                      fallbackText={logo.name}
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