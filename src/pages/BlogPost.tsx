import { useParams } from "react-router-dom";
import { Helmet } from "react-helmet";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { Star, Phone, Calendar, ArrowRight, Clock, Shield, Wrench } from "lucide-react";
import { useBlogPost, useRelatedBlogPosts } from "@/hooks/useBlog";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Loading } from "@/components/ui/loading";
import { CtaBlock } from "@/components/sections/CtaBlock";
import { HomeServices } from "@/components/sections/HomeServices";
import MediaCoverage from "@/components/sections/MediaCoverage";
import Testimonials from "@/components/sections/Testimonials";
import { Link } from "react-router-dom";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import { BlogPostFaqs } from "@/components/sections/BlogPostFaqs";

const BlogPost = () => {
  const { slug } = useParams<{ slug: string }>();
  const { data: post, isLoading, error } = useBlogPost(slug || "");
  const { data: relatedPosts } = useRelatedBlogPosts(post?.service_id, slug, 3);

  const features = [
    {
      icon: Clock,
      title: "Intervention < 1h",
      description: "Dans Lille et environs",
      color: "text-accent"
    },
    {
      icon: Shield,
      title: "Garantie décennale",
      description: "Travaux assurés",
      color: "text-success"
    },
    {
      icon: Wrench,
      title: "Devis gratuit",
      description: "Sans engagement",
      color: "text-primary-light"
    },
    {
      icon: Star,
      title: "Artisan de confiance",
      description: "Service de qualité",
      color: "text-accent"
    }
  ];

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

  // Construire les schemas JSON-LD FAQ selon l'article
  const getFaqSchema = (slug: string) => {
    if (slug === "choisir-adoucisseur-eau") {
      return {
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
      };
    }
    
    if (slug === "comment-reparer-fuites-eau") {
      return {
        "@context": "https://schema.org",
        "@type": "FAQPage",
        "mainEntity": [
          {
            "@type": "Question",
            "name": "Comment savoir si j'ai une fuite d'eau invisible ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Coupez toute consommation d'eau 1 à 2 heures et observez le compteur : s'il tourne encore, une fuite est probable. Des traces d'humidité, moisissures ou un parquet gondolé sont aussi des signaux d'alerte."
            }
          },
          {
            "@type": "Question",
            "name": "Quel est le coût moyen d'une réparation de fuite d'eau ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Selon l'accès et la gravité : 120 à 250 € pour une petite réparation (joint, siphon, raccord). La recherche de fuite encastrée ou le remplacement de canalisation peut coûter plus. Demandez un devis pour un montant précis."
            }
          },
          {
            "@type": "Question",
            "name": "Qui paie la réparation d'une fuite : locataire ou propriétaire ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Les petites réparations d'entretien (joints, siphons) relèvent souvent du locataire. Les travaux liés à la vétusté, aux canalisations encastrées ou à la structure incombent généralement au propriétaire."
            }
          },
          {
            "@type": "Question",
            "name": "Une fuite d'eau est-elle couverte par l'assurance habitation ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "La garantie Dégâts des eaux couvre la plupart des dommages consécutifs à une fuite. Selon le contrat, la réparation de la cause peut rester à votre charge. Déclarez le sinistre rapidement et conservez les justificatifs."
            }
          },
          {
            "@type": "Question",
            "name": "Combien d'eau peut gaspiller une petite fuite ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Jusqu'à 120 L/jour pour un robinet qui goutte en continu, soit plus de 40 m³/an. Une chasse d'eau qui coule peut engendrer plusieurs centaines d'euros sur la facture."
            }
          },
          {
            "@type": "Question",
            "name": "Quelles sont les fuites les plus courantes et comment les réparer ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Chasse d'eau: remplacez le joint ou le flotteur. Sous évier: resserrez les raccords et changez les joints défectueux. En attendant un pro, un ruban de réparation peut limiter une microfuite."
            }
          },
          {
            "@type": "Question",
            "name": "Quand faut-il faire appel à un professionnel ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Si la fuite est introuvable, encastrée ou récurrente, ou si un plafond/mur est touché. Un plombier utilise des méthodes non destructives (mise en épreuve, caméra, écoute, traceur) pour localiser et réparer durablement."
            }
          },
          {
            "@type": "Question",
            "name": "Comment éviter les fuites à l'avenir ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Entretenez joints et robinetterie, purgez régulièrement, faites contrôler vos installations, surveillez le compteur et envisagez un détecteur de fuite connecté pour les résidences secondaires ou logements loués."
            }
          },
          {
            "@type": "Question",
            "name": "Que faire en cas de fuite importante avant l'arrivée du plombier ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Coupez l'alimentation générale d'eau, protégez les zones à risque d'infiltration, coupez l'électricité si nécessaire sur le circuit concerné et ventilez. Contactez un professionnel pour une intervention rapide."
            }
          },
          {
            "@type": "Question",
            "name": "Intervenez-vous rapidement à Lille et alentours ?",
            "acceptedAnswer": {
              "@type": "Answer",
              "text": "Oui, Mon p'tit Dépanneur intervient rapidement à Lille et dans la métropole lilloise pour la recherche et la réparation de fuites. Pour une urgence, appelez le 03 28 53 48 68."
            }
          }
        ]
      };
    }
    
    return null;
  };

  const faqSchema = getFaqSchema(post.slug);

  return (
    <>
      <Header />
      <Helmet>
        <title>{post.title}</title>
        <meta name="description" content={post.excerpt || ""} />
        <link rel="canonical" href={`https://monptitdepanneur.com/carnet/${post.slug}`} />
        {faqSchema && (
          <script type="application/ld+json">
            {JSON.stringify(faqSchema)}
          </script>
        )}
      </Helmet>

      {/* Hero Section */}
      <section className="relative min-h-screen flex items-center overflow-visible pt-28 pb-20">
        {/* Background Image */}
        <div 
          className="absolute inset-0 bg-cover bg-center"
          style={{ 
            backgroundImage: post.slug === "comment-reparer-fuites-eau" 
              ? `url(/lovable-uploads/c7f67f6e-6e2e-47ef-a61d-d2474e8fe449.png)` 
              : `url(/lovable-uploads/aeb391ca-88a6-497a-8d2d-a2e4d62db2fd.png)`,
          }}
        />
        {/* Overlay gradient */}
        <div className="absolute inset-0 bg-gradient-to-b from-black/60 via-black/40 to-black/20" />
        
        <div className="relative z-10 container mx-auto px-6 text-center text-white">
          <h1 className="text-4xl md:text-5xl font-bold mb-6">
            {post.title}
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

        {/* Feature cards - overlapping at bottom */}
        <div className="absolute left-1/2 -translate-x-1/2 bottom-[-60px] md:bottom-[-70px] w-full max-w-6xl px-4 z-20">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {features.map((feature, index) => (
              <Card key={index} className="p-6 bg-card/95 backdrop-blur-sm border-none shadow-card hover:shadow-elevated transition-all duration-300 transform hover:scale-105">
                <div className="text-center">
                  <feature.icon className={`w-12 h-12 mx-auto mb-4 ${feature.color}`} />
                  <h3 className="font-bold text-lg mb-2 text-card-foreground">{feature.title}</h3>
                  <p className="text-muted-foreground">{feature.description}</p>
                </div>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Service Category Box */}
      <section className="py-8 bg-background" style={{ marginTop: '80px' }}>
        <div className="container mx-auto px-6">
          <Card className="p-6 border-l-4 border-l-primary bg-secondary/20">
            <p className="text-lg text-center">
              Ce bon conseil vous est proposé par Mon p'tit Dépanneur, 
              <Link 
                to="/plombier-lille" 
                className="text-primary hover:underline font-semibold ml-1"
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
          <div className="max-w-4xl mx-auto">
            <div className="prose prose-lg prose-headings:text-foreground prose-p:text-muted-foreground prose-strong:text-foreground prose-li:text-muted-foreground prose-a:text-primary hover:prose-a:text-primary/80 prose-img:rounded-lg prose-img:shadow-md max-w-none">
              <ReactMarkdown 
                remarkPlugins={[remarkGfm]}
                components={{
                  h2: ({ children }) => <h2 className="text-2xl md:text-3xl font-bold text-foreground mt-12 mb-6 border-b border-border pb-3">{children}</h2>,
                  h3: ({ children }) => <h3 className="text-xl md:text-2xl font-semibold text-foreground mt-8 mb-4">{children}</h3>,
                  p: ({ children }) => <p className="text-muted-foreground leading-relaxed mb-6 text-lg">{children}</p>,
                  ul: ({ children }) => <ul className="text-muted-foreground space-y-2 mb-6 ml-6">{children}</ul>,
                  ol: ({ children }) => <ol className="text-muted-foreground space-y-2 mb-6 ml-6">{children}</ol>,
                  li: ({ children }) => <li className="leading-relaxed">{children}</li>,
                  blockquote: ({ children }) => (
                    <blockquote className="border-l-4 border-l-primary bg-secondary/20 p-6 my-8 rounded-r-lg">
                      <div className="text-muted-foreground italic">{children}</div>
                    </blockquote>
                  ),
                }}
              >
                {post.content || ""}
              </ReactMarkdown>
            </div>
          </div>
        </div>
      </article>

      {/* FAQ Section */}
      <BlogPostFaqs slug={post.slug} />

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
        <section className="py-20 bg-gray-50">
          <div className="container mx-auto px-4">
            <div className="text-center mb-16 max-w-4xl mx-auto">
              <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-6">
                Ces conseils pourraient vous plaire
              </h2>
              <p className="text-lg text-muted-foreground">
                Découvrez d'autres conseils utiles de nos experts pour mieux entretenir vos installations
              </p>
            </div>
            
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
              {relatedPosts.map((relatedPost) => (
                <Card key={relatedPost.id} className="overflow-hidden hover:shadow-lg transition-all duration-300 transform hover:scale-105 bg-white border border-gray-200">
                  {relatedPost.cover_image_url && (
                    <div className="relative aspect-[4/3] overflow-hidden">
                      <img 
                        src={relatedPost.cover_image_url}
                        alt={relatedPost.title}
                        className="w-full h-full object-cover"
                        loading="lazy"
                      />
                      <div className="absolute top-4 left-4">
                        <span className="px-3 py-1 rounded-full text-sm font-medium bg-cyan-100 text-cyan-700">
                          Conseil
                        </span>
                      </div>
                    </div>
                  )}
                  <div className="p-6">
                    <h3 className="text-xl font-bold text-foreground mb-3 line-clamp-2">
                      {relatedPost.title}
                    </h3>
                    {relatedPost.excerpt && (
                      <p className="text-muted-foreground text-sm leading-relaxed mb-4 line-clamp-3">
                        {relatedPost.excerpt}
                      </p>
                    )}
                    
                    {relatedPost.published_at && (
                      <div className="flex items-center gap-2 text-xs text-muted-foreground mb-3">
                        <Calendar className="h-3 w-3" />
                        {new Date(relatedPost.published_at).toLocaleDateString('fr-FR', {
                          year: 'numeric',
                          month: 'long',
                          day: 'numeric'
                        })}
                      </div>
                    )}
                    
                    <Link 
                      to={`/carnet/${relatedPost.slug}`}
                      className="flex items-center gap-2 text-primary font-semibold hover:text-primary/80 transition-colors"
                    >
                      <span>Lire le conseil</span>
                      <ArrowRight className="w-4 h-4" />
                    </Link>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </section>
      )}
      
      <Footer />
    </>
  );
};

export default BlogPost;