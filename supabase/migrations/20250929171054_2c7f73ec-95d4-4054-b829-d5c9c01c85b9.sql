UPDATE blog_posts 
SET content = REPLACE(
  content,
  '## FAQ

### Le "reset 5 minutes" peut-il suffire ?

Parfois oui (il vide un état électronique). S''il revient, passez la check-list (filtres, condensats, UE dégagée).

### Je peux ouvrir l''unité extérieure ?

Non. Risque électrique/frigorifique. Contentez-vous de dégager les grilles et retirer les feuilles/bâches.

### L''hiver, ma clim coupe avec un code

Souvent lié au givre : la machine dégivre. Si c''est très fréquent, l''UE est peut-être confinée ou mal orientée.

### Code de communication après orage

Vérifiez disjoncteur, terre, câbles visibles. Si le code persiste : diagnostic élec.

### Coffres "design" = moins de bruit et plus de sécurité ?

Attention : les coffres fermés font forcer l''UE → bruit et codes (surchauffe). Préférez un écran absorbant ventilé.

### L''entretien annuel sert-il vraiment ?

Oui : moins d''odeurs, moins de codes, meilleure conso, plus de longévité.',
  '## Questions fréquentes

<div class="faq-accordion space-y-4 mt-6">
  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Le reset 5 minutes peut-il suffire ?">
      <span>Le "reset 5 minutes" peut-il suffire ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Parfois oui (il vide un état électronique). S''il revient, passez la check-list (filtres, condensats, UE dégagée).</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Je peux ouvrir l''unité extérieure ?">
      <span>Je peux ouvrir l''unité extérieure ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Non. Risque électrique/frigorifique. Contentez-vous de dégager les grilles et retirer les feuilles/bâches.</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="L''hiver, ma clim coupe avec un code">
      <span>L''hiver, ma clim coupe avec un code</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Souvent lié au givre : la machine dégivre. Si c''est très fréquent, l''UE est peut-être confinée ou mal orientée.</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Code de communication après orage">
      <span>Code de communication après orage</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Vérifiez disjoncteur, terre, câbles visibles. Si le code persiste : diagnostic élec.</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Coffres design = moins de bruit et plus de sécurité ?">
      <span>Coffres "design" = moins de bruit et plus de sécurité ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Attention : les coffres fermés font forcer l''UE → bruit et codes (surchauffe). Préférez un écran absorbant ventilé.</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="L''entretien annuel sert-il vraiment ?">
      <span>L''entretien annuel sert-il vraiment ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Oui : moins d''odeurs, moins de codes, meilleure conso, plus de longévité.</p>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
  const faqItems = document.querySelectorAll(".faq-item");
  
  faqItems.forEach(item => {
    const question = item.querySelector(".faq-question");
    const answer = item.querySelector(".faq-answer");
    const icon = item.querySelector(".faq-icon");
    
    question.addEventListener("click", () => {
      const isOpen = !answer.classList.contains("hidden");
      
      // Close all other FAQ items
      faqItems.forEach(otherItem => {
        if (otherItem !== item) {
          otherItem.querySelector(".faq-answer").classList.add("hidden");
          otherItem.querySelector(".faq-icon").classList.remove("rotate-180");
        }
      });
      
      // Toggle current item
      if (isOpen) {
        answer.classList.add("hidden");
        icon.classList.remove("rotate-180");
      } else {
        answer.classList.remove("hidden");
        icon.classList.add("rotate-180");
      }
    });
  });
});
</script>'
)
WHERE slug = 'code-erreur-clim-premiers-reflexes';