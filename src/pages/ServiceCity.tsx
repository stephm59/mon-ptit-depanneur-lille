import { useParams } from "react-router-dom";
import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { ServiceCityHero } from "@/components/sections/ServiceCityHero";
import { ServiceCityOffers } from "@/components/sections/ServiceCityOffers";
import { ServiceCityTestimonials } from "@/components/sections/ServiceCityTestimonials";
import { ServiceCityFaqs } from "@/components/sections/ServiceCityFaqs";
import { ServiceCityZones } from "@/components/sections/ServiceCityZones";
import { ServiceCityBlog } from "@/components/sections/ServiceCityBlog";
import { useServiceCityPage } from "@/hooks/useServiceCityPage";
import { Loading } from "@/components/ui/loading";

export default function ServiceCity() {
  const { serviceSlug, citySlug } = useParams<{
    serviceSlug: string;
    citySlug: string;
  }>();

  const { data: page, isLoading, error } = useServiceCityPage(
    serviceSlug || "",
    citySlug || ""
  );

  if (isLoading) return <Loading />;

  if (error || !page) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-foreground mb-2">Page non trouvée</h1>
          <p className="text-muted-foreground">
            Cette page service + ville n'existe pas ou n'est pas publiée.
          </p>
        </div>
      </div>
    );
  }

  return (
    <>
      <Helmet>
        <title>{page.meta_title || `${page.services.name} à ${page.cities.name}`}</title>
        <meta 
          name="description" 
          content={page.meta_description || `Services de ${page.services.name} à ${page.cities.name} - ${page.cta_subtitle}`} 
        />
        <meta property="og:title" content={page.meta_title || `${page.services.name} à ${page.cities.name}`} />
        <meta property="og:description" content={page.meta_description || `Services de ${page.services.name} à ${page.cities.name}`} />
        <link rel="canonical" href={`/${serviceSlug}/${citySlug}`} />
      </Helmet>

      <div className="min-h-screen bg-background">
        <Header />
        
        <main>
          <ServiceCityHero page={page} />
          <ServiceCityOffers pageId={page.id} />
          <ServiceCityTestimonials 
            serviceId={page.service_id} 
            cityId={page.city_id} 
          />
          <ServiceCityFaqs 
            serviceId={page.service_id} 
            cityId={page.city_id} 
          />
          {page.zones_text && (
            <ServiceCityZones 
              zonesText={page.zones_text}
              cityName={page.cities.name}
            />
          )}
          <ServiceCityBlog serviceId={page.service_id} />
        </main>

        <Footer />
      </div>
    </>
  );
}