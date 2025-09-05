import { useParams } from "react-router-dom";
import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { ServiceCityHero } from "@/components/sections/ServiceCityHero";
import { ServiceCityIntro } from "@/components/sections/ServiceCityIntro";
import { ServiceCityOffers } from "@/components/sections/ServiceCityOffers";
import { CtaBlock } from "@/components/sections/CtaBlock";
import MediaCoverage from "@/components/sections/MediaCoverage";
import { ServiceCityTestimonials } from "@/components/sections/ServiceCityTestimonials";
import WhyChooseUs from "@/components/sections/WhyChooseUs";
import TeamProximity from "@/components/sections/TeamProximity";
import InsurancePartners from "@/components/sections/InsurancePartners";
import { ServiceCityFaqs } from "@/components/sections/ServiceCityFaqs";
import { ServiceCityZones } from "@/components/sections/ServiceCityZones";
import BeforeAfter from "@/components/sections/BeforeAfter";
import QualityLabels from "@/components/sections/QualityLabels";
import BrandPartners from "@/components/sections/BrandPartners";
import { ServiceCityBlog } from "@/components/sections/ServiceCityBlog";
import { useServiceCityPage } from "@/hooks/useServiceCityPage";
import { Loading } from "@/components/ui/loading";

export default function ServiceCity() {
  const { combinedSlug } = useParams<{
    combinedSlug: string;
  }>();

  // Parse combined slug (e.g., "plombier-lille" -> "plombier" + "lille")
  const [serviceSlug, citySlug] = combinedSlug?.split('-', 2) || ['', ''];

  const { data: page, isLoading, error } = useServiceCityPage(
    serviceSlug,
    citySlug
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
        <link rel="canonical" href={`/${combinedSlug}`} />
      </Helmet>

      <div className="min-h-screen bg-background">
        <Header />
        
        <main>
          {/* 1. Hero avec vidéo background + 4 blocs de réassurance */}
          <ServiceCityHero page={page} />
          
          {/* 2. Introduction personnalisée à Service + ville */}
          <ServiceCityIntro page={page} />
          
          {/* 3. Nos prestations à Service + ville */}
          <ServiceCityOffers pageId={page.id} />
          
          {/* 4. Bloc avec CTA */}
          <CtaBlock 
            title="Besoin d'une intervention ?" 
            subtitle="Contactez-nous pour un devis gratuit et sans engagement"
          />
          
          {/* 5. AU JT de M6 */}
          <MediaCoverage />
          
          {/* 6. Ce que disent nos clients */}
          <ServiceCityTestimonials 
            serviceId={page.service_id} 
            cityId={page.city_id} 
          />
          
          {/* 7. Pourquoi choisir Mon p'tit Dépanneur */}
          <WhyChooseUs />
          
          {/* 8. Un service de proximité et de confiance */}
          <TeamProximity />
          
          {/* 9. Nos partenaires assurances */}
          <InsurancePartners />
          
          {/* 10. FAQ adaptée à Service + ville */}
          <ServiceCityFaqs 
            serviceId={page.service_id} 
            cityId={page.city_id} 
          />
          
          {/* 11. Bloc CTA */}
          <CtaBlock 
            title="Prêt à faire appel à nos services ?" 
            subtitle="Demandez votre devis personnalisé dès maintenant"
          />
          
          {/* 12. Zone d'intervention */}
          {page.zones_text && (
            <ServiceCityZones 
              zonesText={page.zones_text}
              cityName={page.cities.name}
            />
          )}
          
          {/* 13. Section Avant / Après */}
          <BeforeAfter />
          
          {/* 14. Nos labels qualités */}
          <QualityLabels />
          
          {/* 15. Nos marques partenaires */}
          <BrandPartners />
          
          {/* 16. Les bons conseils de Mon p'tit Dépanneur */}
          <ServiceCityBlog serviceId={page.service_id} />
        </main>

        <Footer />
      </div>
    </>
  );
}