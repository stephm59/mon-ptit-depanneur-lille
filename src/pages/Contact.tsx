import React from 'react';
import { Helmet } from 'react-helmet';

const Contact = () => {
  return (
    <>
      <Helmet>
        <title>Contact - Mon p'tit Dépanneur</title>
        <meta name="description" content="Contactez Mon p'tit Dépanneur pour tous vos besoins en plomberie, chauffage et serrurerie." />
      </Helmet>
      
      <main className="min-h-screen p-8">
        <h1 className="text-4xl font-bold text-center">
          Page Contact - Test
        </h1>
        <p className="text-center mt-4 text-lg">
          Cette page fonctionne maintenant !
        </p>
      </main>
    </>
  );
};

export default Contact;