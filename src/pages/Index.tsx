import Header from "@/components/layout/Header";
import Hero from "@/components/sections/Hero";
import About from "@/components/sections/About";
import Testimonials from "@/components/sections/Testimonials";
import Footer from "@/components/layout/Footer";

const Index = () => {
  return (
    <div className="min-h-screen">
      <Header />
      <main>
        <Hero />
        <About />
        <Testimonials />
      </main>
      <Footer />
    </div>
  );
};

export default Index;
