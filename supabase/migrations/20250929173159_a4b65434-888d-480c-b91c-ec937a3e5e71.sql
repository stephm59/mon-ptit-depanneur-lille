-- Move "Quand nous contacter ?" section above FAQs in desambuer-radiateur article
UPDATE blog_posts 
SET content = SUBSTRING(content FROM 1 FOR POSITION('<h2>Quand nous contacter ?</h2>' IN content) - 1) || 
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