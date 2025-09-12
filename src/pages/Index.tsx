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
import { LegalModal } from "@/components/modals/LegalModal";
import { useLegalModal } from "@/hooks/useLegalModal";
import { useEffect } from "react";
import { useLocation } from "react-router-dom";

const Index = () => {
  const { isOpen, openModal, closeModal } = useLegalModal();
  const location = useLocation();

  // Ouvrir la modal si le paramètre ?legal=true est présent
  useEffect(() => {
    const params = new URLSearchParams(location.search);
    if (params.get('legal') === 'true') {
      openModal();
      // Nettoyer l'URL après ouverture de la modal
      window.history.replaceState({}, '', '/');
    }
  }, [location, openModal]);
  return (
    <div className="min-h-screen">
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
      
      <LegalModal isOpen={isOpen} onClose={closeModal} />
    </div>
  );
};

export default Index;
