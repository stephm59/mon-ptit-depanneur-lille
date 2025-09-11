-- Update the water heater blog post content with bullet points for better readability
UPDATE blog_posts 
SET content = 'Vous vous demandez comment l''eau circule dans un chauffe-eau électrique (aussi appelé cumulus) ? Bonne question ! Pour comprendre, il faut d''abord connaître la composition et le fonctionnement de cet appareil indispensable à la production d''eau chaude sanitaire.

👉 Mon p''tit Dépanneur vous explique simplement l''itinéraire de l''eau dans un chauffe-eau.

## Qu''est-ce qu''un chauffe-eau électrique ?

Le chauffe-eau est un réservoir qui chauffe et stocke de l''eau chaude sanitaire pour les besoins du foyer :
• Douche et bain
• Vaisselle  
• Lessive
• Autres usages domestiques

Il existe plusieurs types de chauffe-eaux, mais le plus courant reste le chauffe-eau électrique à accumulation.

## De quoi est-il composé ?

Un chauffe-eau électrique comprend plusieurs éléments essentiels :

• **La cuve émaillée** : réservoir de stockage de l''eau
• **La résistance** : réchauffe l''eau (peut être blindée ou stéatite)
• **Le thermostat (aquastat)** : régule la température
• **L''anode** : protège la cuve de la corrosion
• **Le groupe de sécurité** : évite la surpression en évacuant un peu d''eau
• **Le contacteur jour/nuit** : optimise la consommation d''électricité
• **Le disjoncteur** : protège l''appareil

## Le principe de stratification

Le chauffe-eau fonctionne grâce à la stratification :

• L''eau froide entre par le bas de la cuve
• La résistance la chauffe progressivement
• L''eau chaude, plus légère, monte naturellement vers le haut
• Les couches d''eau se superposent selon leur température

👉 **Résultat** : l''eau très chaude reste en haut, l''eau froide en bas.

## L''itinéraire de l''eau dans un chauffe-eau

Voici le parcours complet de l''eau dans votre chauffe-eau :

### 1. Arrivée de l''eau froide
• Elle pénètre par l''entrée située en bas du réservoir
• Elle remplace l''eau chaude utilisée

### 2. Chauffage
• La résistance chauffe progressivement l''eau
• La température monte selon le réglage du thermostat

### 3. Stratification
• L''eau chaude remonte en haut de la cuve
• L''eau froide reste en bas
• Formation de couches distinctes

### 4. Puisage
• La canne de puisage prélève l''eau chaude en haut du ballon
• L''eau la plus chaude est disponible immédiatement

### 5. Renouvellement
• Chaque litre d''eau chaude utilisé est remplacé par un litre d''eau froide
• Le cycle de chauffage recommence automatiquement

👉 **C''est un cycle continu** : le ballon se remplit, chauffe, stocke et délivre de l''eau chaude selon vos besoins.

## Les avantages du système

• **Réserve d''eau chaude** : disponibilité immédiate
• **Température constante** : eau chaude à la demande
• **Économies d''énergie** : chauffage en heures creuses possible
• **Fiabilité** : système éprouvé et durable

## Conclusion

L''itinéraire de l''eau dans un chauffe-eau n''est pas si compliqué : 
• L''eau froide entre en bas
• Elle chauffe grâce à la résistance
• Elle monte en haut du réservoir
• Elle est disponible pour utilisation

👉 Besoin d''un entretien, d''un remplacement ou d''une réparation de chauffe-eau ? Contactez Mon p''tit Dépanneur au 03 28 53 48 68.'
WHERE slug = 'chauffe-eau';