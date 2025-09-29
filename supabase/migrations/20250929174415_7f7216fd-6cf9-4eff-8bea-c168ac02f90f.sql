-- Insert new blog post about green gas (biomethane)
INSERT INTO blog_posts (
  service_id,
  title,
  slug,
  excerpt,
  content,
  cover_image_url,
  meta_title,
  meta_description,
  published,
  published_at
)
SELECT 
  s.id,
  'Gaz vert (biométhane) : c''est quoi ? (et ce qu''on ne vous dit pas)',
  'gaz-vert-biomethane-lille',
  'Le gaz vert expliqué sans langue de bois : définition, injection réseau, Garanties d''Origine, volumes 2030, coûts/CSPE, fuites de méthane et usages pertinents à Lille.',
  '<script type="application/ld+json">
{
  "@context":"https://schema.org",
  "@graph":[
    {
      "@type":"WebPage",
      "@id":"https://www.monptitdepanneur.fr/carnet/gaz-vert-biomethane-lille",
      "url":"https://www.monptitdepanneur.fr/carnet/gaz-vert-biomethane-lille",
      "name":"Gaz vert (biométhane) : c''est quoi, vraiment ?",
      "description":"Le gaz vert expliqué sans langue de bois : définition, injection réseau, Garanties d''Origine, volumes 2030, coûts/CSPE, fuites de méthane et usages pertinents à Lille.",
      "inLanguage":"fr-FR",
      "isPartOf":{"@type":"WebSite","name":"Mon p''tit Dépanneur","url":"https://www.monptitdepanneur.fr"}
    },
    {
      "@type":"BreadcrumbList",
      "@id":"https://www.monptitdepanneur.fr/carnet/gaz-vert-biomethane-lille#bread",
      "itemListElement":[
        {"@type":"ListItem","position":1,"name":"Accueil","item":"https://www.monptitdepanneur.fr/"},
        {"@type":"ListItem","position":2,"name":"Carnet","item":"https://www.monptitdepanneur.fr/carnet/"},
        {"@type":"ListItem","position":3,"name":"Gaz vert (biométhane) : c''est quoi ?"}
      ]
    },
    {
      "@type":"Article",
      "@id":"https://www.monptitdepanneur.fr/carnet/gaz-vert-biomethane-lille#article",
      "headline":"Gaz vert (biométhane) : c''est quoi, vraiment ? (ce qu''on ne vous dit pas)",
      "description":"Dossier complet et nuancé : forces, limites, chiffres 2030, Garanties d''Origine, coûts et fuites de méthane, plus des conseils pratiques pour Lille & MEL.",
      "articleSection":["Énergie","Chauffage","Gaz renouvelables"],
      "inLanguage":"fr-FR",
      "author":{"@type":"Organization","name":"Mon p''tit Dépanneur"},
      "publisher":{"@type":"Organization","name":"Mon p''tit Dépanneur","logo":{"@type":"ImageObject","url":"https://www.monptitdepanneur.fr/static/logo.png"}},
      "datePublished":"2025-09-29",
      "dateModified":"2025-09-29",
      "mainEntityOfPage":{"@id":"https://www.monptitdepanneur.fr/carnet/gaz-vert-biomethane-lille"}
    },
    {
      "@type":"FAQPage",
      "@id":"https://www.monptitdepanneur.fr/carnet/gaz-vert-biomethane-lille#faq",
      "mainEntity":[
        {"@type":"Question","name":"Le biométhane chauffe-t-il comme le gaz naturel ?","acceptedAnswer":{"@type":"Answer","text":"Oui. Une fois épuré et injecté, c''est du méthane avec les mêmes propriétés d''usage (chauffage, ECS, cuisson)."}},
        {"@type":"Question","name":"Pourquoi payer plus pour du gaz vert ?","acceptedAnswer":{"@type":"Answer","text":"Vous achetez la preuve de production renouvelable (Garanties d''Origine) et vous financez une filière locale (collecte, épuration, raccordement)."}},
        {"@type":"Question","name":"Les Garanties d''Origine sont-elles fiables ?","acceptedAnswer":{"@type":"Answer","text":"C''est un système de traçabilité encadré : il certifie qu''une quantité équivalente de biométhane a été produite et injectée pour votre consommation."}},
        {"@type":"Question","name":"Quid des fuites de méthane ?","acceptedAnswer":{"@type":"Answer","text":"Elles existent et doivent être suivies (upgrading, digestat, opérations). Avec bonnes pratiques et contrôle, le bilan reste favorable."}},
        {"@type":"Question","name":"Quelle part de gaz vert en 2030 ?","acceptedAnswer":{"@type":"Answer","text":"Les documents de programmation visent ~44 TWh de biométhane injecté (~15 % du gaz réseau)."}}
      ]
    }
  ]
}
</script>

<h1>Gaz vert (biométhane) : c''est quoi ? (et ce qu''on ne vous dit pas)</h1>

<p>On l''appelle « gaz vert », « biométhane », parfois « gaz renouvelable ». Sur l''affiche, c''est local, circulaire et bas-carbone. Dans la vraie vie, il y a des forces (déchets valorisés, production locale) et des limites (volumes, coûts, fuites de méthane, disponibilité des intrants). Voici le guide clair pour comprendre, décider et éviter les idées reçues.</p>

<h2>1) Le gaz vert en 2 phrases</h2>

<p>Le biométhane est un méthane (CH₄) 100 % renouvelable, obtenu par méthanisation de matières organiques (effluents d''élevage, biodéchets, boues, résidus agro…). Une fois épuré puis injecté dans le réseau, il a les mêmes propriétés que le gaz naturel : il sert à chauffer, produire l''ECS ou rouler en BioGNV.</p>

<p>En France, la filière a pris de l''ampleur : injection en hausse, objectifs publics à l''horizon 2030–2035, avec soutien (tarifs d''achat/contrats, primes CEE, etc.).</p>

<h2>2) Ce qui est (vraiment) bien</h2>

<p><strong>Valorisation locale des déchets</strong> : moins de brûlage/épandages bruts, du digestat mieux maîtrisé pour l''agronomie.</p>

<p><strong>Substitut direct au gaz fossile</strong> : pas besoin de changer appareils ou réseaux ; adapté au logement existant (chaudières, PAC hybrides, process).</p>

<p><strong>Traçabilité via Garanties d''Origine (GO)</strong> : même si la molécule physique se mélange dans le réseau, vous pouvez prouver une consommation « verte ».</p>

<h2>3) Ce qu''on dit moins (mais qu''il faut savoir)</h2>

<p><strong>Volumes limités à moyen terme</strong> : même avec l''accélération, le biométhane ne couvrira qu''une partie des besoins. Les trajectoires publiques parlent de ~15 % du gaz dans les réseaux en 2030 (projet PPE 2025-2035 : ~44 TWh injectés visés), pas 100 %.</p>

<p><strong>Coûts et soutien public</strong> : la filière s''est développée avec des contrats d''achat et dispositifs compensés dans les charges de service public (CRE). Ce n''est pas "gratuit", c''est mutualisé.</p>

<p><strong>Fuites de méthane</strong> : le méthane est un GES puissant. Les études récentes (UE/JRC, académiques) montrent que des fuites peuvent dégrader le bénéfice climat si elles ne sont pas traquées (upgrading, stockage, digestat, opérations). Les bons sites maîtrisent ; les moins bons ruinent la performance.</p>

<p><strong>Intrants et "concurrence d''usage"</strong> : le "tout déchet" existe, mais certains projets ont recours à des cultures intermédiaires ; la règle est d''éviter les cultures dédiées alimentaires. Le gisement réel est donc borné par les déchets disponibles et les contraintes agronomiques.</p>

<h2>4) Gaz vert & logement : à quoi ça sert concrètement ?</h2>

<p><strong>Chauffage/ECS sans tout changer</strong> : si vous souscrivez une offre avec GO biométhane, vous décarbonez contractuellement votre consommation (même chaudière). C''est simple pour un copro ou une maison 1930.</p>

<p><strong>PAC hybride gaz</strong> : la PAC couvre le "fond de chaleur", la chaudière gaz (alimentée au biométhane via GO) prend le relais par froid marqué → confort, émissions réduites (si fuites contrôlées).</p>

<p><strong>BioGNV pour flottes utilitaires</strong> : utile pour artisans/collectivités (stations locales).</p>

<h2>5) Idées reçues, décodage rapide</h2>

<p>« <strong>100 % vert dans mon tuyau</strong> » → Faux physiquement : le réseau est mélangé. Vrai comptable avec les GO.</p>

<p>« <strong>Zéro émission</strong> » → Non. Le CO₂ biogénique est recyclé, mais la chaîne émet (énergie, transport, fuites éventuelles). D''où l''importance des bonnes pratiques d''exploitation.</p>

<p>« <strong>On pourrait tout remplacer</strong> » → Non. Le gisement réaliste ne couvre qu''une fraction des usages ; d''où la notion d''usages prioritaires (process, pointe, bâtiments difficiles à électrifier).</p>

<h2>6) Combien y en aura demain (et à quel prix) ?</h2>

<p><strong>Cap 2030 proposé</strong> : ~44 TWh injectés (≈15 % du gaz réseau) selon les documents PPE/SFEC ; certains scénarios mentionnent 50 TWh biométhane total. Rythme réaliste mais exigeant (gisement, acceptabilité, financements).</p>

<p><strong>Économie</strong> : le tarif d''achat et les contrats sécurisent l''investissement, puis une part de la valeur des GO vient réduire la charge publique (mécanismes supervisés par la CRE). En clair : soutien encadré et ajusté au fil du temps.</p>

<p><strong>Tendance</strong> : la statistique publique 2025 confirme la montée du biogaz/biométhane dans le mix, mais on reste loin d''un remplacement intégral.</p>

<h2>7) Comment choisir une "offre gaz vert" sans se faire balader</h2>

<p><strong>Comprendre les GO</strong> : quelle quantité garantie (MWh), période et origine (département, type de gisement) ?</p>

<p><strong>Demander l''info fuites</strong> : le fournisseur suit-il un plan de détection/réduction des émissions fugitives chez ses producteurs ? (un bon signal).</p>

<p><strong>Privilégier l''usage utile</strong> : logement mal isolé, pointe hivernale, copro difficile à électrifier → pertinence forte ; logement très sobre → PAC 100 % élec peut être mieux.</p>

<p><strong>Vérifier le prix</strong> : une offre « 100 % gaz vert » peut coûter plus cher ; comparez le surcoût/MWh à votre impact réel (kWh/an).</p>

<h2>8) Spécial Lille & MEL : ce qui change pour vous</h2>

<p><strong>Approvisionnement</strong> : Hauts-de-France = territoire agri-industriel avec des sites d''injection en hausse ; le biométhane est déjà dans le réseau régional (mix).</p>

<p><strong>Bâtiments 1930 / copro</strong> : l''option GO biométhane + régulation bien réglée réduit l''empreinte sans gros travaux. Pour aller plus loin : isolation, PAC (élec) ou hybride.</p>

<p><strong>Artisans/flottes</strong> : stations BioGNV en croissance sur l''arc Nord (logistique urbaine).</p>

<h2>9) En résumé (pratique)</h2>

<p>Le gaz vert est un levier utile pour décarboner vite certaines situations sans changer d''équipement.</p>

<p>Son impact climat dépend fortement des bonnes pratiques (fuites).</p>

<p>Les volumes sont limités : on vise des usages pertinents et on combine avec efficacité/électrification.</p>

<h2>Intéressés par le gaz vert ? Contactez-nous</h2>

<p>Pour toute question sur le gaz vert, les PAC hybrides ou l''optimisation de votre installation, <strong>Mon p''tit Dépanneur intervient dans toute la métropole lilloise</strong>.</p>

<p>📞 <strong>03 28 53 48 68</strong> — Conseil personnalisé, devis gratuit.</p>',
  'https://pub-ee5d8554679a4a23a82caac56686992a.r2.dev/gaz-vert.webp',
  'Gaz vert (biométhane) : définition, limites & usages à Lille',
  'Gaz vert (biométhane) : c''est quoi en vrai ? Avantages, limites (volumes, coûts, fuites), Garanties d''Origine, usages malins (logement, PAC hybride) et perspectives 2030.',
  true,
  now()
FROM services s
WHERE s.slug = 'chauffage';

-- Insert FAQs for the green gas article
INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  bp.id,
  'Le biométhane chauffe-t-il comme le gaz naturel ?',
  'Oui. Une fois épuré et injecté, c''est du méthane avec les mêmes propriétés d''usage (chauffage, ECS, cuisson).',
  1
FROM blog_posts bp
WHERE bp.slug = 'gaz-vert-biomethane-lille';

INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  bp.id,
  'Pourquoi payer plus pour du gaz vert ?',
  'Vous achetez la preuve de production renouvelable (Garanties d''Origine) et vous financez une filière locale (collecte, épuration, raccordement).',
  2
FROM blog_posts bp
WHERE bp.slug = 'gaz-vert-biomethane-lille';

INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  bp.id,
  'Les Garanties d''Origine sont-elles fiables ?',
  'C''est un système de traçabilité encadré : il certifie qu''une quantité équivalente de biométhane a été produite et injectée pour votre consommation.',
  3
FROM blog_posts bp
WHERE bp.slug = 'gaz-vert-biomethane-lille';

INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  bp.id,
  'Quid des fuites de méthane ?',
  'Elles existent et doivent être suivies (upgrading, digestat, opérations). Avec bonnes pratiques et contrôle, le bilan reste favorable.',
  4
FROM blog_posts bp
WHERE bp.slug = 'gaz-vert-biomethane-lille';

INSERT INTO blog_post_faqs (blog_post_id, question, answer, position)
SELECT 
  bp.id,
  'Quelle part de gaz vert en 2030 ?',
  'Les documents de programmation visent ~44 TWh de biométhane injecté (~15 % du gaz réseau).',
  5
FROM blog_posts bp
WHERE bp.slug = 'gaz-vert-biomethane-lille';