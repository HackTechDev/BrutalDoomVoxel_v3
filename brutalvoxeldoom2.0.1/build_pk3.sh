#!/usr/bin/env bash
# Linux equivalent of build_pk3.bat: zips this directory's content into a .pk3
# and drops it directly next to the UZDoom executable instead of the Desktop.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="/home/util01/JEUX/DOOM/MOTEUR/UZDoom-5.0.0/build"
BUILD_DATE="$(date +%d%m)"
PK3_NAME="BrutalDoomVoxel_${BUILD_DATE}_v3.pk3"
PK3_PATH="${SRC_DIR}/${PK3_NAME}"
DEST_PATH="${DEST_DIR}/${PK3_NAME}"

if [[ ! -d "$DEST_DIR" ]]; then
	echo "Destination directory not found: $DEST_DIR" >&2
	exit 1
fi

cd "$SRC_DIR"
rm -f "$PK3_PATH"

if command -v 7z >/dev/null 2>&1; then
	7z a -r -x'!.git/' -ssw -tzip -mx9 "$PK3_PATH" '*' >/dev/null
elif command -v zip >/dev/null 2>&1; then
	zip -r -x '.git/*' "$PK3_PATH" . >/dev/null
else
	echo "Neither 7z nor zip found in PATH." >&2
	exit 1
fi

mv -f "$PK3_PATH" "$DEST_PATH"

echo "Built: $DEST_PATH"
echo
echo "Pour lancer Doom avec ce pk3 :"
echo "cd \"$DEST_DIR\" && ./uzdoom -iwad doom2.wad -file \"$PK3_NAME\" +map MAP01"
