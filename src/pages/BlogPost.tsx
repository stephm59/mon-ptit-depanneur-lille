import { useParams } from "react-router-dom";
import { Helmet } from "react-helmet";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { Star, Phone } from "lucide-react";
import { useBlogPost, useRelatedBlogPosts } from "@/hooks/useBlog";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Loading } from "@/components/ui/loading";
import { CtaBlock } from "@/components/sections/CtaBlock";
import { HomeServices } from "@/components/sections/HomeServices";
import MediaCoverage from "@/components/sections/MediaCoverage";
import Testimonials from "@/components/sections/Testimonials";
import { Link } from "react-router-dom";

const BlogPost = () => {
  const { slug } = useParams<{ slug: string }>();
  const { data: post, isLoading, error } = useBlogPost(slug || "");
  const { data: relatedPosts } = useRelatedBlogPosts(post?.service_id, slug, 3);

  if (isLoading) return <Loading />;
  
  if (error || !post) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <Card className="p-8 text-center">
          <h1 className="text-2xl font-bold mb-4">Article non trouvé</h1>
          <p className="text-muted-foreground mb-6">
            Cet article n'existe pas ou n'est plus disponible.
          </p>
          <Button asChild>
            <Link to="/">Retour à l'accueil</Link>
          </Button>
        </Card>
      </div>
    );
  }

  const faqSchema = post.slug === "choisir-adoucisseur-eau" ? {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "Quelle est la dureté idéale de l'eau dans une maison ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "La dureté idéale se situe entre 10 et 15 °f. En dessous, l'eau est trop douce et peut corroder les canalisations ; au-dessus, elle est trop dure et provoque du tartre. Un adoucisseur permet d'ajuster ce niveau."
        }
      },
      {
        "@type": "Question", 
        "name": "Combien coûte un adoucisseur d'eau (achat + installation) ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Le prix dépend de la capacité et de la technologie : entre 800 et 1 800 € pour l'achat, et 300 à 600 € pour l'installation. Mon p'tit Dépanneur propose des devis personnalisés."
        }
      },
      {
        "@type": "Question",
        "name": "Quelle est la durée de vie d'un adoucisseur d'eau ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Un adoucisseur bien entretenu peut durer 15 à 20 ans. Il est recommandé de faire vérifier la résine et les réglages tous les 1 à 2 ans par un professionnel."
        }
      },
      {
        "@type": "Question",
        "name": "L'adoucisseur d'eau consomme-t-il beaucoup de sel et d'eau ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "La consommation moyenne pour un foyer de 4 personnes est de 50 à 150 kg de sel par an et environ 3 à 5 % d'eau en plus. Les modèles récents sont plus économes."
        }
      },
      {
        "@type": "Question",
        "name": "Quelle marque d'adoucisseur d'eau choisir ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Parmi les marques reconnues en France : Culligan, BWT, Permo, Fleck, Cillit. Mon p'tit Dépanneur installe des modèles certifiés et fiables."
        }
      },
      {
        "@type": "Question",
        "name": "Faut-il entretenir régulièrement un adoucisseur ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Oui, un entretien annuel est conseillé : contrôle du bac à sel, nettoyage de la résine, vérification des réglages. Cela prolonge la durée de vie de l'appareil."
        }
      },
      {
        "@type": "Question",
        "name": "Peut-on boire l'eau issue d'un adoucisseur ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Oui, l'eau adoucie est potable. Elle est toutefois déconseillée pour les nourrissons et les personnes suivant un régime pauvre en sel. On peut prévoir un point d'eau non adoucie en cuisine."
        }
      },
      {
        "@type": "Question",
        "name": "Un adoucisseur d'eau est-il écologique ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "En réduisant le calcaire, il prolonge la durée de vie des appareils et limite l'usage de produits détartrants. Certaines solutions sans sel sont aussi disponibles."
        }
      }
    ]
  } : null;

  return (
    <>
      <Helmet>
        <title>{post.title}</title>
        <meta name="description" content={post.excerpt || ""} />
        <link rel="canonical" href={`https://monptitdepanneur.com/${post.slug}`} />
        {faqSchema && (
          <script type="application/ld+json">
            {JSON.stringify(faqSchema)}
          </script>
        )}
      </Helmet>

      {/* Hero Section */}
      <section className="relative min-h-[60vh] flex items-center justify-center bg-gradient-primary">
        {post.cover_image_url && (
          <div 
            className="absolute inset-0 bg-cover bg-center opacity-20"
            style={{ 
              backgroundImage: `url(${post.cover_image_url})`,
            }}
          />
        )}
        <div className="relative z-10 container mx-auto px-6 text-center text-white">
          <h1 className="text-4xl md:text-5xl font-bold mb-6">
            Comment choisir un adoucisseur d'eau (et améliorer la qualité de l'eau) ?
          </h1>
          
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-8">
            <Button size="lg" variant="secondary">
              Recevoir un devis gratuit
            </Button>
            <Button size="lg" variant="phone">
              <Phone className="mr-2 h-5 w-5" />
              03 28 53 48 68
            </Button>
          </div>

          <div className="flex items-center justify-center gap-2 text-sm opacity-90">
            <div className="flex gap-1">
              {[1, 2, 3, 4, 5].map((star) => (
                <Star key={star} className="w-5 h-5 fill-current text-yellow-400" />
              ))}
            </div>
            <span>4,5/5 sur plus de 600 avis clients</span>
          </div>
        </div>
      </section>

      {/* Service Category Box */}
      <section className="py-8 bg-background">
        <div className="container mx-auto px-6">
          <Card className="p-6 border-l-4 border-l-primary bg-secondary/20">
            <p className="text-lg text-center">
              Ce bon conseil vous est proposé par Mon p'tit Dépanneur, 
              <Link 
                to="/plombier-lille" 
                className="text-primary hover:underline font-semibold ml-1"
                rel="nofollow"
              >
                plombier à Lille
              </Link>
              .
            </p>
          </Card>
        </div>
      </section>

      {/* Article Content */}
      <article className="py-16 bg-background">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto prose prose-lg prose-headings:text-foreground prose-p:text-muted-foreground prose-strong:text-foreground prose-li:text-muted-foreground">
            <ReactMarkdown remarkPlugins={[remarkGfm]}>
              {post.content || ""}
            </ReactMarkdown>
          </div>
        </div>
      </article>

      {/* CTA Block */}
      <CtaBlock />

      {/* Services Grid - Plumbing focused */}
      <HomeServices />

      {/* Media Coverage */}
      <MediaCoverage />

      {/* Testimonials */}
      <Testimonials />

      {/* Related Articles */}
      {relatedPosts && relatedPosts.length > 0 && (
        <section className="py-16 bg-secondary/30">
          <div className="container mx-auto px-6">
            <h2 className="text-3xl font-bold text-center mb-12">
              D'autres articles du blog
            </h2>
            
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
              {relatedPosts.map((relatedPost) => (
                <Card key={relatedPost.id} className="overflow-hidden hover:shadow-lg transition-shadow">
                  {relatedPost.cover_image_url && (
                    <div 
                      className="h-48 bg-cover bg-center"
                      style={{ backgroundImage: `url(${relatedPost.cover_image_url})` }}
                    />
                  )}
                  <div className="p-6">
                    <h3 className="text-xl font-semibold mb-3 line-clamp-2">
                      {relatedPost.title}
                    </h3>
                    {relatedPost.excerpt && (
                      <p className="text-muted-foreground mb-4 line-clamp-3">
                        {relatedPost.excerpt}
                      </p>
                    )}
                    <Button variant="outline" asChild className="w-full">
                      <Link to={`/${relatedPost.slug}`}>
                        Lire l'article
                      </Link>
                    </Button>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </section>
      )}
    </>
  );
};

export default BlogPost;