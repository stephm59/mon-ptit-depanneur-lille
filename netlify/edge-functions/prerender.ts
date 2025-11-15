import type { Context } from "https://edge.netlify.com";

const PRERENDER_TOKEN = "1y1Q0unTDJdVoZAexohu";
const BOT_USER_AGENTS = [
  "googlebot", "bingbot", "yandex", "baiduspider",
  "facebookexternalhit", "twitterbot", "rogerbot", "linkedinbot",
  "embedly", "showyoubot", "outbrain", "slackbot",
  "redditbot", "applebot", "whatsapp", "flipboard",
  "tumblr", "bitlybot", "nuzzel", "discordbot",
  "qwantify", "telegrambot", "semrushbot", "dotbot",
  "ahrefsbot", "mj12bot", "screaming frog"
];

export default async (request: Request, context: Context) => {
  const userAgent = (request.headers.get("user-agent") || "").toLowerCase();
  
  // Vérifier si c'est un crawler
  const isBot = BOT_USER_AGENTS.some(bot => userAgent.includes(bot));
  
  if (!isBot) {
    // Pas un bot, laisser passer normalement
    return context.next();
  }
  
  // C'est un bot, proxifier vers Prerender.io
  const url = new URL(request.url);
  const prerenderUrl = `https://service.prerender.io/${url.href}`;
  
  console.log(`[Prerender] Bot détecté: ${userAgent}`);
  console.log(`[Prerender] Fetching: ${prerenderUrl}`);
  
  try {
    const response = await fetch(prerenderUrl, {
      headers: {
        "X-Prerender-Token": PRERENDER_TOKEN,
        "User-Agent": request.headers.get("user-agent") || ""
      }
    });
    
    console.log(`[Prerender] Response status: ${response.status}`);
    
    return new Response(response.body, {
      status: response.status,
      headers: response.headers
    });
  } catch (error) {
    console.error("[Prerender] Error:", error);
    // En cas d'erreur, laisser passer la requête normale
    return context.next();
  }
};

export const config = { path: "/*" };
