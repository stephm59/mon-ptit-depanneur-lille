import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { FixedCallButton } from "@/components/widgets/FixedCallButton";

const MentionsLegales = () => {
  return (
    <>
      <Helmet>
        <title>Mentions légales - Mon p'tit Dépanneur</title>
        <meta name="description" content="Mentions légales du site Mon p'tit Dépanneur. Informations sur l'éditeur, l'hébergeur et les conditions d'utilisation." />
        <link rel="canonical" href="https://monptitdepanneur.fr/mentions-legales" />
      </Helmet>

      <Header />
      
      <main className="min-h-screen bg-gray-50 py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto bg-white p-8 rounded-lg shadow-lg">
            <h1 className="text-4xl font-bold mb-8">Mentions légales</h1>
            
            <div className="space-y-8">
              <section>
                <h2 className="text-2xl font-semibold mb-4">Éditeur du site</h2>
                <p className="mb-2"><strong>Raison sociale :</strong> Mon p'tit Dépanneur</p>
                <p className="mb-2"><strong>Adresse :</strong> 21 Rue Edouard Delesalle, 59000 Lille</p>
                <p className="mb-2"><strong>Téléphone :</strong> 03 28 53 48 68</p>
                <p className="mb-2"><strong>Email :</strong> contact@monptitdepanneur.fr</p>
              </section>

              <section>
                <h2 className="text-2xl font-semibold mb-4">Hébergement</h2>
                <p className="mb-2">Le site est hébergé par :</p>
                <p className="mb-2"><strong>Hébergeur :</strong> À définir</p>
                <p className="mb-2"><strong>Adresse :</strong> À définir</p>
              </section>

              <section>
                <h2 className="text-2xl font-semibold mb-4">Propriété intellectuelle</h2>
                <p className="text-gray-600 leading-relaxed">
                  Le contenu de ce site web (textes, images, graphismes, logo, icônes, sons, logiciels) 
                  est la propriété exclusive de Mon p'tit Dépanneur, à l'exception des marques, 
                  logos ou contenus appartenant à d'autres sociétés partenaires ou auteurs.
                </p>
                <p className="text-gray-600 leading-relaxed mt-4">
                  Toute reproduction, représentation, modification, publication, adaptation de tout ou 
                  partie des éléments du site, quel que soit le moyen ou le procédé utilisé, est interdite, 
                  sauf autorisation écrite préalable de Mon p'tit Dépanneur.
                </p>
              </section>

              <section>
                <h2 className="text-2xl font-semibold mb-4">Données personnelles</h2>
                <p className="text-gray-600 leading-relaxed">
                  Conformément au Règlement Général sur la Protection des Données (RGPD), vous disposez 
                  d'un droit d'accès, de rectification, de suppression et d'opposition au traitement de 
                  vos données personnelles.
                </p>
                <p className="text-gray-600 leading-relaxed mt-4">
                  Pour exercer ces droits ou pour toute question sur le traitement de vos données, 
                  vous pouvez nous contacter à l'adresse : contact@monptitdepanneur.fr
                </p>
              </section>

              <section>
                <h2 className="text-2xl font-semibold mb-4">Cookies</h2>
                <p className="text-gray-600 leading-relaxed">
                  Ce site utilise des cookies techniques nécessaires au bon fonctionnement du site. 
                  Ces cookies ne stockent aucune information personnelle identifiable.
                </p>
              </section>

              <section>
                <h2 className="text-2xl font-semibold mb-4">Responsabilité</h2>
                <p className="text-gray-600 leading-relaxed">
                  Mon p'tit Dépanneur s'efforce de fournir sur le site des informations aussi précises 
                  que possible. Toutefois, il ne pourra être tenu responsable des omissions, des inexactitudes 
                  et des carences dans la mise à jour, qu'elles soient de son fait ou du fait des tiers 
                  partenaires qui lui fournissent ces informations.
                </p>
              </section>

              <section>
                <h2 className="text-2xl font-semibold mb-4">Droit applicable</h2>
                <p className="text-gray-600 leading-relaxed">
                  Les présentes mentions légales sont régies par le droit français. 
                  Tout litige sera soumis aux tribunaux compétents de Lille.
                </p>
              </section>
            </div>
            
            <div className="mt-8 pt-8 border-t border-gray-200">
              <p className="text-sm text-gray-500">
                Dernière mise à jour : {new Date().toLocaleDateString('fr-FR')}
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

export default MentionsLegales;