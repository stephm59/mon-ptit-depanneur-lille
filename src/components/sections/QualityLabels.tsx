import { Award } from "lucide-react";

const QualityLabels = () => {
  const certifications = [
    {
      name: "RGE – QUALIBAT-RGE",
      logo: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755015245/logo-rge-1_ap9jsc.jpg",
      alt: "Certification RGE QUALIBAT"
    },
    {
      name: "Professionnel du gaz", 
      logo: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755015245/logo-professionnel-gaz-1_x4hijl.jpg",
      alt: "Certification Professionnel du gaz"
    },
    {
      name: "Artisan",
      logo: "https://res.cloudinary.com/dit7nfyiy/image/upload/v1755015245/logo-artisan-1_xfywd6.jpg",
      alt: "Label Artisan"
    }
  ];

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        {/* Header */}
        <div className="text-center mb-16 max-w-4xl mx-auto">
          <div className="flex items-center justify-center gap-3 mb-6">
            <Award className="w-8 h-8 text-primary" />
            <h2 className="text-3xl md:text-4xl font-bold text-foreground">
              Nos labels qualités
            </h2>
          </div>
          <p className="text-lg text-muted-foreground">
            Des certifications officielles qui garantissent notre expertise et votre sérénité
          </p>
        </div>

        {/* Certifications Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl mx-auto">
          {certifications.map((certification, index) => (
            <div 
              key={index}
              className="bg-white p-8 rounded-2xl shadow-lg hover:shadow-xl transition-all duration-300 text-center border border-gray-100"
            >
              {/* Logo */}
              <div className="flex items-center justify-center mb-6 h-24">
                <img 
                  src={certification.logo}
                  alt={certification.alt}
                  className="max-h-20 max-w-full object-contain"
                  loading="lazy"
                />
              </div>
              
              {/* Title */}
              <h3 className="text-xl font-bold text-foreground">
                {certification.name}
              </h3>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default QualityLabels;