import { createRoot } from 'react-dom/client'
import emailjs from '@emailjs/browser'
import App from './App.tsx'
import './index.css'
import { initWebVitals } from './utils/webVitals'

// Initialize EmailJS
emailjs.init('JWcps7Vj8BkvDAzsc');

// Initialize Web Vitals monitoring
if (!import.meta.env.DEV) {
  initWebVitals();
}

createRoot(document.getElementById("root")!).render(<App />);
