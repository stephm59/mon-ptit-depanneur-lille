import React from 'react';
import { Helmet } from 'react-helmet';

const Contact = () => {
  console.log("=== CONTACT PAGE - MINIMAL VERSION ===");
  
  return (
    <>
      <Helmet>
        <title>Contact - Mon p'tit Dépanneur | Chauffagiste, Plombier, Serrurier Lille</title>
        <meta name="description" content="Contactez Mon p'tit Dépanneur pour tous vos besoins en plomberie, chauffage et serrurerie à Lille. Devis gratuit, intervention rapide." />
      </Helmet>
      
      <main className="min-h-screen">
        {/* Hero Section */}
        <section className="py-16 px-4" style={{
          background: 'linear-gradient(135deg, hsl(221, 83%, 53%), hsl(262, 83%, 58%))',
          color: 'white'
        }}>
          <div className="container mx-auto">
            <div className="max-w-4xl mx-auto text-center">
              <h1 className="text-4xl md:text-6xl font-bold mb-6">
                Contactez-nous
              </h1>
              <p className="text-xl md:text-2xl mb-8 opacity-90">
                Une urgence ? Un devis ? Nous sommes là pour vous aider
              </p>
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <button className="bg-white text-blue-600 px-8 py-4 rounded-lg text-lg font-semibold hover:bg-gray-100 transition-colors">
                  Demander un devis gratuit
                </button>
                <a 
                  href="tel:0328534868"
                  className="bg-red-600 hover:bg-red-700 text-white px-8 py-4 rounded-lg text-lg font-semibold transition-colors inline-block"
                >
                  📞 03 28 53 48 68
                </a>
              </div>
            </div>
          </div>
        </section>
        
        {/* Simple content to test */}
        <section className="py-16 px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Page de contact en construction</h2>
          <p className="text-xl text-gray-600">
            Cette version minimaliste permet de tester la page progressivement.
          </p>
        </section>
      </main>
    </>
  );
};

export default Contact;