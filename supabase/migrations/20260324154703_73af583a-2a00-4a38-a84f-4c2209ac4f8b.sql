UPDATE blog_posts 
SET content = REPLACE(
  content,
  E'## Budget & délais (repères réalistes)\n\nLes fourchettes varient selon matériaux, complexité, état de la plomberie et des supports.\n\n• **Remplacement douche par douche** (receveur + paroi + robinetterie) : 1 900 – 4 500 € posé.\n\n• **Douche à l''italienne** (étanchéité + carrelage) : 3 500 – 7 500 €.\n\n• **Remplacement baignoire standard** : 1 600 – 3 800 €.\n\n• **Baignoire îlot + robinetterie** : 2 500 – 6 500 € (hors sols/murs).\n\n• **Rénovation partielle** (zone douche/baignoire + faïences) : 3 000 – 8 000 €.\n\n• **Rénovation complète** (5–7 m² : sols, murs, meubles, éclairage, VMC) : 7 500 – 15 000 €.\n\n**Délais de chantier** : de 1 à 5 jours selon l''ampleur (hors délai d''appro).\n\n',
  ''
)
WHERE slug = 'renover-salle-bains-douche-baignoire'