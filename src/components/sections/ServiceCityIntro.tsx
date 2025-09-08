interface ServiceCityIntroProps {
  page: {
    h2_intro?: string | null;
    intro_description?: string | null;
    services: { name: string };
    cities: { name: string };
  };
}

export const ServiceCityIntro = ({ page }: ServiceCityIntroProps) => {
  return (
    <section className="pt-32 pb-16 bg-background">
      <div className="container mx-auto px-6">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-8 text-foreground">
            {page.h2_intro || `${page.services.name} à ${page.cities.name} : notre expertise à votre service`}
          </h2>
          
          {page.intro_description && (
            <div className="text-lg text-muted-foreground leading-relaxed space-y-4">
              <p>{page.intro_description}</p>
            </div>
          )}
        </div>
      </div>
    </section>
  );
};