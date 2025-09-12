import { useEffect } from "react";
import { useToast } from "@/hooks/use-toast";

const satisfiedCustomers = [
  {
    name: "Marie L.",
    city: "Paris 15e",
    service: "Réparation chaudière",
    message: "Intervention rapide et efficace ! Merci !"
  },
  {
    name: "Jean-Pierre M.",
    city: "Lyon 3e", 
    service: "Dépannage plomberie",
    message: "Excellent service, je recommande vivement"
  },
  {
    name: "Sophie D.",
    city: "Marseille 8e",
    service: "Installation chauffe-eau",
    message: "Travail impeccable, technicien très professionnel"
  },
  {
    name: "Nicolas B.",
    city: "Toulouse 1er",
    service: "Débouchage canalisation",
    message: "Problème résolu en 30 minutes, parfait !"
  },
  {
    name: "Catherine R.",
    city: "Nice 6e",
    service: "Entretien chaudière",
    message: "Service de qualité, ponctuel et soigné"
  },
  {
    name: "Thomas K.",
    city: "Nantes 2e",
    service: "Réparation fuite",
    message: "Très satisfait, tarif transparent"
  },
  {
    name: "Isabelle V.",
    city: "Strasbourg 4e",
    service: "Installation radiateur", 
    message: "Équipe compétente, travail soigné"
  },
  {
    name: "Laurent P.",
    city: "Bordeaux 3e",
    service: "Dépannage urgent",
    message: "Dépannage le dimanche, service exceptionnel !"
  }
];

export const SatisfiedCustomerNotifications = () => {
  const { toast } = useToast();

  useEffect(() => {
    // Fonction pour afficher une notification aléatoire
    const showRandomNotification = () => {
      const randomCustomer = satisfiedCustomers[Math.floor(Math.random() * satisfiedCustomers.length)];
      
      toast({
        title: `✅ ${randomCustomer.name} - ${randomCustomer.city}`,
        description: `${randomCustomer.service} - "${randomCustomer.message}"`,
        duration: 4000,
        className: "border-green-200 bg-green-50 dark:bg-green-950 dark:border-green-800"
      });
    };

    // Première notification après 10 secondes
    const firstTimeout = setTimeout(() => {
      showRandomNotification();
    }, 10000);

    // Puis une notification toutes les 15-25 secondes
    const interval = setInterval(() => {
      showRandomNotification();
    }, Math.random() * 10000 + 15000); // Entre 15 et 25 secondes

    return () => {
      clearTimeout(firstTimeout);
      clearInterval(interval);
    };
  }, [toast]);

  return null; // Ce composant n'a pas de rendu visuel
};