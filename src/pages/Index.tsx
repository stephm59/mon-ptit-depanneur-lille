import Header from "@/components/layout/Header";
import Hero from "@/components/sections/Hero";
import About from "@/components/sections/About";
import WhyChooseUs from "@/components/sections/WhyChooseUs";
import MediaCoverage from "@/components/sections/MediaCoverage";
import TeamProximity from "@/components/sections/TeamProximity";
import InsurancePartners from "@/components/sections/InsurancePartners";
import BeforeAfter from "@/components/sections/BeforeAfter";
import QualityLabels from "@/components/sections/QualityLabels";
import BrandPartners from "@/components/sections/BrandPartners";
import BlogAdvice from "@/components/sections/BlogAdvice";
import ServiceAreas from "@/components/sections/ServiceAreas";
import Testimonials from "@/components/sections/Testimonials";
import { HomeServices } from "@/components/sections/HomeServices";
import Footer from "@/components/layout/Footer";
import { FixedCallButton } from "@/components/widgets/FixedCallButton";
import { SEOHead } from "@/components/seo/SEOHead";
import { generateHomeJsonLd } from "@/utils/jsonld";

const Index = () => {
  return (
    <div className="min-h-screen">
      <SEOHead
        title="Mon p'tit Dépanneur : Chauffagiste, Serrurier, Plombier (Lille)"
        description="Une chaudière à changer ? Une serrure à remplacer ? Une fuite d'eau à réparer ? Pour toute urgence : Mon p'tit Dépanneur (03 28 53 48 68)"
        canonical="/"
        keywords="plombier lille, chauffagiste lille, serrurier lille, dépannage lille, pompe à chaleur lille"
        jsonLd={generateHomeJsonLd()}
      />
      <Header />
      <main>
        <Hero />
        <About />
        <HomeServices />
        <MediaCoverage />
        <WhyChooseUs />
        <TeamProximity />
        <Testimonials />
        <InsurancePartners />
        <BeforeAfter />
        <QualityLabels />
        <BrandPartners />
        <BlogAdvice />
        <ServiceAreas />
      </main>
      <Footer />
      <FixedCallButton />
    </div>
  );
};

export default Index;
