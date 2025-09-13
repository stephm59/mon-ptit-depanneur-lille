import { useEffect } from "react";
import { useSitemapData, generateSitemapXml } from "@/components/seo/SitemapGenerator";

const Sitemap = () => {
  const { data, isLoading, error } = useSitemapData();

  useEffect(() => {
    if (data) {
      // Générer le XML du sitemap
      const sitemapXml = generateSitemapXml(data);
      
      // Définir le type de contenu comme XML
      const response = new Response(sitemapXml, {
        headers: {
          'Content-Type': 'application/xml',
        },
      });
      
      // Envoyer le XML au navigateur
      const blob = new Blob([sitemapXml], { type: 'application/xml' });
      const url = URL.createObjectURL(blob);
      
      // Rediriger vers le blob pour afficher le XML
      window.location.replace(`data:application/xml;charset=utf-8,${encodeURIComponent(sitemapXml)}`);
    }
  }, [data]);

  if (isLoading) {
    return (
      <div className="container mx-auto px-6 py-20 text-center">
        <h1 className="text-2xl font-bold mb-4">Génération du sitemap...</h1>
        <p>Veuillez patienter pendant que nous générons le sitemap XML.</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="container mx-auto px-6 py-20 text-center">
        <h1 className="text-2xl font-bold mb-4 text-red-600">Erreur</h1>
        <p>Une erreur s'est produite lors de la génération du sitemap.</p>
      </div>
    );
  }

  return (
    <div className="container mx-auto px-6 py-20 text-center">
      <h1 className="text-2xl font-bold mb-4">Sitemap généré</h1>
      <p>Le sitemap XML a été généré avec succès.</p>
    </div>
  );
};

export default Sitemap;