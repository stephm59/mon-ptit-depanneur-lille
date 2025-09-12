import React from 'react';

const Contact = () => {
  console.log("=== CONTACT PAGE - LOADED SUCCESSFULLY ===");
  
  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="container mx-auto px-4">
        <h1 className="text-4xl font-bold text-center mb-8 text-gray-900">
          Page Contact - Fonctionne !
        </h1>
        <div className="bg-white p-8 rounded-lg shadow-lg max-w-2xl mx-auto">
          <p className="text-lg text-center text-gray-700 mb-4">
            ✅ La page Contact se charge maintenant correctement !
          </p>
          <p className="text-sm text-center text-gray-500">
            Le problème de routage a été résolu - la route /contact a maintenant la priorité sur /:slug
          </p>
        </div>
      </div>
    </div>
  );
};

export default Contact;