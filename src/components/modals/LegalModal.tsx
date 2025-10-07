import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { ScrollArea } from "@/components/ui/scroll-area";

interface LegalModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export const LegalModal = ({ isOpen, onClose }: LegalModalProps) => {
  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="max-w-4xl max-h-[80vh] p-0">
        <DialogHeader className="p-6 pb-4">
          <DialogTitle className="text-2xl font-bold">
            Mentions légales & Politique de confidentialité
          </DialogTitle>
        </DialogHeader>
        
        <ScrollArea className="max-h-[calc(80vh-100px)] px-6 pb-6">
          <div className="space-y-8">
            <section>
              <h2 className="text-xl font-semibold mb-4">Qui sommes-nous ?</h2>
              <p className="text-muted-foreground mb-4">
                L'adresse de notre site Web est : https://www.monptitdepanneur.fr.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">EDITEUR DU SITE</h2>
              <div className="space-y-2">
                <p><strong>Mon P'tit Dépanneur</strong></p>
                <p>21 rue Edouard Delesalle</p>
                <p>59 000 Lille</p>
                <p>contact@monptitdepanneur.fr</p>
                <p>Tel. 03 28 53 48 68</p>
                <p className="mt-4"><strong>Directeur de publication :</strong> David Vanmarcke</p>
                <p><strong>SIRET :</strong> 82804314100013</p>
                <p><strong>CODE APE/NAF :</strong> 4322A</p>
                <p><strong>TVA :</strong> FR78828043141</p>
              </div>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Utilisation des données personnelles collectées</h2>
              
              <h3 className="text-lg font-medium mb-2">Commentaires</h3>
              <p className="text-muted-foreground mb-4">
                Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, 
                mais aussi votre adresse IP et l'agent utilisateur de votre navigateur sont collectés pour nous aider à la 
                détection des commentaires indésirables.
              </p>
              <p className="text-muted-foreground mb-4">
                Une chaîne anonymisée créée à partir de votre adresse de messagerie (également appelée hash) peut être envoyée 
                au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar 
                sont disponibles ici : https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de 
                profil sera visible publiquement à coté de votre commentaire.
              </p>

              <h3 className="text-lg font-medium mb-2">Médias</h3>
              <p className="text-muted-foreground mb-4">
                Si vous êtes un utilisateur ou une utilisatrice enregistré·e et que vous téléversez des images sur le site web, 
                nous vous conseillons d'éviter de téléverser des images contenant des données EXIF de coordonnées GPS. 
                Les visiteurs de votre site web peuvent télécharger et extraire des données de localisation depuis ces images.
              </p>

              <h3 className="text-lg font-medium mb-2">Formulaires de contact</h3>
              <p className="text-muted-foreground mb-4">
                Les données collectées via nos formulaires de contact sont utilisées uniquement pour répondre à vos demandes 
                et ne sont pas transmises à des tiers.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Cookies</h2>
              <p className="text-muted-foreground mb-4">
                Si vous déposez un commentaire sur notre site, il vous sera proposé d'enregistrer votre nom, adresse de 
                messagerie et site web dans des cookies. C'est uniquement pour votre confort afin de ne pas avoir à saisir 
                ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d'un an.
              </p>
              <p className="text-muted-foreground mb-4">
                Si vous avez un compte et que vous vous connectez sur ce site, un cookie temporaire sera créé afin de 
                déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera 
                supprimé automatiquement à la fermeture de votre navigateur.
              </p>
              <p className="text-muted-foreground mb-4">
                Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos 
                informations de connexion et vos préférences d'écran. La durée de vie d'un cookie de connexion est de 
                deux jours, celle d'un cookie d'option d'écran est d'un an. Si vous cochez « Se souvenir de moi », 
                votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, 
                le cookie de connexion sera effacé.
              </p>
              <p className="text-muted-foreground mb-4">
                En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. 
                Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l'ID de la publication que vous venez 
                de modifier. Il expire au bout d'un jour.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Contenu embarqué depuis d'autres sites</h2>
              <p className="text-muted-foreground mb-4">
                Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). 
                Le contenu intégré depuis d'autres sites se comporte de la même manière que si le visiteur se rendait sur 
                cet autre site.
              </p>
              <p className="text-muted-foreground mb-4">
                Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de 
                suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d'un compte connecté 
                sur leur site web.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Statistiques et mesures d'audience</h2>
              <p className="text-muted-foreground mb-4">
                Nous utilisons des outils d'analyse pour comprendre l'utilisation de notre site et améliorer nos services.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Durées de stockage de vos données</h2>
              <p className="text-muted-foreground mb-4">
                Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet 
                de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file 
                de modération.
              </p>
              <p className="text-muted-foreground mb-4">
                Pour les utilisateurs et utilisatrices qui s'enregistrent sur notre site (si cela est possible), nous 
                stockons également les données personnelles indiquées dans leur profil. Tous les utilisateurs et 
                utilisatrices peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment 
                (à l'exception de leur nom d'utilisateur·ice). Les gestionnaires du site peuvent aussi voir et modifier 
                ces informations.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Les droits que vous avez sur vos données</h2>
              <p className="text-muted-foreground mb-4">
                Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir 
                un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que 
                vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. 
                Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.
              </p>
            </section>

            <section>
              <h2 className="text-xl font-semibold mb-4">Transmission de vos données personnelles</h2>
              <p className="text-muted-foreground mb-4">
                Les commentaires des visiteurs peuvent être vérifiés à l'aide d'un service automatisé de détection des 
                commentaires indésirables.
              </p>
            </section>

            <div className="mt-8 pt-8 border-t border-border">
              <p className="text-sm text-muted-foreground">
                Dernière mise à jour : {new Date().toLocaleDateString('fr-FR')}
              </p>
            </div>
          </div>
        </ScrollArea>
      </DialogContent>
    </Dialog>
  );
};