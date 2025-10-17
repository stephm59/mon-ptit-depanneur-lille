import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { ErrorBoundary } from "@/components/ui/error-boundary";
import { ChatWidget } from "@/components/widgets/ChatWidget";
import { LocalReviewsWidget } from "@/components/widgets/LocalReviewsWidget";
import { useScrollToTop } from "@/hooks/useScrollToTop";
import Index from "./pages/Index";
import UniversalRouter from "./pages/UniversalRouter";
import BlogPost from "./pages/BlogPost";
import BlogCarnet from "./pages/BlogCarnet";
import Contact from "./pages/Contact";
import Entreprise from "./pages/Entreprise";
import MentionsLegales from "./pages/MentionsLegales";
import Avis from "./pages/Avis";
import NotFound from "./pages/NotFound";
import Sitemap from "./pages/Sitemap";

const queryClient = new QueryClient();

// Component to handle scroll to top on route changes
const ScrollToTop = () => {
  useScrollToTop();
  return null;
};

const App = () => (
  <ErrorBoundary>
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <Toaster />
        <Sonner />
        <BrowserRouter>
          <ScrollToTop />
          <Routes>
            {/* Routes spécifiques - DOIVENT être en premier */}
            <Route path="/" element={<Index />} />
            <Route path="/contact" element={<Contact />} />
            <Route path="/entreprise" element={<Entreprise />} />
            <Route path="/avis" element={<Avis />} />
            <Route path="/mentions-legales" element={<MentionsLegales />} />
            <Route path="/carnet" element={<BlogCarnet />} />
            <Route path="/carnet/:slug" element={<BlogPost />} />
            <Route path="/sitemap" element={<Sitemap />} />
              
              {/* Redirections des anciennes URLs vers les nouvelles */}
              <Route path="/choisir-adoucisseur-eau" element={<Navigate to="/carnet/choisir-adoucisseur-eau" replace />} />
              <Route path="/choisir-chauffe-eau" element={<Navigate to="/carnet/choisir-chauffe-eau" replace />} />
              <Route path="/comment-reparer-fuites-eau" element={<Navigate to="/carnet/comment-reparer-fuites-eau" replace />} />
              <Route path="/comment-purger-radiateurs" element={<Navigate to="/carnet/comment-purger-radiateurs" replace />} />
              <Route path="/fuites-intoxictions-monoxyde-carbone" element={<Navigate to="/carnet/fuites-intoxictions-monoxyde-carbone" replace />} />
              <Route path="/chauffage-ete" element={<Navigate to="/carnet/chauffage-ete" replace />} />
              <Route path="/chaudieres-a-condensation" element={<Navigate to="/carnet/chaudieres-a-condensation" replace />} />
              <Route path="/differents-types-chaudieres" element={<Navigate to="/carnet/differents-types-chaudieres" replace />} />
              <Route path="/thermostat-sans-fil-avantage-reduction-deconomie/" element={<Navigate to="/carnet/thermostat-sans-fil-avantages" replace />} />
              <Route path="/maintenance-chaudiere" element={<Navigate to="/carnet/maintenance-chaudiere" replace />} />
              <Route path="/variation-temperatures-plomberie" element={<Navigate to="/carnet/variation-temperatures-plomberie" replace />} />
              <Route path="/regulation-chauffage" element={<Navigate to="/carnet/regulation-chauffage" replace />} />
              <Route path="/au-secours-ma-chasse-deau-ne-fonctionne-plus" element={<Navigate to="/carnet/au-secours-ma-chasse-deau-ne-fonctionne-plus" replace />} />
              <Route path="/entretien-annuel-chaudiere" element={<Navigate to="/carnet/entretien-annuel-chaudiere" replace />} />
              <Route path="/7-astuces-deboucher-canalisations" element={<Navigate to="/carnet/7-astuces-deboucher-canalisations" replace />} />
              <Route path="/planifier-entretien-chaudiere" element={<Navigate to="/carnet/planifier-entretien-chaudiere" replace />} />
              <Route path="/prevenir-fuite-eau" element={<Navigate to="/carnet/prevenir-fuite-eau" replace />} />
              <Route path="/5-pas-reparer-fuite-eau" element={<Navigate to="/carnet/reparer-fuite-eau-soi-meme" replace />} />
          <Route path="/comment-choisir-raccord" element={<Navigate to="/carnet/comment-choisir-raccord" replace />} />
          <Route path="/guide-achat" element={<Navigate to="/" replace />} />
          <Route path="/comprendre-cumulus" element={<Navigate to="/carnet/chauffe-eau-electrique-cumulus" replace />} />
              <Route path="/types-tuyauterie" element={<Navigate to="/carnet/types-tuyauterie" replace />} />
              <Route path="/role-tuyauterie-plomberie" element={<Navigate to="/carnet/role-tuyauterie-plomberie" replace />} />
              <Route path="/chaudiere-chauffe-eau-electrique-ou-gaz" element={<Navigate to="/carnet/choisir-chaudiere-ou-chauffe-eau" replace />} />
              <Route path="/differents-types-serrures" element={<Navigate to="/carnet/differents-types-serrures" replace />} />
              <Route path="/comment-changer-serrure" element={<Navigate to="/carnet/comment-changer-serrure" replace />} />
              <Route path="/fuite-du-groupe-de-securite-de-votre-chauffe-eau-pas-de-panique" element={<Navigate to="/carnet/fuite-groupe-securite-chauffe-eau" replace />} />
              <Route path="/cintrage" element={<Navigate to="/carnet/cintrage" replace />} />
              <Route path="/vanne" element={<Navigate to="/carnet/vanne" replace />} />
              <Route path="/mitigeur-panne" element={<Navigate to="/carnet/mitigeur-panne" replace />} />
              <Route path="/mousseurs" element={<Navigate to="/carnet/detartrer-mousseur-robinet" replace />} />
              <Route path="/mitigeurs" element={<Navigate to="/carnet/difference-mitigeur-melangeur-thermostatique" replace />} />
              <Route path="/mitigeur-thermostatique" element={<Navigate to="/carnet/mitigeur-thermostatique-fonctionnement-avantages" replace />} />
              <Route path="/guide-entretien-ballon-eau-chaude" element={<Navigate to="/carnet/guide-entretien-ballon-eau-chaude" replace />} />
              <Route path="/deboucher-evier-bouche" element={<Navigate to="/carnet/deboucher-evier-bouche" replace />} />
              <Route path="/fuite-chez-moi" element={<Navigate to="/carnet/detecter-fuite-eau-maison" replace />} />
              <Route path="/lecture-compteur-eau" element={<Navigate to="/carnet/lecture-compteur-eau" replace />} />
              <Route path="/carnet/remplacement-chaudiere-pac-etapes-delais" element={<Navigate to="/carnet/remplacer-chaudiere-par-pompe-chaleur" replace />} />
              <Route path="/comment-retourner-un-pene-demi-tour" element={<Navigate to="/carnet/comment-retourner-un-pene-demi-tour" replace />} />
              <Route path="/comment-retourner-un-pene-demi-tour/" element={<Navigate to="/carnet/comment-retourner-un-pene-demi-tour" replace />} />
              
              {/* Redirections articles de blog depuis _redirects */}
              <Route path="/nettoyage-de-canalisation" element={<Navigate to="/carnet/7-astuces-deboucher-canalisations" replace />} />
              <Route path="/nettoyage-de-canalisation/" element={<Navigate to="/carnet/7-astuces-deboucher-canalisations" replace />} />
              <Route path="/regler-reducteur-pression/" element={<Navigate to="/carnet/regler-reducteur-pression" replace />} />
              <Route path="/guide-systemes-plomberie/" element={<Navigate to="/carnet/guide-systemes-plomberie" replace />} />
              <Route path="/composant-serrure-porte/" element={<Navigate to="/carnet/composant-serrure-porte" replace />} />
              <Route path="/chauffe-eau/" element={<Navigate to="/carnet/chauffe-eau" replace />} />
              <Route path="/quel-cylindre-porte-entree/" element={<Navigate to="/carnet/quel-cylindre-porte-entree" replace />} />
              <Route path="/code-erreur-chaudiere/" element={<Navigate to="/carnet/code-erreur-chaudiere-signification" replace />} />
              <Route path="/tuyauterie-role/" element={<Navigate to="/carnet/role-tuyauterie-plomberie" replace />} />
              <Route path="/evier-bouche" element={<Navigate to="/carnet/7-astuces-deboucher-canalisations" replace />} />
              <Route path="/evier-bouche/" element={<Navigate to="/carnet/7-astuces-deboucher-canalisations" replace />} />
              <Route path="/gaz-dans-vitrages-quelle-utilite/" element={<Navigate to="/carnet/gaz-dans-vitrages-quelle-utilite" replace />} />
              
              {/* Redirections pages service-ville depuis _redirects */}
              <Route path="/plomberie-lille" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/pompe-chaleur-lille" element={<Navigate to="/pompe-a-chaleur-lille" replace />} />
              <Route path="/plombier-wasquehal/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plomberie-wasquehal" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plomberie-wasquehal/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/serrurier-hellemmes" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurier-hellemmes/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurerie-hellemmes" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurerie-hellemmes/" element={<Navigate to="/serrurier-lille" replace />} />
              
              {/* Redirections pages auteur et pagination obsolètes depuis _redirects */}
              <Route path="/author/yamile/page/2/" element={<Navigate to="/carnet" replace />} />
              <Route path="/author/yamile/page/5/" element={<Navigate to="/carnet" replace />} />
              <Route path="/author/yamile/feed/" element={<Navigate to="/" replace />} />
              <Route path="/lecture-compteur-eau/1000" element={<Navigate to="/carnet/lecture-compteur-eau" replace />} />
              <Route path="/lecture-compteur-eau" element={<Navigate to="/carnet/lecture-compteur-eau" replace />} />
              <Route path="/lecture-compteur-eau/" element={<Navigate to="/carnet/lecture-compteur-eau" replace />} />
              <Route path="/lecture-compteur-eau//1000" element={<Navigate to="/carnet/lecture-compteur-eau" replace />} />
              
              {/* Redirections pages service-ville supplémentaires */}
              <Route path="/plombier-faches-thumesnil/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/serrurier-wasquehal-2/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/plombier-beaucamps-ligny/" element={<Navigate to="/plombier-lille" replace />} />
              
              {/* Redirection blog vers carnet */}
              <Route path="/blog" element={<Navigate to="/carnet" replace />} />
              <Route path="/blog/" element={<Navigate to="/carnet" replace />} />
              
              {/* Redirections WordPress obsolètes */}
              <Route path="/contact/*" element={<Navigate to="/" replace />} />
              <Route path="/wp-content/*" element={<Navigate to="/" replace />} />
              
              {/* Redirections marques serrurerie supplémentaires */}
              <Route path="/serrurier-fichet-lille" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurier-fichet-lille/" element={<Navigate to="/serrurier-lille" replace />} />

              {/* Feeds RSS pages service-ville obsolètes */}
              <Route path="/plombier-sainghin-en-weppes/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-fleurbaix/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-emmerin/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-wasquehal/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-villeneuve-d-ascq/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-lezennes/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-wavrin/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-wattignies/feed/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/chauffagiste-lille/feed/" element={<Navigate to="/chauffagiste-lille" replace />} />

              {/* Pages interventions obsolètes */}
              <Route path="/interventions-serrurerie" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/interventions-serrurerie/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/interventions-plomberie" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/interventions-plomberie/" element={<Navigate to="/plombier-lille" replace />} />

              {/* Feed RSS accueil obsolète */}
              <Route path="/accueil/feed/" element={<Navigate to="/" replace />} />

              {/* Pages service-ville supplémentaires vers pages principales */}
              <Route path="/serrurier-lambersart" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurier-lambersart/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/renovation-salle-de-bains-lomme" element={<Navigate to="/renovation-salle-de-bains-lille" replace />} />
              <Route path="/renovation-salle-de-bains-lomme/" element={<Navigate to="/renovation-salle-de-bains-lille" replace />} />
              <Route path="/chauffagiste-lambersart" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/chauffagiste-lambersart/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/vitrier-villeneuve-d-ascq" element={<Navigate to="/vitrier-lille" replace />} />
              <Route path="/vitrier-villeneuve-d-ascq/" element={<Navigate to="/vitrier-lille" replace />} />
              
              {/* Redirections des anciennes pages générales */}
              <Route path="/accueil/" element={<Navigate to="/" replace />} />
              <Route path="/services/" element={<Navigate to="/" replace />} />
              <Route path="/nous-contacter/" element={<Navigate to="/" replace />} />
              <Route path="/plan-dacces/" element={<Navigate to="/" replace />} />
              
              <Route path="/blog-2/" element={<Navigate to="/carnet" replace />} />
              <Route path="/gallery/" element={<Navigate to="/avis" replace />} />
              <Route path="/mentions-legales/" element={<Navigate to="/mentions-legales" replace />} />
              
              {/* Redirections services techniques spécifiques vers services généraux */}
              <Route path="/installation-serrure-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/ouverture-porte-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/blindage-porte-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/changement-barillet-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/detartrage-chaudiere-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/depannage-chaudiere-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/installation-chaudiere-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/remplacement-chaudiere-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/entretien-chaudiere-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/reparation-chaudiere-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/recherche-fuite-eau-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/debouchage-canalisation-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/degorgement-canalisation-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/salle-bains-lille/" element={<Navigate to="/renovation-salle-de-bains-lille" replace />} />
              <Route path="/installation-robinet-thermostatique-lille/" element={<Navigate to="/plombier-lille" replace />} />
              
              {/* Redirections marques vers services généraux */}
              <Route path="/serrurier-bricard-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurier-iseo-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurier-city-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/serrurier-vachette-lille/" element={<Navigate to="/serrurier-lille" replace />} />
              <Route path="/plombier-atlantic-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-grohe-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-jacob-delafon-lille-2/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-porcher-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-delabie-lille/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/plombier-geberit-lille-2/" element={<Navigate to="/plombier-lille" replace />} />
              <Route path="/chauffagiste-chappee-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/chauffagiste-saunier-duval-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/chauffagiste-vaillant-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/chauffagiste-viessman-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              <Route path="/chauffagiste-frisquet-lille/" element={<Navigate to="/chauffagiste-lille" replace />} />
              
              {/* Correction faute de frappe et pages obsolètes */}
              <Route path="/pompe-achaleur-lompret/" element={<Navigate to="/pompe-a-chaleur-lompret" replace />} />
              <Route path="/page-d-exemple/" element={<Navigate to="/" replace />} />
              <Route path="/serious-lead-lead-generation-for-school-education-companies/" element={<Navigate to="/" replace />} />
              
              {/* IMPORTANT: Route catch-all DOIT être en dernier */}
              <Route path="/:slug" element={<UniversalRouter />} />
              <Route path="*" element={<NotFound />} />
            </Routes>
          <ChatWidget />
          <LocalReviewsWidget />
        </BrowserRouter>
      </TooltipProvider>
    </QueryClientProvider>
  </ErrorBoundary>
);

export default App;