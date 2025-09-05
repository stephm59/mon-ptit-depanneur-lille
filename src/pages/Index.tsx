import Header from "@/components/layout/Header";
import Hero from "@/components/sections/Hero";
import About from "@/components/sections/About";
import WhyChooseUs from "@/components/sections/WhyChooseUs";
import MediaCoverage from "@/components/sections/MediaCoverage";
import TeamProximity from "@/components/sections/TeamProximity";
import Testimonials from "@/components/sections/Testimonials";
import Footer from "@/components/layout/Footer";

const Index = () => {
  return (
    <div className="min-h-screen">
      <Header />
      <main>
        <Hero />
        <About />
        <WhyChooseUs />
        <MediaCoverage />
        <TeamProximity />
        <Testimonials />
      </main>
      <Footer />
    </div>
  );
};

export default Index;
