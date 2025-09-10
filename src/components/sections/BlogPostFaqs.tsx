import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";

interface BlogPostFaqsProps {
  slug: string;
}

export const BlogPostFaqs = ({ slug }: BlogPostFaqsProps) => {
  // FAQ spécifique pour chaque article
  const getFaqsData = (slug: string) => {
    if (slug === "choisir-adoucisseur-eau") {
      return [
    {
      id: 1,
      question: "Quelle est la dureté idéale de l'eau dans une maison ?",
      answer: "La dureté idéale se situe entre 10 et 15 °f. En dessous, l'eau est trop douce et peut corroder les canalisations ; au-dessus, elle est trop dure et provoque du tartre. Un adoucisseur permet d'ajuster ce niveau."
    },
    {
      id: 2,
      question: "Combien coûte un adoucisseur d'eau (achat + installation) ?",
      answer: "Le prix dépend de la capacité et de la technologie : entre 800 et 1 800 € pour l'achat, et 300 à 600 € pour l'installation. Mon p'tit Dépanneur propose des devis personnalisés."
    },
    {
      id: 3,
      question: "Quelle est la durée de vie d'un adoucisseur d'eau ?",
      answer: "Un adoucisseur bien entretenu peut durer 15 à 20 ans. Il est recommandé de faire vérifier la résine et les réglages tous les 1 à 2 ans par un professionnel."
    },
    {
      id: 4,
      question: "L'adoucisseur d'eau consomme-t-il beaucoup de sel et d'eau ?",
      answer: "La consommation moyenne pour un foyer de 4 personnes est de 50 à 150 kg de sel par an et environ 3 à 5 % d'eau en plus. Les modèles récents sont plus économes."
    },
    {
      id: 5,
      question: "Quelle marque d'adoucisseur d'eau choisir ?",
      answer: "Parmi les marques reconnues en France : Culligan, BWT, Permo, Fleck, Cillit. Mon p'tit Dépanneur installe des modèles certifiés et fiables."
    },
    {
      id: 6,
      question: "Faut-il entretenir régulièrement un adoucisseur ?",
      answer: "Oui, un entretien annuel est conseillé : contrôle du bac à sel, nettoyage de la résine, vérification des réglages. Cela prolonge la durée de vie de l'appareil."
    },
    {
      id: 7,
      question: "Peut-on boire l'eau issue d'un adoucisseur ?",
      answer: "Oui, l'eau adoucie est potable. Elle est toutefois déconseillée pour les nourrissons et les personnes suivant un régime pauvre en sel. On peut prévoir un point d'eau non adoucie en cuisine."
    },
    {
      id: 8,
      question: "Un adoucisseur d'eau est-il écologique ?",
      answer: "En réduisant le calcaire, il prolonge la durée de vie des appareils et limite l'usage de produits détartrants. Certaines solutions sans sel sont aussi disponibles."
    }];
    }
    
    if (slug === "comment-reparer-fuites-eau") {
      return [
        {
          id: 1,
          question: "Comment savoir si j'ai une fuite d'eau invisible ?",
          answer: "Une fuite invisible se détecte souvent grâce au compteur d'eau. Si celui-ci tourne alors que vous n'utilisez pas d'eau, c'est un signe clair. L'apparition de moisissures ou de taches d'humidité peut aussi révéler une fuite cachée."
        },
        {
          id: 2,
          question: "Quel est le coût moyen d'une réparation de fuite d'eau ?",
          answer: "Le tarif dépend de l'accessibilité et de la gravité de la fuite. Comptez entre 120 et 250 € pour une petite réparation (joint, siphon, raccord) et davantage si des travaux de recherche ou de remplacement de canalisation sont nécessaires."
        },
        {
          id: 3,
          question: "Qui doit payer la réparation d'une fuite d'eau : locataire ou propriétaire ?",
          answer: "En général, le locataire doit s'occuper des petites réparations (joints, siphons). Les réparations plus importantes liées à la vétusté ou aux canalisations encastrées sont à la charge du propriétaire."
        },
        {
          id: 4,
          question: "Une fuite d'eau est-elle prise en charge par l'assurance habitation ?",
          answer: "Oui, dans la majorité des cas. La garantie « dégâts des eaux » couvre les dommages causés par une fuite. Toutefois, la réparation de la cause de la fuite peut rester à votre charge selon votre contrat."
        },
        {
          id: 5,
          question: "Combien d'eau peut faire perdre une petite fuite ?",
          answer: "Une simple fuite de robinet peut gaspiller jusqu'à 120 litres par jour, soit plus de 40 m³ par an. Une chasse d'eau qui coule en continu peut faire grimper votre facture de plusieurs centaines d'euros."
        },
        {
          id: 6,
          question: "Comment éviter les fuites d'eau à l'avenir ?",
          answer: "Un entretien régulier est essentiel : vérifiez vos joints, faites contrôler vos installations de plomberie et installez éventuellement un détecteur de fuite connecté."
        }
      ];
    }
    
    if (slug === "regulation-chauffage") {
      return [
        {
          id: 1,
          question: "Quelle est la température idéale dans une maison ?",
          answer: "L'ADEME recommande 19 °C dans les pièces de vie, 16–17 °C dans les chambres et 22 °C dans la salle de bain lorsqu'elle est utilisée."
        },
        {
          id: 2,
          question: "Quelle économie peut-on faire avec un thermostat programmable ?",
          answer: "En moyenne, vous pouvez économiser 10 à 20 % sur vos dépenses de chauffage, simplement en programmant intelligemment vos absences et vos nuits."
        },
        {
          id: 3,
          question: "Quelle est la différence entre un thermostat classique et un thermostat connecté ?",
          answer: "Le thermostat classique maintient une température fixée. Le thermostat connecté permet en plus de piloter votre chauffage à distance (smartphone) et d'optimiser automatiquement vos consommations."
        },
        {
          id: 4,
          question: "Comment régler un robinet thermostatique ?",
          answer: "Chaque graduation correspond à une température : 1 ≈ 12 °C, 2 ≈ 16 °C, 3 ≈ 20 °C, 4 ≈ 24 °C, 5 ≈ 28 °C."
        },
        {
          id: 5,
          question: "Les robinets thermostatiques suffisent-ils à réguler la maison ?",
          answer: "Non. Ils complètent le thermostat central. Le premier pilote la chaudière, les seconds ajustent pièce par pièce."
        },
        {
          id: 6,
          question: "Quand faut-il changer un thermostat ou un robinet thermostatique ?",
          answer: "En moyenne tous les 10 à 15 ans. Des signes comme des écarts de température ou des réglages inefficaces indiquent qu'il est temps de moderniser l'installation."
        }
      ];
    }
    
    if (slug === "reparer-fuite-eau-soi-meme") {
      return [
        {
          id: 1,
          question: "Peut-on réparer toutes les fuites soi-même ?",
          answer: "Non, seules les petites fuites (joints usés, raccords desserrés) sont accessibles aux bricoleurs. Pour une canalisation encastrée ou un gros écoulement, il faut un plombier."
        },
        {
          id: 2,
          question: "Quels outils faut-il pour réparer une fuite ?",
          answer: "Clé à molette, tournevis, joints neufs, chiffon absorbant et éventuellement du ruban de plomberie (téflon)."
        },
        {
          id: 3,
          question: "Combien de temps prend une réparation ?",
          answer: "Environ 30 minutes pour un joint ou un petit raccord. Plus si le tuyau doit être remplacé."
        },
        {
          id: 4,
          question: "Que faire si la fuite persiste après réparation ?",
          answer: "Fermez l'eau immédiatement et contactez un plombier. Cela peut cacher un problème plus sérieux."
        },
        {
          id: 5,
          question: "Combien coûte l'intervention d'un plombier pour une fuite ?",
          answer: "Entre 100 et 250 € selon la gravité et l'accessibilité de la canalisation."
        },
        {
          id: 6,
          question: "Comment prévenir les fuites ?",
          answer: "Entretenez vos canalisations, évitez les produits corrosifs et faites vérifier vos installations anciennes par un professionnel."
        }
      ];
    }
    
    if (slug === "comment-choisir-raccord") {
      return [
        {
          id: 1,
          question: "Quel raccord utiliser pour du cuivre ?",
          answer: "Les raccords à souder ou à sertir sont les plus adaptés pour une installation durable sur cuivre."
        },
        {
          id: 2,
          question: "Peut-on mélanger différents types de raccords ?",
          answer: "Oui, mais il faut respecter la compatibilité des matériaux et vérifier l'étanchéité."
        },
        {
          id: 3,
          question: "Quel raccord choisir pour du PER ou du multicouche ?",
          answer: "On utilise généralement des raccords à sertir ou à compression."
        },
        {
          id: 4,
          question: "Quelle est la différence entre un raccord à visser et un raccord à sertir ?",
          answer: "À visser : démontable, nécessite une clé. À sertir : permanent, nécessite une pince à sertir."
        },
        {
          id: 5,
          question: "Quels sont les raccords les plus faciles à poser soi-même ?",
          answer: "Les raccords à visser ou instantanés, car ils ne demandent pas d'outillage spécialisé."
        },
        {
          id: 6,
          question: "Est-il risqué d'installer un raccord soi-même ?",
          answer: "Oui, si vous n'avez pas l'expérience nécessaire. Un raccord mal monté peut causer une fuite ou des dégâts d'eau importants."
        }
      ];
    }
    
    if (slug === "chauffe-eau-electrique-cumulus") {
      return [
        {
          id: 1,
          question: "Quelle est la durée de vie d'un cumulus électrique ?",
          answer: "En moyenne 10 à 15 ans, selon la qualité et l'entretien."
        },
        {
          id: 2,
          question: "À quelle température régler mon chauffe-eau ?",
          answer: "Entre 50 et 55 °C pour un bon compromis entre confort et économies."
        },
        {
          id: 3,
          question: "Le cumulus consomme-t-il beaucoup d'électricité ?",
          answer: "Oui, c'est l'un des plus gros postes de consommation dans un foyer. Mais avec une bonne programmation et des habitudes adaptées, on peut réduire la facture de 20 à 30 %."
        },
        {
          id: 4,
          question: "Quelle capacité de cumulus choisir ?",
          answer: "50 à 100 L → 1 à 2 personnes, 150 à 200 L → 3 à 4 personnes, 250 L et + → familles nombreuses"
        },
        {
          id: 5,
          question: "Peut-on installer un cumulus soi-même ?",
          answer: "C'est possible, mais déconseillé. L'installation requiert des compétences en plomberie et en électricité pour garantir la sécurité."
        },
        {
          id: 6,
          question: "Faut-il entretenir son cumulus ?",
          answer: "Oui. Détartrage et vérification de l'anode sont recommandés tous les 2 à 3 ans pour prolonger sa durée de vie."
        }
      ];
    }
    
    if (slug === "comment-choisir-raccord") {
      return [
        {
          id: 1,
          question: "Quel raccord utiliser pour du cuivre ?",
          answer: "Les raccords à souder ou à sertir sont les plus adaptés pour une installation durable sur cuivre."
        },
        {
          id: 2,
          question: "Peut-on mélanger différents types de raccords ?",
          answer: "Oui, mais il faut respecter la compatibilité des matériaux et vérifier l'étanchéité."
        },
        {
          id: 3,
          question: "Quel raccord choisir pour du PER ou du multicouche ?",
          answer: "On utilise généralement des raccords à sertir ou à compression."
        },
        {
          id: 4,
          question: "Quelle est la différence entre un raccord à visser et un raccord à sertir ?",
          answer: "À visser : démontable, nécessite une clé. À sertir : permanent, nécessite une pince à sertir."
        },
        {
          id: 5,
          question: "Quels sont les raccords les plus faciles à poser soi-même ?",
          answer: "Les raccords à visser ou instantanés, car ils ne demandent pas d'outillage spécialisé."
        },
        {
          id: 6,
          question: "Est-il risqué d'installer un raccord soi-même ?",
          answer: "Oui, si vous n'avez pas l'expérience nécessaire. Un raccord mal monté peut causer une fuite ou des dégâts d'eau importants."
        }
      ];
    }
    
    return [];
  };

  const faqsData = getFaqsData(slug);

  if (!faqsData.length) return null;

  return (
    <section className="py-16 bg-gray-50">
      <div className="container mx-auto px-6">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Questions fréquentes
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Trouvez rapidement les réponses à vos questions
          </p>
        </div>

        <div className="max-w-4xl mx-auto">
          <Accordion type="single" collapsible className="space-y-4">
            {faqsData.map((faq, index) => (
              <AccordionItem 
                key={faq.id} 
                value={`item-${index}`}
                className="border border-border rounded-lg px-6 bg-card"
              >
                <AccordionTrigger className="text-left hover:no-underline py-4">
                  <span className="font-semibold text-foreground">
                    {faq.question}
                  </span>
                </AccordionTrigger>
                <AccordionContent className="pb-4 text-muted-foreground leading-relaxed">
                  {faq.answer}
                </AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        </div>
      </div>
    </section>
  );
};