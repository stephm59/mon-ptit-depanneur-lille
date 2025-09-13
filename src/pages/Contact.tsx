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
        <title>Comment contacter Mon p'tit Dépanneur ? (Mail et téléphone)</title>
        <meta name="description" content="Contactez facilement Mon p'tit Dépanneur à Lille : téléphone 03 28 53 48 68, email ou formulaire en ligne. Devis gratuit et intervention rapide en moins d'1h." />
        <meta name="keywords" content="contact, plombier lille, chauffagiste lille, devis gratuit, dépanneur lille" />
        <link rel="canonical" href="https://www.monptitdepanneur.fr/contact" />
      </Helmet>
      
      <div className="min-h-screen">
        <Header />
        <main>
          <Hero 
            title="Contactez-nous"
            subtitle="Devis gratuit • Intervention rapide • Travaux garantis"
          />
          <div className="pt-12">
            <ContactFormSection />
          </div>
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