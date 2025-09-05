import { CheckCircle, Users, Calendar, Award } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";

const About = () => {
  const achievements = [
    {
      icon: Calendar,
      title: "20+ ans",
      description: "d'expérience",
      color: "text-primary"
    },
    {
      icon: Users,
      title: "600+",
      description: "clients satisfaits",
      color: "text-success"
    },
    {
      icon: Award,
      title: "Certifié RGE",
      description: "Qualibat-RGE",
      color: "text-accent"
    },
    {
      icon: CheckCircle,
      title: "24h/24",
      description: "Service d'urgence",
      color: "text-urgent"
    }
  ];

  return (
    <section className="py-20 bg-background">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          {/* Content */}
          <div>
            <div className="flex items-center mb-6">
              <div className="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mr-4">
                <Users className="w-8 h-8 text-primary" />
              </div>
              <div>
                <h2 className="text-3xl md:text-4xl font-bold text-foreground">
                  Dépannage, réparation, installation.
                </h2>
                <h3 className="text-2xl text-primary mt-2">
                  On s'occupe de tout !
                </h3>
              </div>
            </div>

            <div className="prose prose-lg max-w-none mb-8">
              <p className="text-muted-foreground leading-relaxed mb-4">
                Créée par David Vanmarcke il y a 20 ans, la société Mon p'tit Dépanneur emploie aujourd'hui 12 personnes et 
                intervient dans les domaines suivants : Chauffage, installation de chaudière, réparation, entretien, 
                serrurerie (porte bloquée, barillets à changer), plomberie (installation et entretien de cumulus, réparation 
                de fuite), et viterie (remplacement de petites vitres cassées)...
              </p>
              
              <p className="text-muted-foreground leading-relaxed">
                Basée à Lille, Mon p'tit Dépanneur est agréée par une vingtaine de compagnies d'assurances (Maaf, Maaf, Gan, 
                Groupama...). Les équipes se déplacent chez vous, sur simple demande ou sur rendez-vous.
              </p>
            </div>

            <div className="flex flex-col sm:flex-row gap-4 mb-8">
              <Button variant="hero" size="lg">
                Découvrir nos services
              </Button>
              <Button variant="outline" size="lg">
                Nos réalisations
              </Button>
            </div>
          </div>

          {/* Achievements */}
          <div className="grid grid-cols-2 gap-6">
            {achievements.map((achievement, index) => (
              <Card key={index} className="p-6 text-center hover:shadow-elevated transition-all duration-300 transform hover:scale-105 bg-card border-none shadow-card">
                <achievement.icon className={`w-12 h-12 mx-auto mb-4 ${achievement.color}`} />
                <div className="text-2xl font-bold text-card-foreground mb-1">
                  {achievement.title}
                </div>
                <div className="text-muted-foreground">
                  {achievement.description}
                </div>
              </Card>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default About;