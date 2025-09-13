import ReactMarkdown from 'react-markdown';
import { InternalLinkEnhancer } from './InternalLinkEnhancer';

interface BlogContentEnhancerProps {
  content: string;
  currentSlug?: string;
}

export const BlogContentEnhancer = ({ content, currentSlug }: BlogContentEnhancerProps) => {
  // Fonction pour améliorer le contenu avec des liens internes
  const enhanceContent = (text: string) => {
    // Pour l'instant, on retourne le contenu tel quel
    // L'amélioration se fera via le composant InternalLinkEnhancer
    return text;
  };

  const enhancedContent = enhanceContent(content);

  return (
    <div className="prose prose-lg prose-headings:text-foreground prose-p:text-foreground prose-strong:text-foreground prose-li:text-foreground prose-a:text-primary hover:prose-a:text-primary/80 prose-img:rounded-lg prose-img:shadow-md max-w-none blog-content">
      <ReactMarkdown 
        rehypePlugins={[]} 
        remarkPlugins={[]}
        components={{
          // Améliorer les paragraphes avec des liens internes
          p: ({ children, ...props }) => (
            <p {...props}>
              {typeof children === 'string' ? (
                <InternalLinkEnhancer content={children} currentSlug={currentSlug} />
              ) : (
                children
              )}
            </p>
          ),
          // Améliorer les listes
          li: ({ children, ...props }) => (
            <li {...props}>
              {typeof children === 'string' ? (
                <InternalLinkEnhancer content={children} currentSlug={currentSlug} />
              ) : (
                children
              )}
            </li>
          ),
        }}
      >
        {enhancedContent}
      </ReactMarkdown>
    </div>
  );
};