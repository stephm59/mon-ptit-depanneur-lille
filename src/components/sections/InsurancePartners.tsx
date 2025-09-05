import { Shield } from "lucide-react";
import { Card } from "@/components/ui/card";

const InsurancePartners = () => {
  const insuranceLogos = [
    {
      name: "MAAF",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755069971/logo-maaf_tenz9y.webp"
    },
    {
      name: "GAN",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070086/logo-gan_w2jjaj.webp"
    },
    {
      name: "MACIF",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070156/logo-macif_mfohdq.webp"
    },
    {
      name: "Groupama",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070241/logo-groupama_nljtsc.webp"
    },
    {
      name: "MMA",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070321/logo-mma_hy3dni.webp"
    },
    {
      name: "Allianz",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070393/logo-allianz_hri1py.webp"
    },
    {
      name: "AXA",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070449/logo-axa_cafued.webp"
    },
    {
      name: "Generali",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070550/logo-generali_kz3s9b.webp"
    },
    {
      name: "Aviva",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070636/logo-aviva_rpr39j.webp"
    },
    {
      name: "GMF",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070685/logo-gmf_gkanrq.webp"
    },
    {
      name: "MAIF",
      url: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755070749/logo-maif_xztcel.webp"
    }
  ];

  // Dupliquer les logos pour un défilement infini
  const duplicatedLogos = [...insuranceLogos, ...insuranceLogos];

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16 max-w-4xl mx-auto">
          <div className="flex items-center justify-center gap-3 mb-6">
            <Shield className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Nos partenaires assurances
            </h2>
          </div>
          <p className="text-lg text-muted-foreground">
            Nous sommes agréés par plus de 20 compagnies d'assurances pour faciliter vos démarches et 
            vous garantir une prise en charge rapide de vos sinistres
          </p>
        </div>

        {/* Carousel avec défilement continu */}
        <div className="mb-12">
          <div className="overflow-hidden">
            <div className="flex gap-12 animate-scroll-continuous">
              {duplicatedLogos.map((logo, index) => (
                <div key={`${logo.name}-${index}`} className="flex-shrink-0 w-40">
                  <div className="flex items-center justify-center h-24">
                    <img 
                      src={logo.url}
                      alt={`Logo ${logo.name}`}
                      className="max-h-20 max-w-40 object-contain transition-all duration-300 hover:scale-110"
                      loading="lazy"
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Direct Coverage Card */}
        <Card className="max-w-4xl mx-auto p-8 bg-blue-50 border-blue-200">
          <div className="text-center">
            <div className="flex items-center justify-center gap-2 mb-4">
              <Shield className="w-6 h-6 text-primary" />
              <h3 className="text-xl font-bold text-primary">
                Prise en charge directe
              </h3>
            </div>
            <p className="text-muted-foreground leading-relaxed">
              Grâce à nos agréments, nous pouvons intervenir directement sur demande de votre assurance et vous éviter 
              l'avance de frais dans la plupart des cas.
            </p>
          </div>
        </Card>
      </div>
    </section>
  );
};

export default InsurancePartners;