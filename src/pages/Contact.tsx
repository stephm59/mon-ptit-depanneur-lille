const Contact = () => {
  console.log("Contact component is rendering!");
  
  return (
    <div style={{ minHeight: "100vh", backgroundColor: "#f9fafb", padding: "32px 0" }}>
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "0 16px" }}>
        <h1 style={{ fontSize: "36px", fontWeight: "bold", textAlign: "center", marginBottom: "32px", color: "#111827" }}>
          Contact - Version Test avec CSS inline
        </h1>
        <div style={{ backgroundColor: "white", padding: "32px", borderRadius: "8px", boxShadow: "0 10px 15px -3px rgba(0, 0, 0, 0.1)" }}>
          <p style={{ fontSize: "18px", textAlign: "center", color: "#374151" }}>
            Test de la page Contact avec CSS inline - Si vous voyez ceci, le composant fonctionne !
          </p>
          <p style={{ fontSize: "14px", textAlign: "center", color: "#6b7280", marginTop: "16px" }}>
            Debug: Le composant Contact se charge correctement.
          </p>
        </div>
      </div>
    </div>
  );
};

export default Contact;