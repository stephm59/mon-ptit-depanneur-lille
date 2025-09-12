import { Helmet } from "react-helmet";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { CheckCircle, Users, Clock, Shield } from "lucide-react";

const NotreSociete = () => {
  return (
    <>
      <Helmet>
        <title>Notre société - Mon p'tit Dépanneur</title>
        <meta name="description" content="Découvrez Mon p'tit Dépanneur, votre artisan de confiance à Lille depuis plus de 10 ans. Une équipe d'experts qualifiés pour tous vos travaux." />
        <link rel="canonical" href="https://monptitdepanneur.fr/notre-societe" />
      </Helmet>

      <Header />
      
      <main className="min-h-screen bg-gray-50">
        {/* Hero Section */}
        <section className="bg-primary text-white py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto text-center">
              <h1 className="text-4xl font-bold mb-6">Notre société</h1>
              <p className="text-xl">
                Mon p'tit Dépanneur, votre partenaire de confiance pour tous vos travaux
              </p>
            </div>
          </div>
        </section>

        {/* About Section */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <div className="grid md:grid-cols-2 gap-12 items-center">
                <div>
                  <h2 className="text-3xl font-bold mb-6">Qui sommes-nous ?</h2>
                  <p className="text-gray-600 mb-4">
                    Depuis plus de 10 ans, Mon p'tit Dépanneur accompagne les particuliers et professionnels 
                    de Lille et ses environs dans tous leurs travaux de plomberie, chauffage, serrurerie et vitrerie.
                  </p>
                  <p className="text-gray-600 mb-4">
                    Notre équipe d'artisans qualifiés met son expertise au service de votre confort et de votre sécurité, 
                    avec un engagement fort pour la qualité et la satisfaction client.
                  </p>
                  <p className="text-gray-600">
                    Nous intervenons rapidement, proposons des devis gratuits et garantissons tous nos travaux 
                    pour vous offrir une tranquillité d'esprit totale.
                  </p>
                </div>
                <div className="bg-white p-8 rounded-lg shadow-lg">
                  <img 
                    src="/lovable-uploads/83044c8b-4928-4244-b395-3eec04874d6b.png" 
                    alt="Équipe Mon p'tit Dépanneur" 
                    className="w-full h-64 object-cover rounded-lg"
                  />
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Values Section */}
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <div className="max-w-6xl mx-auto">
              <h2 className="text-3xl font-bold text-center mb-12">Nos valeurs</h2>
              <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
                <div className="text-center">
                  <CheckCircle className="w-12 h-12 text-primary mx-auto mb-4" />
                  <h3 className="text-xl font-semibold mb-2">Qualité</h3>
                  <p className="text-gray-600">
                    Nous utilisons uniquement des matériaux de qualité et respectons les normes en vigueur.
                  </p>
                </div>
                
                <div className="text-center">
                  <Clock className="w-12 h-12 text-primary mx-auto mb-4" />
                  <h3 className="text-xl font-semibold mb-2">Rapidité</h3>
                  <p className="text-gray-600">
                    Intervention rapide pour vos urgences, disponibilité 7j/7 pour les dépannages.
                  </p>
                </div>
                
                <div className="text-center">
                  <Users className="w-12 h-12 text-primary mx-auto mb-4" />
                  <h3 className="text-xl font-semibold mb-2">Proximité</h3>
                  <p className="text-gray-600">
                    Une équipe locale qui connaît votre région et s'adapte à vos besoins spécifiques.
                  </p>
                </div>
                
                <div className="text-center">
                  <Shield className="w-12 h-12 text-primary mx-auto mb-4" />
                  <h3 className="text-xl font-semibold mb-2">Confiance</h3>
                  <p className="text-gray-600">
                    Transparence des prix, devis gratuits et garantie sur tous nos travaux.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Services Section */}
        <section className="py-16">
          <div className="container mx-auto px-4">
            <div className="max-w-4xl mx-auto">
              <h2 className="text-3xl font-bold text-center mb-12">Nos domaines d'expertise</h2>
              <div className="grid md:grid-cols-2 gap-8">
                <div className="bg-white p-6 rounded-lg shadow-lg">
                  <h3 className="text-xl font-semibold mb-4 text-primary">Plomberie & Chauffage</h3>
                  <ul className="space-y-2 text-gray-600">
                    <li>• Installation et réparation de chauffage</li>
                    <li>• Dépannage plomberie d'urgence</li>
                    <li>• Installation de pompes à chaleur</li>
                    <li>• Entretien de chaudières</li>
                  </ul>
                </div>
                
                <div className="bg-white p-6 rounded-lg shadow-lg">
                  <h3 className="text-xl font-semibold mb-4 text-primary">Serrurerie & Vitrerie</h3>
                  <ul className="space-y-2 text-gray-600">
                    <li>• Ouverture de porte d'urgence</li>
                    <li>• Installation de serrures sécurisées</li>
                    <li>• Remplacement de vitres</li>
                    <li>• Pose de double vitrage</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
      
      <Footer />
    </>
  );
};

export default NotreSociete;