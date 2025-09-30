import { createRoot } from 'react-dom/client'
import emailjs from '@emailjs/browser'
import App from './App.tsx'
import './index.css'

// Initialize EmailJS
emailjs.init('JWcps7Vj8BkvDAzsc');

createRoot(document.getElementById("root")!).render(<App />);
