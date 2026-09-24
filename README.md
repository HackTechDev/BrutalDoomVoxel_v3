# doombrutalvoxel

Deux mods Doom, pour le moteur GZDoom/UZDoom, dans ce dépôt — ce sont deux **versions
différentes de Brutal Doom**, pas des extensions l'une de l'autre :

- **`brutal22test6/`** — la dernière version de Brutal Doom (build de test v22 de
  Sergeant_Mark_IV).
- **`brutalvoxeldoom2.0.1/`** — une version plus ancienne de Brutal Doom, avec le support
  des voxels (Cheello's Voxel Doom + NashGore NEXT). C'est sur ce dossier que portent
  tous les ajouts de ce dépôt (voir plus bas).

Comme ce sont deux générations du même mod, elles se lancent **séparément**, pas
ensemble :
```
uzdoom -iwad doom2.wad -file brutal22test6
uzdoom -iwad doom2.wad -file BrutalDoomVoxel_<date>_v3.pk3
```

## Fonctionnalités ajoutées

`brutalvoxeldoom2.0.1` a reçu plusieurs fonctionnalités adaptées de `brutal22test6` :
lampe torche (couleur, batterie, alerte des monstres…), sprint, escalade automatique de
rebords, barre de vie des boss, scanner de cible, sentinelle et compagnons (chien,
Daisy) déployables.

Détail de chaque fonctionnalité, réglages et touches : voir **[FEATURES.md](FEATURES.md)**
et **[MANUAL.md](MANUAL.md)**.

## Construire le pk3

Voir **[MANUAL.md](MANUAL.md)** (section « Construire le pk3 »).

## Autres documents

- **[MANUAL.md](MANUAL.md)** — configuration en jeu, touches, CVars, build du pk3, remise
  à zéro de la config UZDoom.
- **[FEATURES.md](FEATURES.md)** — liste détaillée de ce qui a été ajouté, avec le statut
  des tests.
- **[TODO.md](TODO.md)** — ce qui pourrait encore être ajouté, et ce qui a été écarté
  (avec le pourquoi).
- **[CLAUDE.md](CLAUDE.md)** — repères techniques pour développer sur ce dépôt (structure
  des deux mods, compilation de l'ACS, conventions de fichiers).

## Licences

`brutal22test6/` contient `DDZLICENSE`. `brutalvoxeldoom2.0.1/` contient `LICENSE`
(NashGore/Cheello, MIT) ; voir les en-têtes de fichiers pour le détail par module.
