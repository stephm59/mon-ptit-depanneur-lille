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
          
          {/* 2. Introduction personnalisée à Service + ville - BLANC */}
          <ServiceCityIntro page={page} />
          
          {/* 3. Nos prestations à Service + ville - GRIS */}
          <div className="bg-muted/50">
            <ServiceCityOffers pageId={page.id} />
          </div>
          
          {/* 4. Bloc avec CTA - GARDE SA COULEUR (BLEU) */}
          <CtaBlock 
            title="Besoin d'une intervention ?" 
            subtitle="Contactez-nous pour un devis gratuit et sans engagement"
          />
          
          {/* 5. AU JT de M6 - GARDE SA COULEUR (BLEU) */}
          <MediaCoverage />
          
          {/* 6. Ce que disent nos clients - BLANC */}
          <ServiceCityTestimonials 
            serviceId={page.service_id} 
            cityId={page.city_id} 
          />
          
          {/* 7. Pourquoi choisir Mon p'tit Dépanneur - GRIS */}
          <div className="bg-muted/50">
            <WhyChooseUs />
          </div>
          
          {/* 8. Un service de proximité et de confiance - BLANC */}
          <TeamProximity />
          
          {/* 9. Nos partenaires assurances - GRIS */}
          <div className="bg-muted/50">
            <InsurancePartners />
          </div>
          
          {/* 10. FAQ adaptée à Service + ville - BLANC */}
          <ServiceCityFaqs 
            serviceId={page.service_id} 
            cityId={page.city_id} 
          />
          
          {/* 11. Bloc CTA - GARDE SA COULEUR (BLEU) */}
          <CtaBlock 
            title="Prêt à faire appel à nos services ?" 
            subtitle="Demandez votre devis personnalisé dès maintenant"
          />
          
          {/* 12. Zone d'intervention - GRIS */}
          {page.zones_text && (
            <div className="bg-muted/50">
              <ServiceCityZones 
                zonesText={page.zones_text}
                cityName={page.cities.name}
              />
            </div>
          )}
          
          {/* 13. Section Avant / Après - BLANC */}
          <BeforeAfter />
          
          {/* 14. Nos labels qualités - GRIS */}
          <div className="bg-muted/50">
            <QualityLabels />
          </div>
          
          {/* 15. Nos marques partenaires - BLANC */}
          <BrandPartners />
          
          {/* 16. Les bons conseils de Mon p'tit Dépanneur - GRIS */}
          <div className="bg-muted/50">
            <ServiceCityBlog serviceId={page.service_id} />
          </div>
        </main>

        <Footer />
      </div>
    </>
  );
}