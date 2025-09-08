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

const Index = () => {
  return (
    <div className="min-h-screen">
      <Header />
      <main>
        <Hero />
        <About />
        <MediaCoverage />
        <WhyChooseUs />
        <HomeServices />
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
    </div>
  );
};

export default Index;
