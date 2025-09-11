import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { ErrorBoundary } from "@/components/ui/error-boundary";
import Index from "./pages/Index";
import UniversalRouter from "./pages/UniversalRouter";
import BlogPost from "./pages/BlogPost";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const App = () => (
  <ErrorBoundary>
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <Toaster />
        <Sonner />
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<Index />} />
            <Route path="/carnet/:slug" element={<BlogPost />} />
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
            <Route path="/:slug" element={<UniversalRouter />} />
            {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
            <Route path="*" element={<NotFound />} />
          </Routes>
        </BrowserRouter>
      </TooltipProvider>
    </QueryClientProvider>
  </ErrorBoundary>
);

export default App;