import { Helmet } from "react-helmet";
import { Star, MapPin, Calendar, User } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";

const Avis = () => {
  const avis = [
    {
      id: 1,
      nom: "Marie D.",
      ville: "Lille",
      date: "Décembre 2024",
      note: 5,
      service: "Plomberie",
      commentaire: "Intervention très rapide pour une fuite d'eau urgente. Le plombier était professionnel et a résolu le problème efficacement. Je recommande !",
      photos: [
        "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-1.webp",
        "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-10.webp"
      ]
    },
    {
      id: 2,
      nom: "Pierre L.",
      ville: "Villeneuve-d'Ascq",
      date: "Novembre 2024",
      note: 5,
      service: "Chauffage",
      commentaire: "Installation de ma nouvelle chaudière parfaitement réalisée. Équipe compétente et prix transparent. Très satisfait du service.",
      photos: [
        "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-3.webp"
      ]
    },
    {
      id: 3,
      nom: "Sophie M.",
      ville: "Marcq-en-Barœul",
      date: "Octobre 2024",
      note: 5,
      service: "Serrurerie",
      commentaire: "Dépannage serrurerie en urgence un dimanche soir. Le serrurier est arrivé rapidement et a changé la serrure sans abîmer la porte.",
      photos: []
    },
    {
      id: 4,
      nom: "Thomas R.",
      ville: "La Madeleine",
      date: "Octobre 2024",
      note: 4,
      service: "Vitrerie",
      commentaire: "Remplacement d'une vitre cassée suite à un cambriolage. Travail soigné et délais respectés. Bon rapport qualité-prix.",
      photos: [
        "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-5.webp",
        "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-8.webp"
      ]
    },
    {
      id: 5,
      nom: "Isabelle C.",
      ville: "Bondues",
      date: "Septembre 2024",
      note: 5,
      service: "Salle de bains",
      commentaire: "Rénovation complète de ma salle de bains. Le résultat est magnifique et les travaux ont été réalisés dans les temps. Je suis ravie !",
      photos: [
        "https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/sdb-1.webp"
      ]
    },
    {
      id: 6,
      nom: "Michel B.",
      ville: "Lomme",
      date: "Septembre 2024",
      note: 5,
      service: "Pompe à chaleur",
      commentaire: "Installation d'une pompe à chaleur air-eau. Excellent conseil, installation soignée et suivi après-vente au top. Je recommande vivement.",
      photos: []
    }
  ];

  const notesMoyenne = avis.reduce((sum, avis) => sum + avis.note, 0) / avis.length;

  const renderStars = (rating: number) => {
    return Array.from({ length: 5 }, (_, i) => (
      <Star
        key={i}
        className={`w-4 h-4 ${i < rating ? 'text-yellow-400 fill-current' : 'text-gray-300'}`}
      />
    ));
  };

  return (
    <>
      <Helmet>
        <title>Avis clients et photos - Mon p'tit Dépanneur Lille</title>
        <meta name="description" content="Découvrez les avis clients et photos de nos interventions. Témoignages authentiques sur nos services de plomberie, chauffage, serrurerie et vitrerie à Lille." />
        <meta name="keywords" content="avis clients lille, témoignages plombier, photos travaux, satisfaction client, dépannage lille" />
        <link rel="canonical" href="https://monptitdepanneur.fr/avis" />
      </Helmet>

      <main className="min-h-screen bg-gray-50">
        {/* Hero Section */}
        <section className="bg-gradient-to-r from-primary to-primary/80 text-white py-20">
          <div className="container mx-auto px-4 text-center">
            <h1 className="text-4xl md:text-5xl font-bold mb-6">
              Avis clients et photos
            </h1>
            <p className="text-xl text-white/90 mb-8 max-w-3xl mx-auto">
              Découvrez les témoignages authentiques de nos clients et les photos de nos interventions à Lille et ses environs
            </p>
            
            {/* Note moyenne */}
            <div className="flex items-center justify-center gap-4 mb-6">
              <div className="flex items-center gap-2">
                {renderStars(5)}
                <span className="text-2xl font-bold">{notesMoyenne.toFixed(1)}/5</span>
              </div>
              <div className="text-lg">
                Basé sur {avis.length} avis clients
              </div>
            </div>
          </div>
        </section>

        {/* Avis Section */}
        <section className="py-20">
          <div className="container mx-auto px-4">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              {avis.map((avis) => (
                <Card key={avis.id} className="p-6 hover:shadow-lg transition-shadow">
                  {/* Header */}
                  <div className="flex items-start justify-between mb-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-primary/10 rounded-full flex items-center justify-center">
                        <User className="w-5 h-5 text-primary" />
                      </div>
                      <div>
                        <h3 className="font-semibold text-foreground">{avis.nom}</h3>
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                          <MapPin className="w-3 h-3" />
                          {avis.ville}
                        </div>
                      </div>
                    </div>
                    <Badge variant="secondary">{avis.service}</Badge>
                  </div>

                  {/* Rating */}
                  <div className="flex items-center gap-2 mb-4">
                    <div className="flex items-center gap-1">
                      {renderStars(avis.note)}
                    </div>
                    <div className="flex items-center gap-1 text-sm text-muted-foreground">
                      <Calendar className="w-3 h-3" />
                      {avis.date}
                    </div>
                  </div>

                  {/* Commentaire */}
                  <p className="text-muted-foreground mb-4 leading-relaxed">
                    "{avis.commentaire}"
                  </p>

                  {/* Photos */}
                  {avis.photos.length > 0 && (
                    <div className="grid grid-cols-2 gap-2">
                      {avis.photos.map((photo, index) => (
                        <div key={index} className="aspect-square overflow-hidden rounded-lg">
                          <img
                            src={photo}
                            alt={`Photo ${index + 1} - ${avis.service}`}
                            className="w-full h-full object-cover hover:scale-105 transition-transform cursor-pointer"
                          />
                        </div>
                      ))}
                    </div>
                  )}
                </Card>
              ))}
            </div>
          </div>
        </section>

        {/* CTA Section */}
        <section className="bg-primary py-16">
          <div className="container mx-auto px-4 text-center">
            <h2 className="text-3xl font-bold text-white mb-6">
              Rejoignez nos clients satisfaits
            </h2>
            <p className="text-xl text-white/90 mb-8 max-w-2xl mx-auto">
              Besoin d'un dépannage ou de travaux ? Contactez-nous pour un devis gratuit et rejoignez nos nombreux clients satisfaits.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="tel:0328534868"
                className="bg-white text-primary hover:bg-gray-100 px-8 py-3 rounded-lg font-semibold transition-colors"
              >
                Appeler : 03 28 53 48 68
              </a>
              <a
                href="/contact"
                className="bg-transparent border-2 border-white text-white hover:bg-white hover:text-primary px-8 py-3 rounded-lg font-semibold transition-colors"
              >
                Demander un devis
              </a>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default Avis;