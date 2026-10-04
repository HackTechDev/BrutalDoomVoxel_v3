# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Two **unpacked GZDoom mod directories** (each is the contents of a `.pk3`) for the game **Doom**, run through the GZDoom engine on top of a Doom IWAD. They are **two versions of Brutal Doom, not add-ons of each other**:

- `brutal22test6/` — the **latest** Brutal Doom (Sergeant_Mark_IV's v22 dev/test build). Gameplay mod: weapons, monsters, gore, ACS-driven systems, vehicles, menus. No voxel support of its own beyond the `bd_voxeldec` CVAR.
- `brutalvoxeldoom2.0.1/` — an **older, standalone Brutal Doom-derived version with voxel support** ("BRUTAL VOXEL DOOM" in `gameinfo.txt`; `credits.txt` lists Brutal Doom among its sources). It is built on Cheello's Voxel Doom (`.kvx` voxels, ZScript spin / face-camera handlers) plus the bundled NashGore NEXT blood/gibs system and an "enhancedAI" ZScript module.

Because they are different generations of the same mod, they define overlapping actors and are normally run **one at a time**, not stacked. Run by pointing GZDoom at a directory or a zipped pk3, e.g. `gzdoom -iwad doom2.wad -file brutal22test6` (or `-file brutalvoxeldoom2.0.1`). GZDoom needs ≥ 4.10 (4.11.3 for NashGore). These launch lines are untested suggestions. The repo is a git repo with a single initial commit; there is no test suite and no lint config. Content is DECORATE / ZScript / ACS / MODELDEF / VOXELDEF etc.

## Build / compile

- **Voxel pack pk3**: this repo runs on Ubuntu, so use `brutalvoxeldoom2.0.1/build_pk3.sh` — zips `brutalvoxeldoom2.0.1/` with `7z` (falls back to `zip`) into `BrutalDoomVoxel_<DDMM>_v3.pk3` (build date, e.g. `BrutalDoomVoxel_2609_v3.pk3` for Sept 26 — the name changes every build) and drops it straight into the UZDoom build directory, `/home/util01/JEUX/DOOM/MOTEUR/UZDoom-5.0.0/build/`, printing the launch command at the end. `brutalvoxeldoom2.0.1/build_pk3.bat` is the original Windows equivalent (needs 7-Zip, copies to the Desktop instead) but isn't used on this machine.
- **Brutal Doom ACS** is compiled, and the compiled output is committed alongside the source:
  - Sources: `brutal22test6/src/*.acs`. Main entry is `src/BD_Main.acs` (`#library "BD_Main"`), which `#include`s all the other `.acs` files "Decorate style" — add new ACS files by including them there. It uses **BCS** (`zcommon.bcs`, `libbcs.bcs`, `bcsfmt.acs`, `BCSFunc.acs`), so it needs the BCC/bcc-compatible compiler toolchain, not stock acc.
  - Output: `brutal22test6/acs/BD_Main.o` (plus `BD_Hash.o`, `zancmpat.o`). Which libraries load is listed in `LOADACS.txt` (`BD_Main`, `BD_Hash`, and a long commented list of legacy modules — `acs/acs_archive/` and `src/src_archive/` hold old/retired versions, not live code).
  - `src/gdcc/BD_MapHash.c` is C compiled with `gdcc` into `acs/BD_Hash.o`: `cd brutal22test6/src/gdcc && ./build.sh`.
  - **Editing a `.acs` in `src/` has no effect until it is recompiled to the `.o` in `acs/`.**
- The voxel pack's ACS (`brutalvoxeldoom2.0.1/acs/*_src.acs` → `.o`; loaded via `loadacs.txt`: `PL_PNC`, `PL_PAIN`, `MD_OPTN`, `MD_RELD`) is likewise precompiled next to its source.

## Testing

Manual, in-engine only. Launch GZDoom with one of the mods and a map (`-warp 01`, or `+map MAP01`), and check the console for DECORATE/ZScript/ACS parse errors. ZScript errors surface at startup; DECORATE errors name the file/line. Bundled test maps: `brutal22test6/maps/*.wad` (`TEST.wad`, `BIKERACE.wad`, …).

## Architecture

### Brutal Doom (`brutal22test6/`)

Entry lumps at the root, each an index that pulls in the rest:
- `DECORATE.txt` → `#include`s `actors/**/*.dec` (Gore, MISC, Weapons, Enemies, Vehicles, PlayerClasses, MapEnhancementSystem, Decorations, MeatShields, …). Weapon base class `ModWeapon` (bob style, punch/`ActualPunch` states) lives at the top of the weapon definitions, so changing it affects every weapon.
- `zscript.zc` (`version "3.2.3"`) → `zscript/BD_WCS.zc`, `zscript/DamageHandler.zc`. Small ZScript layer; most logic is still DECORATE + ACS.
- `LOADACS.txt`, `MAPINFO.txt`, `gameinfo.txt`, `KEYCONF.txt`, `MENUDEF.TXT`, `CVARINFO.txt` (server/user cvars such as `bd_*`), `SBARINFO.BD`, `SNDINFO.*` (split per domain), `DECALDEF.*`, `TERRAIN.txt`, `ANIMDEFS.txt`, and several `modeldef.*.txt` (one per blood colour / vehicles / decorations / shockwave).
- Language files: `language.enu` (base), `.fr`, `.ita`, `.ptb`, `LANGUAGE.RUS`, `LANGUAGE.PT`.
- `BD*Maps.wad`, `BDHordeModeMaps.wad` — map packs (DM, Horde, PSX). `doomdefs.bm`, `doommonsters.bm`, `doomwalls.bm` are Doom-Builder-style lookup files.

Cross-file coupling to know about: gameplay options are **CVARs declared in `CVARINFO.txt`, read in ACS** (`BD_Main.acs` copies them into globals like `bd_voxeldec`, `bd_classicmonsters`, `bd_disablenewguns` each tick/map open), and ACS in turn drives DECORATE actors via `SetActorState`/`GiveInventory`. When adding a feature toggle you usually touch: `CVARINFO.txt` → `MENUDEF.TXT` → `language.enu` → the relevant `src/*.acs` (+ recompile) → the `.dec` actor. Per-IWAD map tweaks live in `src/*Enh.acs` (`Doom2Enh`, `TNTEnh`, `PlutEnh`, `SigilEnh`, …), dispatched by `WadChecker.acs` / `WadPatches.acs`.

### Brutal Voxel Doom (`brutalvoxeldoom2.0.1/`, older version)

- `zscript.zc` (`version "4.10"`) is the include list: NashGore (`zscript/NashGore/*`) first, then `zscript/CheelloVox/*`. `zscript.txt` is a separate include list for `zscript/enhancedAI/*` (its handler is commented out in `gameinfo.txt`, i.e. currently inactive).
- `CheelloVoxHandler` (an `EventHandler`) uses `WorldThingSpawned` to attach **plugin inventory items** (`CheelloSpinPlugin`, `CheelloRotateToCameraPlugin`, `CheelloRocketPlugin`) to matching classes — this is how spin/face-camera behaviour is applied without redefining actors. Monster/weapon/statics files (`CheelloMonstersDoom1/2`, `CheelloSmoothMonstersDoom1/2`, `CheelloVoxStatics`, `CheelloVoxSmoothStatics`, `CheelloVoxWeaponsHandler`) map vanilla or Smooth-Doom-style actors to voxel-backed replacements; `CheelloWeapons*.zc` is commented out of the include list.
- Voxel data: `voxels/*.kvx` bound to sprite names in `voxeldef.txt` / `VOXELDEF.txt` (scale, `DroppedSpin`, `PlacedSpin`). Note both spellings exist — case matters on Linux, so check both when editing.
- Vanilla-actor replacements live in `actors/{monsters,player}.txt`, `actors/items/`, `actors/weapons/`, `actors/HeadShotBoxes`; `doomdefs.txt` / `filter/doom.id` scope content to the Doom IWADs. Both packs use `DECORATE` includes with different syntax (quoted paths vs. unquoted).
- NashGore blood classes can be overridden for other mods via a `BLUDTYPE` lump (`bludtype.txt`, one blood actor class per line) — see `README.md`.

## Notes

- `brutal22test6/` ships a `DDZLICENSE`; voxel/NashGore code is MIT (per file headers, © Nash Muhandes / Cheello). Keep those headers on ZScript files you copy from.
- `brutal22test6/` reads a `bd_voxeldec` CVAR and sends actors to their `Disappear` state when it is 0 (see `src/Options.acs`). The CVAR name suggests it toggles voxel decorations, but I only checked that one call site.
