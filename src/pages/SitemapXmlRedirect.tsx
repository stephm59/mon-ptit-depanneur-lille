import { useEffect } from "react";

const SitemapXmlRedirect = () => {
  useEffect(() => {
    // Redirection vers l'Edge Function qui génère le sitemap.xml dynamique
    window.location.href = "https://bpwqdkznbmqwvvxpthhl.supabase.co/functions/v1/generate-sitemap";
  }, []);

  return (
    <div className="container mx-auto px-6 py-20 text-center">
      <p>Redirection vers le sitemap...</p>
    </div>
  );
};

export default SitemapXmlRedirect;
