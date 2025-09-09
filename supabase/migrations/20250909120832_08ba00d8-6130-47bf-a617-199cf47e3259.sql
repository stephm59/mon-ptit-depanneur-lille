-- Update climatisation FAQs for Lille with enriched content
-- First delete existing FAQs for climatisation in Lille
DELETE FROM service_city_faqs 
WHERE service_id = (SELECT id FROM services WHERE slug = 'climatisation') 
  AND city_id = (SELECT id FROM cities WHERE slug = 'lille');

-- Insert the new enriched FAQs
INSERT INTO service_city_faqs (service_id, city_id, position, question, answer, published)
VALUES
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    1,
    'Clim mono-split ou multi-split à Lille : que choisir ?',
    'Un mono-split convient pour climatiser une seule pièce (salon ou chambre). Pour un confort global à Lille, le multi-split est recommandé : il permet de traiter plusieurs pièces (ex. salon + 2 chambres à Vauban ou Wazemmes) avec un seul groupe extérieur. Nous dimensionnons toujours selon l''exposition (sud ou nord), l''isolation et vos habitudes de vie.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    2,
    'Peut-on installer une clim en copropriété à Lille ?',
    'Oui, à condition de respecter les règles. Nous constituons un dossier syndic complet : fiche acoustique (<45 dB(A) à 1 m), plan d''implantation (cours intérieures, façades non visibles), gestion des condensats. Nous accompagnons la présentation en AG pour sécuriser l''autorisation.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    3,
    'Où placer l''unité extérieure en milieu urbain dense ?',
    'À Lille, nous privilégions les cours intérieures, toitures-terrasses ou façades arrière. Nous installons des plots antivibratiles, orientons l''unité pour limiter l''impact sonore et respectons la distance réglementaire (3 m minimum si voisinage proche). Cela garantit conformité et tranquillité.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    4,
    'La climatisation peut-elle aussi chauffer l''hiver ?',
    'Oui, avec une clim réversible (pompe à chaleur air/air). À Lille, elle couvre largement les besoins en mi-saison et réduit de 30 % les relances de chauffage central. En hiver rigoureux, on conserve le chauffage principal pour assurer le confort.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    5,
    'L''entretien annuel est-il nécessaire ?',
    'Indispensable. Nous réalisons la désinfection des échangeurs (hygiène d''air), le nettoyage des filtres, la vérification du fluide frigorigène (R32), des condensats et du niveau sonore. Ce contrôle annuel optimise la consommation et prolonge la durée de vie de l''appareil.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    6,
    'Quel niveau de bruit prévoir avec une clim à Lille ?',
    'En intérieur, les unités low-noise sélectionnées tournent à 19–25 dB(A), soit l''équivalent d''un souffle léger. En extérieur, nous visons <50 dB(A) à 1 m, avec plots antivibratiles et orientation réfléchie. Nous fournissons une attestation acoustique jointe au dossier copro si besoin.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    7,
    'Quels délais d''installation pour une climatisation à Lille ?',
    'En moyenne, 1 jour pour un mono-split et 2 jours pour un multi-split 2–3 unités. Pour les logements avec accès difficile (centre, Fives), nous prévoyons une demi-journée supplémentaire pour la logistique. Les urgences avant canicule sont traitées en priorité sous 72 h.',
    true
  ),
  (
    (SELECT id FROM services WHERE slug = 'climatisation'),
    (SELECT id FROM cities WHERE slug = 'lille'),
    8,
    'Faut-il une autorisation particulière pour installer une clim à Lille ?',
    'Oui. En copropriété, l''accord de l''AG est obligatoire. En maison individuelle, il faut parfois vérifier le PLU de Lille si l''unité extérieure est visible depuis la rue. Nous vous guidons dans ces démarches pour éviter tout refus administratif.',
    true
  );