# FEATURES.md

Fonctionnalités ajoutées à `brutalvoxeldoom2.0.1`, adaptées depuis `brutal22test6`
(Sergeant_Mark_IV's Brutal Doom v22). Aucune n'existait dans le pack voxel à l'origine ;
toutes sont réimplémentées en ZScript plutôt que copiées telles quelles, car l'ACS de
`brutal22test6` est compilé avec BCC (voir CLAUDE.md) et dépend de systèmes propres à
Brutal Doom absents de ce pack. Configuration détaillée dans MANUAL.md.

## Lampe torche

Touche par défaut `F`. Menu : Options → « Flashlight ».

- **Faisceau** : type simple ou large (3 rayons), portée et intensité réglables.
- **Couleur** : blanc, chaud ou rouge.
- **Alerte des monstres** : les monstres proches remarquent la lumière (désactivable).
- **Halo de source** : petit point lumineux devant le joueur (désactivable).
- **Batterie limitée** (désactivée par défaut) : s'épuise en ~90s d'utilisation continue,
  se recharge en ~45s éteinte, coupe automatiquement la lampe à 0.
- La lampe s'éteint à la mort du joueur et se réinitialise à sa réapparition.
- Réglages multijoueur : afficher ou non les lampes des autres joueurs, leur qualité et
  leur distance de rendu.

## Sprint

CVar `bd_enablesprint` (activé par défaut), `bd_infinitesprint` pour retirer la limite.

- Maintenir la touche « +speed » en se déplaçant donne +70% de vitesse.
- Limité par une jauge : ~6s d'effort avant épuisement, ~4s de récupération à l'arrêt.

## Mantling (escalade de rebords)

CVar `bd_mantling` (activé par défaut).

- En sautant vers un rebord à hauteur de poitrine/tête, le joueur y est automatiquement
  hissé (poussée de vitesse, pas de téléportation ni d'animation).
- Version simplifiée par rapport à l'original : un seul point de sondage devant le
  joueur (au lieu de 5), donc peut occasionnellement rater un rebord — sans jamais
  risquer de faire traverser un mur au joueur.

## Barre de vie des boss

CVar `bd_bosshealthbar` (activé par défaut).

- Affiche le nom et les PV (actuels / max) de tout monstre marqué « Boss » (Cyberdemon,
  Spider Mastermind, et tout ce qui en hérite) dès qu'il engage le combat et se trouve à
  moins de 2048 unités du joueur.

## Scanner (info sous le viseur)

CVar `bd_disablescanner` (scanner activé par défaut).

- Affiche le nom et les PV de ce que vous visez, avec code couleur selon le pourcentage
  de vie restant (tan/or/orange/rouge) et indicateur « -Friendly- » pour les alliés.

## Sentinelle déployable

Touche par défaut `B`. CVar `bd_sentrymax` (1 par défaut, réglable jusqu'à 4).

- Apparaît devant le joueur, le suit, attaque au corps-à-corps/tir tout ce qui n'est pas
  ami. Délai de 10s entre deux déploiements par joueur.
- Dans l'original c'est un décor de niveau qu'un créateur de map place et active ; ici
  c'est une capacité du joueur, activable n'importe où.
- Version simplifiée : pas de mode garde statique, pas de repli face aux gros monstres,
  pas de douilles éjectées ni de texte d'ordre flottant (cosmétiques ou dépendants
  d'autres systèmes absents du pack).

## Chien compagnon

Touche par défaut `N`. CVar `bd_dogmax` (1 par défaut, réglable jusqu'à 4).

- Même principe que la sentinelle : apparaît devant le joueur, le suit, mord au
  corps-à-corps tout ce qui n'est pas ami.
- Version simplifiée : mêmes coupes que la sentinelle, plus l'état « donner des
  munitions » qui était déjà du code mort dans l'original (son seul appel était en
  commentaire).

## Daisy (deuxième compagnon)

Touche par défaut `M`. CVar `bd_daisymax` (1 par défaut, réglable jusqu'à 4).

- Quasiment un décalque du chien (même auteur dans l'original, structure identique) :
  apparaît devant le joueur, le suit, mord au corps-à-corps tout ce qui n'est pas ami.
- Mêmes simplifications que le chien et la sentinelle.

## Statut des tests

Toutes ont été testées à la compilation et à l'exécution dans UZDoom 5.0.1 (aucune erreur
de script ni plantage), avec des monstres invoqués et engagés au combat pour la barre de
vie des boss, la sentinelle, le chien et Daisy. Le rendu visuel de la lampe torche a été
confirmé par l'utilisateur en jeu. Le ressenti du sprint, du mantling, du scanner à
l'écran, et le comportement en jeu de la sentinelle/du chien/de Daisy n'ont pas pu être
vérifiés depuis cet environnement, faute de pouvoir simuler un appui clavier prolongé ou
observer le rendu final.
