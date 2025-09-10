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
            <Route path="/maintenance-chaudiere" element={<Navigate to="/carnet/maintenance-chaudiere" replace />} />
            <Route path="/variation-temperatures-plomberie" element={<Navigate to="/carnet/variation-temperatures-plomberie" replace />} />
            <Route path="/regulation-chauffage" element={<Navigate to="/carnet/regulation-chauffage" replace />} />
            <Route path="/planifier-entretien-chaudiere" element={<Navigate to="/carnet/planifier-entretien-chaudiere" replace />} />
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