# MANUAL.md

Notes d'utilisation pour les mods et l'installation UZDoom de ce dépôt.

## Construire le pk3 (`brutalvoxeldoom2.0.1`)

Sous Ubuntu, lancer :
```
brutalvoxeldoom2.0.1/build_pk3.sh
```
Ce script zippe le contenu de `brutalvoxeldoom2.0.1/` (avec `7z`, ou `zip` si `7z` est
absent) et dépose le résultat directement dans le répertoire de l'exécutable UZDoom
(`/home/util01/JEUX/DOOM/MOTEUR/UZDoom-5.0.0/build/`), nommé `BrutalDoomVoxel_<JJMM>_v3.pk3`
d'après la date du jour (ex. `BrutalDoomVoxel_2609_v3.pk3` pour le 26 septembre) — le nom
change donc à chaque build. La commande pour lancer le jeu avec ce pk3 est affichée à la
fin du script.

(`brutalvoxeldoom2.0.1/build_pk3.bat` reste l'équivalent Windows — nécessite 7-Zip, dépose
le pk3 sur le Bureau — mais n'est pas utilisé sur cette installation.)

## Supprimer la configuration d'UZDoom

Le fichier de configuration se trouve à `~/.config/uzdoom/uzdoom.ini`. C'est là que sont
enregistrés les CVars, les touches et les préférences.

```
rm ~/.config/uzdoom/uzdoom.ini
```

UZDoom en recréera un avec les valeurs par défaut au prochain lancement.

## Configurer la lampe torche (`brutalvoxeldoom2.0.1`)

**En jeu :** Options → Menu → « Flashlight » (en bas du menu principal des options).

**Dans ce sous-menu :**
- **Flashlight type (self)** : Off / Simple / Wide — désactive la lampe, faisceau simple, ou
  faisceau large (3 rayons).
- **Beam range** : curseur 120 à 960 — longueur visible du faisceau.
- **Beam intensity** : curseur -4 à +4 — taille/luminosité des points lumineux.
- **Beam color** : Blanc / Chaud / Rouge.
- **Alerts nearby monsters while on** : coupe l'alerte des monstres si désactivé.
- **Show light source glow** : le petit halo devant le joueur.
- **Limited battery** : active l'autonomie limitée (désactivée par défaut).
- **Show other players' flashlights** / **Flashlight type (other players)** /
  **Max. distance (other players)** : réglages pour voir les lampes des autres joueurs
  (multijoueur).
- **Rebind flashlight key...** : renvoie directement au menu « Personnaliser les contrôles »
  pour changer la touche.

**Touche par défaut :** `F` pour allumer/éteindre.

**Par la console** (`~`), chaque option a un CVar équivalent, si vous préférez taper
directement, par exemple :
```
cl_bd_flashlighttype 2
cl_bd_flashlightcolor 1
cl_bd_flashlightbattery 1
```

## Configurer sprint / mantling / boss health / scanner / sentinelle / chien / Daisy (`brutalvoxeldoom2.0.1`)

**En jeu :** Options → Menu → « Sprint, Mantling, Boss Health » (sous-menu séparé de
« Flashlight »).

**Dans ce sous-menu :**
- **Sprint (hold +speed while moving)** : active/désactive le sprint. Touche `+speed` (Maj
  par défaut) : maintenir en se déplaçant donne +70% de vitesse, limité par une jauge
  (~6s d'effort, ~4s de récupération).
- **Infinite sprint stamina** : retire la limite de jauge.
- **Auto climb onto ledges** : active/désactive le mantling (grimper automatiquement sur un
  rebord à hauteur de poitrine/tête en sautant vers lui).
- **Show boss health bar** : affiche le nom et les PV de tout monstre marqué « Boss »
  (Cyberdemon, Spider Mastermind…) engagé au combat à proximité.
- **Show target name/HP under crosshair** : affiche le nom et les PV de ce que vous visez
  (scanner), avec code couleur selon le pourcentage de vie et indicateur « Friendly ».
- **Max deployed sentry bots** : curseur 0 à 4 — combien de sentinelles peuvent être actives
  en même temps (0 désactive la capacité).
- **Max deployed companion dogs** : curseur 0 à 4 — combien de chiens peuvent être actifs en
  même temps (0 désactive la capacité).
- **Max deployed Daisies** : curseur 0 à 4 — combien de Daisy peuvent être actives en même
  temps (0 désactive la capacité).

**Touches par défaut :**
- `B` : déployer une sentinelle (apparaît devant vous, vous suit et attaque les ennemis).
- `N` : déployer un chien (même principe, attaque au corps-à-corps).
- `M` : déployer Daisy (identique au chien).

Délai de 10s entre deux déploiements, par joueur et par type (sentinelle/chien/Daisy
séparément).

**Par la console**, CVars équivalents :
```
bd_enablesprint 1
bd_infinitesprint 0
bd_mantling 1
bd_bosshealthbar 1
bd_disablescanner 0
bd_sentrymax 2
bd_dogmax 2
bd_daisymax 2
```
