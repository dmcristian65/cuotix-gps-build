#!/usr/bin/env sh
set -eu
VERSION=8.11.1
BASE="${GRADLE_USER_HOME:-$HOME/.gradle}/cuotix-bootstrap"
DIST="$BASE/gradle-$VERSION"
ZIP="$BASE/gradle-$VERSION-bin.zip"
if [ ! -x "$DIST/bin/gradle" ]; then
  mkdir -p "$BASE"
  URL="https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then curl -fL "$URL" -o "$ZIP";
  elif command -v wget >/dev/null 2>&1; then wget -O "$ZIP" "$URL";
  else echo "Se necesita curl o wget para descargar Gradle." >&2; exit 1; fi
  rm -rf "$DIST"
  unzip -q "$ZIP" -d "$BASE"
fi
exec "$DIST/bin/gradle" "$@"
