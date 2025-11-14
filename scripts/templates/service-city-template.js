export function generateTemplate({ page, service, city, offers, faqs, testimonials, jsonLd, baseUrl }) {
  const url = `${baseUrl}/${service.slug}-${city.slug}`;
  
  return `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${escapeHtml(page.meta_title || page.h1)}</title>
  <meta name="description" content="${escapeHtml(page.meta_description || page.intro_description)}">
  
  <!-- Canonical -->
  <link rel="canonical" href="${url}">
  
  <!-- Open Graph -->
  <meta property="og:title" content="${escapeHtml(page.meta_title || page.h1)}">
  <meta property="og:description" content="${escapeHtml(page.meta_description)}">
  <meta property="og:url" content="${url}">
  <meta property="og:type" content="website">
  <meta property="og:locale" content="fr_FR">
  
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="${escapeHtml(page.meta_title || page.h1)}">
  <meta name="twitter:description" content="${escapeHtml(page.meta_description)}">
  
  <!-- Favicons -->
  <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
  <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
  
  <!-- Fonts & Styles -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    :root {
      --background: 0 0% 100%;
      --foreground: 222.2 84% 4.9%;
      --card: 0 0% 100%;
      --card-foreground: 222.2 84% 4.9%;
      --popover: 0 0% 100%;
      --popover-foreground: 222.2 84% 4.9%;
      --primary: 221.2 83.2% 53.3%;
      --primary-foreground: 210 40% 98%;
      --secondary: 210 40% 96.1%;
      --secondary-foreground: 222.2 47.4% 11.2%;
      --muted: 210 40% 96.1%;
      --muted-foreground: 215.4 16.3% 46.9%;
      --accent: 217.2 91.2% 59.8%;
      --accent-foreground: 210 40% 98%;
      --destructive: 0 84.2% 60.2%;
      --destructive-foreground: 210 40% 98%;
      --border: 214.3 31.8% 91.4%;
      --input: 214.3 31.8% 91.4%;
      --ring: 221.2 83.2% 53.3%;
      --radius: 0.5rem;
    }
    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      background: hsl(var(--background));
      color: hsl(var(--foreground));
      line-height: 1.6;
      -webkit-font-smoothing: antialiased;
    }
    .container { max-width: 1280px; margin: 0 auto; padding: 0 1.5rem; }
    .btn-primary {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      background: hsl(var(--accent));
      color: hsl(var(--accent-foreground));
      padding: 1rem 2rem;
      border-radius: var(--radius);
      font-weight: 600;
      text-decoration: none;
      transition: all 0.3s;
      border: none;
      cursor: pointer;
      font-size: 1.125rem;
    }
    .btn-primary:hover { opacity: 0.9; transform: translateY(-2px); }
    .card {
      background: hsl(var(--card));
      border: 1px solid hsl(var(--border));
      border-radius: var(--radius);
      padding: 1.5rem;
      transition: all 0.3s;
    }
    .card:hover { box-shadow: 0 10px 30px -10px rgba(0,0,0,0.1); transform: translateY(-4px); }
    header {
      position: sticky;
      top: 0;
      z-index: 50;
      background: hsl(var(--background) / 0.95);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid hsl(var(--border));
    }
    header .container {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding-top: 1rem;
      padding-bottom: 1rem;
    }
    header img { height: 60px; width: auto; }
    .hero {
      background: linear-gradient(135deg, hsl(var(--accent) / 0.1), hsl(var(--background)));
      padding: 4rem 0;
      text-align: center;
    }
    .hero h1 {
      font-size: clamp(2rem, 5vw, 3.5rem);
      font-weight: 700;
      margin-bottom: 1.5rem;
      color: hsl(var(--foreground));
    }
    .hero p {
      font-size: 1.25rem;
      color: hsl(var(--muted-foreground));
      max-width: 800px;
      margin: 0 auto 2rem;
    }
    .section { padding: 4rem 0; }
    .section-title {
      font-size: 2.5rem;
      font-weight: 700;
      text-align: center;
      margin-bottom: 1rem;
      color: hsl(var(--foreground));
    }
    .section-subtitle {
      font-size: 1.125rem;
      text-align: center;
      color: hsl(var(--muted-foreground));
      max-width: 42rem;
      margin: 0 auto 3rem;
    }
    .grid {
      display: grid;
      gap: 1.5rem;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    }
    .offer-emoji { font-size: 3rem; margin-bottom: 1rem; }
    .offer-title { font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem; }
    .offer-desc { color: hsl(var(--muted-foreground)); }
    .testimonial-rating { color: #FFD700; font-size: 1.25rem; margin-bottom: 0.5rem; }
    .testimonial-content { font-style: italic; margin-bottom: 1rem; color: hsl(var(--muted-foreground)); }
    .testimonial-author { font-weight: 600; font-size: 0.875rem; }
    details {
      border: 1px solid hsl(var(--border));
      border-radius: var(--radius);
      padding: 1rem 1.5rem;
      margin-bottom: 1rem;
      background: hsl(var(--card));
    }
    summary {
      font-weight: 600;
      cursor: pointer;
      list-style: none;
      user-select: none;
    }
    summary::-webkit-details-marker { display: none; }
    details[open] summary { margin-bottom: 1rem; }
    .cta-section {
      background: linear-gradient(135deg, hsl(var(--accent) / 0.1), hsl(var(--background)));
      text-align: center;
    }
    footer {
      background: hsl(var(--secondary));
      color: hsl(var(--secondary-foreground));
      padding: 3rem 0 1.5rem;
      margin-top: 4rem;
    }
    .footer-grid {
      display: grid;
      gap: 2rem;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      margin-bottom: 2rem;
    }
    .footer-title { font-weight: 600; margin-bottom: 1rem; font-size: 1.125rem; }
    .footer-link {
      display: block;
      color: hsl(var(--muted-foreground));
      text-decoration: none;
      margin-bottom: 0.5rem;
      transition: color 0.3s;
    }
    .footer-link:hover { color: hsl(var(--accent)); }
    .copyright {
      text-align: center;
      padding-top: 2rem;
      border-top: 1px solid hsl(var(--border));
      color: hsl(var(--muted-foreground));
      font-size: 0.875rem;
    }
    .mobile-call-btn {
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      z-index: 50;
      display: none;
      background: hsl(var(--accent));
      color: hsl(var(--accent-foreground));
      padding: 1rem;
      text-align: center;
      text-decoration: none;
      font-weight: 600;
      font-size: 1.125rem;
      box-shadow: 0 -4px 20px rgba(0,0,0,0.1);
    }
    @media (max-width: 768px) {
      .mobile-call-btn { display: block; }
      body { padding-bottom: 60px; }
    }
  </style>
  
  <script type="application/ld+json">${jsonLd}</script>
</head>
<body>
  <!-- Header -->
  <header>
    <div class="container">
      <a href="/">
        <img src="/src/assets/logo-mon-ptit-depanneur.png" alt="Mon p'tit Dépanneur" />
      </a>
      <a href="tel:0328534868" class="btn-primary">
        📞 03 28 53 48 68
      </a>
    </div>
  </header>

  <main>
    <!-- Hero Section -->
    <section class="hero">
      <div class="container">
        <h1>${escapeHtml(page.h1)}</h1>
        <p>${escapeHtml(page.intro_description)}</p>
        <a href="tel:0328534868" class="btn-primary">
          📞 Appeler maintenant : 03 28 53 48 68
        </a>
      </div>
    </section>

    ${offers.length > 0 ? `
    <!-- Section Offres -->
    <section class="section">
      <div class="container">
        <h2 class="section-title">${escapeHtml(page.h2_intro || `Nos services de ${service.name} à ${city.name}`)}</h2>
        <p class="section-subtitle">Intervention rapide, devis gratuit et travaux garantis</p>
        <div class="grid">
          ${offers.map(offer => `
            <div class="card">
              <div class="offer-emoji">${offer.emoji || '🔧'}</div>
              <h3 class="offer-title">${escapeHtml(offer.title)}</h3>
              <p class="offer-desc">${escapeHtml(offer.description)}</p>
            </div>
          `).join('')}
        </div>
      </div>
    </section>
    ` : ''}

    ${testimonials.length > 0 ? `
    <!-- Section Témoignages -->
    <section class="section" style="background: hsl(var(--muted) / 0.3);">
      <div class="container">
        <h2 class="section-title">Avis clients à ${escapeHtml(city.name)}</h2>
        <p class="section-subtitle">Ce que nos clients disent de nous</p>
        <div class="grid">
          ${testimonials.map(t => `
            <div class="card">
              <div class="testimonial-rating">${'⭐'.repeat(t.rating)}</div>
              <p class="testimonial-content">"${escapeHtml(t.content)}"</p>
              <cite class="testimonial-author">— ${escapeHtml(t.author_name)}${t.location ? `, ${escapeHtml(t.location)}` : ''}</cite>
            </div>
          `).join('')}
        </div>
      </div>
    </section>
    ` : ''}

    ${faqs.length > 0 ? `
    <!-- Section FAQ -->
    <section class="section">
      <div class="container">
        <h2 class="section-title">Questions fréquentes</h2>
        <p class="section-subtitle">Trouvez rapidement les réponses à vos questions</p>
        <div style="max-width: 56rem; margin: 0 auto;">
          ${faqs.map(faq => `
            <details>
              <summary>${escapeHtml(faq.question)}</summary>
              <p style="color: hsl(var(--muted-foreground)); margin-top: 0.5rem;">${escapeHtml(faq.answer)}</p>
            </details>
          `).join('')}
        </div>
      </div>
    </section>
    ` : ''}

    <!-- Section CTA -->
    <section class="section cta-section">
      <div class="container">
        <h2 class="section-title">${escapeHtml(page.cta_title || `Besoin d'un ${service.name} à ${city.name} ?`)}</h2>
        <p class="section-subtitle">${escapeHtml(page.cta_subtitle)}</p>
        <a href="tel:0328534868" class="btn-primary">
          📞 Appeler le 03 28 53 48 68
        </a>
      </div>
    </section>

    ${page.zones_text ? `
    <!-- Section Zones -->
    <section class="section">
      <div class="container">
        <h2 class="section-title">Zones d'intervention</h2>
        <p style="text-align: center; max-width: 56rem; margin: 0 auto; color: hsl(var(--muted-foreground));">
          ${escapeHtml(page.zones_text)}
        </p>
      </div>
    </section>
    ` : ''}
  </main>

  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="footer-grid">
        <div>
          <h3 class="footer-title">Mon p'tit Dépanneur</h3>
          <p style="color: hsl(var(--muted-foreground)); margin-bottom: 1rem;">
            Dépannage plomberie, chauffage et serrurerie 24h/24, 7j/7 dans la métropole lilloise.
          </p>
          <a href="tel:0328534868" class="btn-primary">📞 03 28 53 48 68</a>
        </div>
        <div>
          <h3 class="footer-title">Accès rapide</h3>
          <a href="/" class="footer-link">Accueil</a>
          <a href="/entreprise" class="footer-link">L'entreprise</a>
          <a href="/avis" class="footer-link">Avis clients</a>
          <a href="/contact" class="footer-link">Contact</a>
        </div>
        <div>
          <h3 class="footer-title">Nos services</h3>
          <a href="/plombier-lille" class="footer-link">Plomberie</a>
          <a href="/chauffagiste-lille" class="footer-link">Chauffage</a>
          <a href="/serrurier-lille" class="footer-link">Serrurerie</a>
        </div>
        <div>
          <h3 class="footer-title">Contact</h3>
          <p style="color: hsl(var(--muted-foreground)); margin-bottom: 0.5rem;">📞 03 28 53 48 68</p>
          <p style="color: hsl(var(--muted-foreground)); margin-bottom: 0.5rem;">📍 12 Rue de la République<br>59000 Lille</p>
        </div>
      </div>
      <div class="copyright">
        <p>&copy; ${new Date().getFullYear()} Mon p'tit Dépanneur. Tous droits réservés.</p>
      </div>
    </div>
  </footer>

  <!-- Mobile Call Button -->
  <a href="tel:0328534868" class="mobile-call-btn">
    📞 03 28 53 48 68
  </a>
</body>
</html>`;
}

function escapeHtml(text) {
  if (!text) return '';
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}
