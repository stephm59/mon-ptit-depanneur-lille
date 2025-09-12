import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

const MentionsLegales = () => {
  const navigate = useNavigate();

  useEffect(() => {
    // Redirection vers la home page avec ouverture de la modal
    const timer = setTimeout(() => {
      navigate('/?legal=true');
    }, 100);

    return () => clearTimeout(timer);
  }, [navigate]);

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="text-center">
        <h1 className="text-2xl font-bold mb-4">Redirection en cours...</h1>
        <p className="text-muted-foreground">Vous allez être redirigé vers nos mentions légales.</p>
      </div>
    </div>
  );
};

export default MentionsLegales;