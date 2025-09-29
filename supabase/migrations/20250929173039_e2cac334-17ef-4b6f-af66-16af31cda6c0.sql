-- Add FAQs for desambuer-radiateur article and remove FAQ HTML from content
-- Get the blog post id
DO $$
DECLARE
  v_blog_post_id uuid;
BEGIN
  SELECT id INTO v_blog_post_id FROM blog_posts WHERE slug = 'desambuer-radiateur';
  
  -- Insert FAQs
  INSERT INTO blog_post_faqs (blog_post_id, question, answer, position) VALUES
  (v_blog_post_id, 'Un simple rinçage suffit-il ?', 'Non. Le nettoyant aide à décoller les oxydes ; sans lui, une partie reste accrochée.', 1),
  (v_blog_post_id, 'Dois-je désembouer si j''ai des radiateurs en fonte ?', 'Oui. La fonte accumule la boue au bas. Le rinçage améliore beaucoup la diffusion.', 2),
  (v_blog_post_id, 'J''entends des glouglous : c''est de l''air ou de la boue ?', 'Souvent les deux : la boue piège l''air. Après désembouage + purge, les bruits disparaissent.', 3),
  (v_blog_post_id, 'Ça risque d''abîmer mes radiateurs ?', 'Non, la méthode est doux-ménage pour le métal. On évite les chocs hydrauliques, on protège les joints.', 4),
  (v_blog_post_id, 'Combien de temps durent les effets ?', 'Avec filtre magnétique + inhibiteur, comptez plusieurs années. On fait un contrôle annuel et un "rappel" préventif 5–7 ans plus tard.', 5),
  (v_blog_post_id, 'Je peux le faire moi-même ?', 'Vous pouvez purger et rincer un radiateur isolé. Pour le réseau entier et la protection durable, l''outillage et les produits pro font la différence.', 6),
  (v_blog_post_id, 'Faut-il désembouer avant de changer de chaudière/PAC ?', 'Oui, c''est même le meilleur moment : vous protégez l''appareil neuf et vous stabilisez les réglages.', 7);
  
  -- Remove FAQ HTML section from content (everything after "Ce qu'on fait de plus")
  UPDATE blog_posts 
  SET content = SUBSTRING(content FROM 1 FOR POSITION('<h2>Questions fréquentes</h2>' IN content) - 1) || 
                '<h2>Quand nous contacter ?</h2>

<p>Vous soupçonnez un réseau emboué, ou vous préparez un changement de chaudière/PAC ? <strong>Mon p''tit Dépanneur intervient dans toute la métropole lilloise</strong> pour un désembouage pro, rapide et durable.</p>

<p>📞 <strong>03 28 53 48 68</strong> — Devis gratuit, intervention sous 48h, rapport détaillé.</p>

<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@graph":[
    {
      "@type":"WebPage",
      "@id":"https://www.monptitdepanneur.fr/carnet/desambuer-radiateur",
      "url":"https://www.monptitdepanneur.fr/carnet/desambuer-radiateur",
      "name":"Pourquoi désembouer les radiateurs ? (guide clair, spécial Lille)",
      "description":"Boue dans les radiateurs : symptômes, méthodes de désembouage (chimique/hydrodynamique), durée, prix, filtrage magnétique et inhibiteur. Conseils maisons 1930 et copro à Lille.",
      "inLanguage":"fr-FR",
      "isPartOf":{
        "@type":"WebSite",
        "name":"Mon p''tit Dépanneur",
        "url":"https://www.monptitdepanneur.fr"
      },
      "primaryImageOfPage":{
        "@type":"ImageObject",
        "url":"https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/desambuer-radiateur.webp"
      }
    },
    {
      "@type":"BreadcrumbList",
      "@id":"https://www.monptitdepanneur.fr/carnet/desambuer-radiateur#bread",
      "itemListElement":[
        {"@type":"ListItem","position":1,"name":"Accueil","item":"https://www.monptitdepanneur.fr/"},
        {"@type":"ListItem","position":2,"name":"Carnet","item":"https://www.monptitdepanneur.fr/carnet/"},
        {"@type":"ListItem","position":3,"name":"Pourquoi désembouer les radiateurs ?"}
      ]
    },
    {
      "@type":"Article",
      "@id":"https://www.monptitdepanneur.fr/carnet/desambuer-radiateur#article",
      "headline":"Pourquoi désembouer les radiateurs ?",
      "description":"Tout comprendre sur le désembouage : causes des boues, signes, méthodes, coûts et effets sur confort/consommation. Focus Lille, maisons 1930, PAC air-eau et filtre magnétique.",
      "articleSection":["Chauffage","Entretien","Désembouage"],
      "inLanguage":"fr-FR",
      "author":{"@type":"Organization","name":"Mon p''tit Dépanneur"},
      "publisher":{
        "@type":"Organization",
        "name":"Mon p''tit Dépanneur",
        "logo":{"@type":"ImageObject","url":"https://www.monptitdepanneur.fr/static/logo.png"}
      },
      "image":"https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/desambuer-radiateur.webp",
      "datePublished":"2025-09-29",
      "dateModified":"2025-09-29",
      "mainEntityOfPage":{"@id":"https://www.monptitdepanneur.fr/carnet/desambuer-radiateur"}
    },
    {
      "@type":"FAQPage",
      "@id":"https://www.monptitdepanneur.fr/carnet/desambuer-radiateur#faq",
      "mainEntity":[
        {"@type":"Question","name":"Un simple rinçage suffit-il ?","acceptedAnswer":{"@type":"Answer","text":"Non. Un nettoyant aide à décoller les oxydes, puis un rinçage en charge chasse les dépôts. On protège ensuite avec filtre magnétique et inhibiteur."}},
        {"@type":"Question","name":"Le désembouage abîme-t-il les radiateurs ?","acceptedAnswer":{"@type":"Answer","text":"La méthode pro est douce pour les métaux. On évite les chocs hydrauliques et on respecte les joints. Les planchers chauffants sont traités boucle par boucle."}},
        {"@type":"Question","name":"Quand faut-il désembouer ?","acceptedAnswer":{"@type":"Answer","text":"Avant l''hiver, après un changement d''appareil (chaudière/PAC) ou dès l''apparition de symptômes (bas froid, glouglous, pompe bruyante). En préventif : tous 5–7 ans."}},
        {"@type":"Question","name":"Quel est le coût à Lille ?","acceptedAnswer":{"@type":"Answer","text":"Selon taille/état du réseau : 250–950 € tout compris. Le filtre magnétique (120–220 €) et l''inhibiteur (30–60 €) prolongent l''efficacité."}}
      ]
    }
  ]
}
</script>',
      updated_at = now()
  WHERE slug = 'desambuer-radiateur';
END $$;