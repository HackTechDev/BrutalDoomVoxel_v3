# TODO.md

Fonctionnalités qui peuvent encore être portées de `brutal22test6` vers
`brutalvoxeldoom2.0.1`, ou ajoutées aux systèmes déjà en place (voir FEATURES.md).
Rien ci-dessous n'est implémenté.

## À vérifier / affiner sur l'existant

- **Sprint et mantling** : le ressenti en jeu n'a pas pu être testé depuis cet
  environnement (pas de simulation d'appui clavier prolongé). Distances, hauteurs et
  vitesses à ajuster une fois essayés.
- **Jauge de batterie à l'écran** (lampe torche) : seul un message console signale
  l'épuisement ; pas d'indicateur visuel permanent.
- **Son distinct à l'épuisement de la batterie** (lampe torche) : actuellement aucun son
  particulier ne joue quand la batterie tombe à zéro.

## Autres systèmes de `brutal22test6`, portage similaire (fichiers autonomes)

- **Chasecam** (`CHASECAM.acs`) — caméra à la troisième personne.

## Écarté

- **Véhicules** (dossier `VEHICLES`, `VEHICLECONTROL.acs`) — décision : ne pas
  implémenter, trop gros. Rien qu'un seul véhicule (le vélo, le plus simple des 6)
  représente ~10 000 lignes de DECORATE/ACS et 50+ sprites/sons à porter ; le Mecha en
  dépend en plus du Tank et est encore plus gros. Voir la discussion en amont dans la
  conversation pour le détail par véhicule.

## Systèmes plus lourds (portage bien plus conséquent)

- **Exécutions / fatalities** (`ExecutionsWeap.dec`, sprites `Fatality`).
- **Otages humains** (`actors/MeatShields`) — utiliser un ennemi comme bouclier.
- **Map Enhancement System** (`Doom2Enh.acs`, `TNTEnh.acs`, `SigilEnh.acs`, …) — retouches
  spécifiques par WAD (textures, décors, ennemis).
- **Bots** (`BOTINFO`, `BOTS1`) — coéquipiers IA.
- **Arsenal étendu** — `brutal22test6` a beaucoup plus d'armes (Railgun, Unmaker, Sniper,
  Revolver, armes doubles…) que le pack voxel, plus proche de l'arsenal vanilla.
