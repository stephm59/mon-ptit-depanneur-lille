import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { useBlogPostFaqs, useServiceGenericFaqs } from "@/hooks/useBlog";

interface BlogPostFaqsProps {
  serviceId?: string | null;
  blogPostId?: string;
}

export function BlogPostFaqs({ serviceId, blogPostId }: BlogPostFaqsProps) {
  const { data: blogFaqs, isLoading: blogLoading } = useBlogPostFaqs(blogPostId);
  const { data: serviceFaqs, isLoading: serviceLoading } = useServiceGenericFaqs(serviceId);
  
  // Use blog post FAQs if available, otherwise fall back to generic service FAQs
  const faqs = blogFaqs && blogFaqs.length > 0 ? blogFaqs : serviceFaqs;
  const isLoading = blogLoading || serviceLoading;

  if (isLoading || !faqs?.length) return null;

  return (
    <section id="faq" className="py-16 bg-gray-50">
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
            {faqs.map((faq, index) => (
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
}