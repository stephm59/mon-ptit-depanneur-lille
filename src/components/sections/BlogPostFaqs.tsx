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
  // FAQ spécifique pour l'article sur les adoucisseurs d'eau
  const faqsData = slug === "choisir-adoucisseur-eau" ? [
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
    }
  ] : [];

  if (!faqsData.length) return null;

  return (
    <section className="py-16 bg-background">
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