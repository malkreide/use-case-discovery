#!/bin/sh
# Gibt das Profil für /use-case-discovery aus. Reihenfolge:
#   1. Umgebungsvariable USE_CASE_DISCOVERY_PROFIL (Pfad, oder «keines»)
#   2. .claude/use-case-discovery/profil.md im aktuellen Projekt
#   3. ~/.claude/use-case-discovery/profil.md
# Die erste Zeile nennt immer die Herkunft («Profil: …»).

if [ "${USE_CASE_DISCOVERY_PROFIL:-}" = "keines" ]; then
  echo "Profil: keines (per Umgebungsvariable abgeschaltet)"
  exit 0
fi

for f in "${USE_CASE_DISCOVERY_PROFIL:-}" \
         ".claude/use-case-discovery/profil.md" \
         "$HOME/.claude/use-case-discovery/profil.md"; do
  if [ -n "$f" ] && [ -f "$f" ]; then
    echo "Profil: $f"
    echo
    cat "$f"
    exit 0
  fi
done

if [ -n "${USE_CASE_DISCOVERY_PROFIL:-}" ]; then
  echo "Profil: keines (Datei aus USE_CASE_DISCOVERY_PROFIL nicht gefunden: $USE_CASE_DISCOVERY_PROFIL)"
else
  echo "Profil: keines"
fi
