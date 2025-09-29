UPDATE blog_posts 
SET content = REPLACE(
  content,
  '## FAQ Premium ++

### Les "rénovations d''ampleur" MPR ont été suspendues — et pour la PAC par geste ?
La suspension a visé le parcours d''ampleur (guichet rouvert fin septembre 2025). Les monogestes (dont PAC par geste) restent ouverts avec barèmes dédiés.

### Puis-je cumuler MPR + CEE + éco-PTZ ?
Oui : cumul possible (selon conditions). L''éco-PTZ peut financer le reste à charge jusqu''à 50 000 €.

### La TVA 5,5 % s''applique aussi aux PAC air-air ?
Non. Air-eau / géothermie : oui. Air-air : non (TVA 20 %).

### Jusqu''à quand le "Coup de pouce Chauffage" ?
Opérations engagées jusqu''au 31/12/2025, achevées au plus tard le 31/12/2026 (minima : 2 500–4 000 € air-eau ; 5 000 € géothermie selon profil).

### Comment éviter les mauvaises surprises ?
Vérifiez RGE avant signature, déposez vos dossiers avant travaux, exigez un dimensionnement et une implantation acoustique soignée (cœur d''îlot lillois).',
  '## Questions fréquentes

<div class="faq-accordion space-y-4 mt-6">
  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Les rénovations d''ampleur MPR ont été suspendues — et pour la PAC par geste ?">
      <span>Les "rénovations d''ampleur" MPR ont été suspendues — et pour la PAC par geste ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>La suspension a visé le parcours d''ampleur (guichet rouvert fin septembre 2025). Les monogestes (dont PAC par geste) restent ouverts avec barèmes dédiés.</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Puis-je cumuler MPR + CEE + éco-PTZ ?">
      <span>Puis-je cumuler MPR + CEE + éco-PTZ ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Oui : cumul possible (selon conditions). L''éco-PTZ peut financer le reste à charge jusqu''à 50 000 €.</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="La TVA 5,5 % s''applique aussi aux PAC air-air ?">
      <span>La TVA 5,5 % s''applique aussi aux PAC air-air ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Non. Air-eau / géothermie : oui. Air-air : non (TVA 20 %).</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Jusqu''à quand le Coup de pouce Chauffage ?">
      <span>Jusqu''à quand le "Coup de pouce Chauffage" ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Opérations engagées jusqu''au 31/12/2025, achevées au plus tard le 31/12/2026 (minima : 2 500–4 000 € air-eau ; 5 000 € géothermie selon profil).</p>
    </div>
  </div>

  <div class="faq-item border border-muted rounded-lg">
    <button class="faq-question w-full text-left p-4 font-medium hover:bg-muted/50 transition-colors flex justify-between items-center" data-question="Comment éviter les mauvaises surprises ?">
      <span>Comment éviter les mauvaises surprises ?</span>
      <svg class="faq-icon w-5 h-5 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div class="faq-answer hidden p-4 pt-0 text-muted-foreground">
      <p>Vérifiez RGE avant signature, déposez vos dossiers avant travaux, exigez un dimensionnement et une implantation acoustique soignée (cœur d''îlot lillois).</p>
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
WHERE slug = 'aides-pompe-a-chaleur';