import { Award } from "lucide-react";

const QualityLabels = () => {
  const certifications = [
    {
      name: "RGE – QUALIBAT-RGE",
      logo: "/lovable-uploads/05858230-8cb9-41c4-ac57-7030103db388.png",
      alt: "Certification RGE QUALIBAT"
    },
    {
      name: "Professionnel du gaz", 
      logo: "/lovable-uploads/1e6bb0ad-0b6b-4587-8142-96ffc506adc6.png",
      alt: "Certification Professionnel du gaz"
    },
    {
      name: "Artisan",
      logo: "/lovable-uploads/d1edd0f6-ab9a-4b14-95a7-a0bbe5f86f8a.png",
      alt: "Label Artisan"
    }
  ];

  return (
    <section className="py-20 bg-gray-50">
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