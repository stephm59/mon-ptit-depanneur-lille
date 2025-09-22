import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Hero from "@/components/sections/Hero";
import ReviewsGrid from "@/components/sections/ReviewsGrid";
import PhotoGallery from "@/components/sections/PhotoGallery";
import { CtaBlock } from "@/components/sections/CtaBlock";
import Footer from "@/components/layout/Footer";

const Avis = () => {
  return (
    <>
      <Helmet>
        <title>Nos (jolies) réalisations, vos avis | Mon P&#039;tit Dépanneur</title>
        <meta name="description" content="Salles des bains, de douches, installations, réparations... Voici quelqu&#039;unes de nos réalisations et les avis de nos clients." />
        <meta name="keywords" content="avis clients lille, témoignages plombier, photos réalisations, salle de bain lille" />
        <link rel="canonical" href="https://www.monptitdepanneur.fr/avis" />
      </Helmet>

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