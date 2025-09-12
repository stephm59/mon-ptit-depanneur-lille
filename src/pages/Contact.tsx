import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { FixedCallButton } from "@/components/widgets/FixedCallButton";

const Contact = () => {
  return (
    <>
      <Helmet>
        <title>Contact - Devis gratuit - Mon p'tit Dépanneur Lille</title>
        <meta name="description" content="Contactez Mon p'tit Dépanneur pour un devis gratuit. Plombier, chauffagiste, serrurier, vitrier à Lille. Intervention rapide et professionnelle." />
      </Helmet>

      <Header />
      
      <main className="min-h-screen bg-gray-50 py-32">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto">
            <h1 className="text-4xl font-bold text-center mb-8">Contactez-nous</h1>
            <div className="bg-white p-8 rounded-lg shadow-lg">
              <p className="text-lg text-center">
                Page de contact temporaire - en cours de diagnostic
              </p>
            </div>
          </div>
        </div>
      </main>
      
      <Footer />
      <FixedCallButton />
    </>
  );
};

export default Contact;