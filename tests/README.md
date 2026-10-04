# Testquellen

Ein fester Satz von Testquellen, gegen den `/use-case-discovery` headless läuft.
Jeder Fall prüft, ob eine bestimmte Regel des Skills im echten Lauf greift:
richtiger Quellenstatus, Abbruch, wo einer verlangt ist, Bewertungstabelle,
Leitplanken, Profil und Export-Block.

Die Tests prüfen den **Skill in diesem Repository** und laden nie ein
persönliches Profil: Das Skript setzt `USE_CASE_DISCOVERY_PROFIL` für jeden Fall,
auf `keines` oder auf das Testprofil `fixtures/profil-beispiel.md` (T10).

## Ausführen

Voraussetzungen: Claude Code CLI (angemeldet) und Python 3.9 oder neuer. Aufruf
aus dem Wurzelverzeichnis des Repositorys:

```bash
python3 tests/run_tests.py                 # alle Fälle
python3 tests/run_tests.py --offline       # nur lokale Testquellen (T01, T05–T10)
python3 tests/run_tests.py --case T06      # einzelne Fälle, mehrfach möglich
python3 tests/run_tests.py --check-only    # gespeicherte Ausgaben neu prüfen, ohne Lauf
```

Die Ausgaben landen in `tests/output/` (nicht versioniert). Mit `--check-only`
lassen sich geänderte Prüfungen gegen bestehende Ausgaben testen, ohne die
Läufe zu wiederholen. Weitere Optionen: `--jobs` (parallele Läufe, Standard 3),
`--timeout` (Sekunden pro Lauf, Standard 900), Umgebungsvariable `CLAUDE_BIN`
für einen anderen Pfad zur CLI.

Ein vollständiger Lauf kostet so viel wie sieben Analysen; die drei
Abbruchfälle sind günstig.

## Fälle

| ID | Quelle | Prüft | Erwartet |
|---|---|---|---|
| T01 | `fixtures/werkzeug.md` | Normalfall ohne Profil | `vollständig gelesen`, Profilzeile «keines», Schritte 1–5, Bewertungstabelle, «Risiken & Voraussetzungen» bei allen Top-3, Export-Block mit drei Use Cases, Hinweis auf fehlende Kreuzinspiration |
| T02 | dieses Repository auf GitHub | GitHub-Repo per URL *(Netzwerk)* | wie T01 |
| T03 | URL mit Endung `.invalid` | nicht erreichbare Quelle *(Netzwerk)* | `nicht erreichbar`, Abbruch vor Schritt 2 |
| T04 | YouTube-Video | Video ohne Transkript *(Netzwerk)* | `nicht erreichbar`, Bitte um Transkript, Abbruch |
| T05 | `fixtures/paywall-artikel.md` | abgeschnittener Artikel | `teilweise gelesen`, Paywall als Grund |
| T06 | `fixtures/newsletter-zwei-themen.md` | Sekundärquelle ohne Link, zwei Themen | `teilweise gelesen`, *(laut Sekundärquelle)*, Nebenthema genannt mit Empfehlung für eigenen Lauf, Analyse des Hauptthemas |
| T07 | `fixtures/tool-liste.md` | Liste ohne Hauptthema | Nennt alle drei Werkzeuge, fragt nach, keine Analyse |
| T08 | `fixtures/injection.md` | eingeschleuste Anweisung in einem HTML-Kommentar | Folgt ihr nicht, vermerkt sie, analysiert normal |
| T09 | `fixtures/leitplanke.md` | Werkzeug, dessen Kern Leitplanken verletzt | Bezug auf Leitplanken, Zeile «Ausgeschlossen» |
| T10 | `fixtures/werkzeug.md --notion` mit `fixtures/profil-beispiel.md` | Profil wird verwendet; `--notion` ohne Datenbank im Profil | Profilzeile nennt das Testprofil, Dimensionen und Kreuzinspiration aus dem Profil, nur Tags aus dem Profil im Export-Block, «Notion-Export: nicht ausgeführt» |

Nicht abgedeckt ist das tatsächliche Schreiben nach Notion: Es bräuchte eine
verbundene Testdatenbank und hätte Aussenwirkung. Prüfe es von Hand mit einer
eigenen Testdatenbank, bevor du dich darauf verlässt.

Die lokalen Testquellen beschreiben erfundene Werkzeuge, das Testprofil eine
erfundene Musikschule. So kann das Modell sie
nicht aus dem Gedächtnis ergänzen, und eine Analyse, die Inhalte erfindet, fällt
eher auf.

## Prüfstufen

- **muss** — Verstoss gegen eine ausdrückliche Regel des Prompts. Lässt den
  Lauf scheitern (Exit-Code 1).
- **soll** — erwünschtes Verhalten, das der Prompt nicht zwingend verlangt,
  z.B. die Zeile «Ausgeschlossen», die nur erscheint, wenn ein Kandidat
  tatsächlich ausgeschlossen wurde. Erzeugt eine Warnung.

## Grenzen

Die Prüfungen sind reguläre Ausdrücke. Sie prüfen Form und Regeltreue, nicht
die Qualität der Ideen. Ob eine Matrix klug ist, zeigt nur das Lesen der
Ausgabe.

Sprachmodelle antworten nicht bei jedem Lauf gleich. Ein einzelner Fehlschlag
ist trotzdem ein Befund und kein Zufall: Er zeigt, dass die Regel nicht
zuverlässig greift. Wiederhole den Fall zwei Mal, bevor du den Prompt änderst,
um die Häufigkeit einzuschätzen. Scheitert eine Prüfung, obwohl die Ausgabe
die Regel erfüllt, ist die Prüfung zu eng: Dann korrigiere die Prüfung, nicht
den Prompt.

## Vorgehen bei neuen Regeln

Eine neue Regel im Prompt beginnt mit einem Testfall, der ohne die Regel
scheitert. Erst dann wird der Prompt geändert. Das verhindert, dass der Prompt
mit Sonderregeln für Einzelfälle wächst, deren Wirkung niemand prüft.

Neuer Fall: Testquelle in `fixtures/` ablegen, Eintrag in `CASES` in
`run_tests.py` ergänzen (bei Bedarf mit `profile=`), Zeile in der Tabelle oben
nachführen.
