import React from 'react';
import { Helmet } from 'react-helmet';
import Header from "@/components/layout/Header";
import Hero from "@/components/sections/Hero";
import ContactFormSection from "@/components/sections/ContactFormSection";
import ContactAddress from "@/components/sections/ContactAddress";
import ContactMap from "@/components/sections/ContactMap";
import { CtaBlock } from "@/components/sections/CtaBlock";
import Footer from "@/components/layout/Footer";
import { FixedCallButton } from "@/components/widgets/FixedCallButton";

const Contact = () => {
  return (
    <>
      <Helmet>
        <title>Contact - Mon p'tit Dépanneur | Plombier Chauffagiste Lille</title>
        <meta name="description" content="Contactez Mon p'tit Dépanneur, votre artisan de confiance à Lille. Devis gratuit, intervention rapide pour plomberie, chauffage, serrurerie et vitrerie." />
        <meta name="keywords" content="contact, plombier lille, chauffagiste lille, devis gratuit, dépanneur lille" />
        <link rel="canonical" href="https://www.monptitdepanneur.fr/contact" />
      </Helmet>
      
      <div className="min-h-screen">
        <Header />
        <main>
          <Hero 
            title="Contactez Mon p'tit Dépanneur, votre artisan de confiance"
            subtitle="Devis gratuit • Intervention rapide • Travaux garantis"
          />
          <ContactFormSection />
          <ContactAddress />
          <ContactMap />
          <CtaBlock />
        </main>
        <Footer />
        <FixedCallButton />
      </div>
    </>
  );
};

export default Contact;