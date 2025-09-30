import { SEOHead } from "@/components/seo/SEOHead";
import Header from "@/components/layout/Header";
import Hero from "@/components/sections/Hero";
import ReviewsGrid from "@/components/sections/ReviewsGrid";
import PhotoGallery from "@/components/sections/PhotoGallery";
import { CtaBlock } from "@/components/sections/CtaBlock";
import Footer from "@/components/layout/Footer";

const Avis = () => {
  return (
    <>
      <SEOHead
        title="Nos (jolies) réalisations, vos avis | Mon P'tit Dépanneur"
        description="Salles des bains, de douches, installations, réparations... Voici quelqu'unes de nos réalisations et les avis de nos clients."
        canonical="/avis"
        keywords="avis clients lille, témoignages plombier, photos réalisations, salle de bain lille"
      />

      <Header />
      
      <Hero 
        title="Avis clients et photos"
        subtitle="Découvrez les témoignages authentiques de nos clients et les photos de nos interventions à Lille et ses environs"
      />
      
      <main>
        <ReviewsGrid />
        <PhotoGallery />
        <CtaBlock 
          title="Rejoignez nos clients satisfaits"
          subtitle="Plus de 600 avis positifs témoignent de notre savoir-faire. À votre tour de nous faire confiance !"
        />
      </main>
      
      <Footer />
    </>
  );
};

export default Avis;