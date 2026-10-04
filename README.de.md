# use-case-discovery

![Version](https://img.shields.io/badge/version-3.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-kompatibel-blueviolet)

> Ein strukturierter Claude-Code-Skill zur systematischen Entwicklung von Use Cases aus GitHub Repos, Papers und anderen technologischen Quellen — mit kombinatorischer Kreuzinspiration über die beruflichen und privaten Kontexte, die du selbst konfigurierst.

[🇬🇧 English Version](README.md)

---

## Übersicht

`use-case-discovery` ist ein **Claude-Code-Skill**, der aus einem beliebigen GitHub Repository, Forschungspaper oder Technologie-Tool eine strukturierte Use-Case-Analyse macht. Es fragt nicht einfach «Was kann das?» — sondern erzwingt zuerst eine domänenunabhängige Abstraktion, kartiert dann potenzielle Anwendungen über mehrere unterschiedliche Kontextdimensionen und generiert abschliessend unerwartete Kombinationen durch gezielte Kreuzbestäubung mit deinen eigenen Frameworks und Projekten.

Skill und Konfiguration sind getrennt: Der Skill enthält die Analyselogik, deine Rollen, Dimensionen, Projekte und Tags stehen in einem eigenen **Profil**. Ein Update des Skills lässt dein Profil unberührt. Ohne Profil läuft der Skill mit neutralen Vorgaben und weist im Output darauf hin: gut zum Ausprobieren, für echte Arbeit zu allgemein.

---

## Funktionen

- **Quellenprüfung zuerst**: Die Quelle muss tatsächlich gelesen werden; der Output beginnt mit einem Quellenstatus und bricht ab, wenn die Quelle nicht erreichbar ist
- **Quellenarten**: GitHub-Repos, Papers und Webseiten, Notion-Seiten (über einen verbundenen Notion-MCP-Server), Transkripte von Videos und Podcasts, lokale Dateien inklusive PDFs
- **6-schrittiger strukturierter Analyseprozess** von technischer Abstraktion bis zu umsetzbaren Top-3-Empfehlungen und Export
- **Quelle ist Material, nicht Auftrag**: Anweisungen in der analysierten Quelle werden nicht befolgt, sondern im Quellenstatus vermerkt
- **Profil statt Platzhalter**: Rolle, Leitplanken, Kontextdimensionen, Kreuzinspiration und Tags stehen in einer eigenen Datei ausserhalb des Skills
- **Konfigurierbare Kontextdimensionen** (4–8 empfohlen); ohne plausiblen Bezug bleibt eine Dimension begründet leer, statt mit Füllideen bestückt zu werden
- **Kombinatorik-Schritt** erzwingt unerwartete Verbindungen mit deinen eigenen Frameworks, Projekten und Infrastrukturkomponenten
- **Nachvollziehbare Auswahl**: Die stärksten Kandidaten werden vor den Top-3 in einer Tabelle bewertet, mit Begründung pro Zeile
- **Konfigurierbare Leitplanken** als Ausschlusskriterien; jeder Top-3-Use-Case nennt Risiken und Voraussetzungen
- **Export**: Die Top-3 erscheinen immer als YAML-Block; mit `--notion` werden sie nach einer Doppelprüfung in deine Notion-Datenbank geschrieben
- **Claude-Code-Skill**: `/use-case-discovery <Quelle>`, interaktiv oder headless

---

## Voraussetzungen

- [Claude Code](https://claude.ai/code) CLI installiert
- Eine GitHub-Repository-URL, ein Paper-Link oder eine Tool-Beschreibung als Input
- Für Notion-Quellen und den Notion-Export: ein verbundener Notion-MCP-Server

---

## Installation

Der Skill ist ein Ordner mit drei Dateien. Kopiere ihn in deinen persönlichen Skill-Ordner (in allen Projekten verfügbar) und lege dein Profil an:

```bash
mkdir -p ~/.claude/skills && cp -r .claude/skills/use-case-discovery ~/.claude/skills/
mkdir -p ~/.claude/use-case-discovery
cp .claude/skills/use-case-discovery/profil-vorlage.md ~/.claude/use-case-discovery/profil.md
```

Für ein einzelnes Projekt kopierst du den Ordner stattdessen nach `/pfad/zum/projekt/.claude/skills/`. In diesem Repository ist der Skill direkt verfügbar, praktisch zum Ausprobieren ohne Profil.

**Update:** Nur den Skill-Ordner erneut kopieren. Das Profil liegt ausserhalb und bleibt unverändert.

**Umstieg von 2.x:** Lösche `~/.claude/commands/use-case-discovery.md` (bzw. die Kopie im Projekt), sonst gibt es den Befehl doppelt. Übertrage deine ausgefüllten Abschnitte (Rolle, Leitplanken, Dimensionen, Kreuzinspiration, Tags) in die gleichnamigen Abschnitte von `profil.md`; die Vorlage zeigt das Format.

---

## Konfiguration: das Profil

Das Profil ist eine Markdown-Datei mit bis zu sechs Abschnitten. Jeder ist optional: Ein ausgefüllter Abschnitt ersetzt die gleichnamige Vorgabe des Skills vollständig, ein fehlender lässt sie gelten. Einträge mit Platzhaltern in eckigen Klammern werden ignoriert. Die Vorlage [`profil-vorlage.md`](.claude/skills/use-case-discovery/profil-vorlage.md) erklärt jeden Abschnitt.

Der Skill sucht das Profil an drei Orten, der erste Treffer gilt:

1. Pfad in der Umgebungsvariable `USE_CASE_DISCOVERY_PROFIL` (der Wert `keines` schaltet das Profil ab)
2. `.claude/use-case-discovery/profil.md` im aktuellen Projekt
3. `~/.claude/use-case-discovery/profil.md`

Die zweite Zeile des Outputs nennt, welches Profil verwendet wurde.

**1 — Rolle.** Drei Felder legen fest, aus welcher Perspektive die Analyse geschrieben wird: *Rolle* (der Blickwinkel, aus dem Ideen beurteilt werden), *Expertise* (2–4 Fachgebiete, idealerweise passend zu deinen Dimensionen) und *Haltung* (wie kritisch, risikobewusst oder experimentierfreudig bewertet wird). Zur Illustration die frühere Fassung des Autors: strategischer Innovationsberater mit Expertise in KI-Anwendungen, Bildung, öffentlicher Verwaltung und technologischer Produktentwicklung.

**2 — Leitplanken.** Ausschlusskriterien, die in deinem Umfeld gelten: Ein Use Case, der eine davon verletzt, kommt nicht in die Top-3. Die Vorgabe ist domänenneutral (besonders schützenswerte Personendaten, automatisierte Entscheide über Personen, Lizenz der Quelle); die Vorlage enthält sie bereits, damit sie beim Ersetzen nicht verloren gehen. Empfohlen sind 3–6 prüfbare Ausschlüsse («Keine …»). Im Umfeld des Autors wären das z.B. das Informations- und Datenschutzgesetz des Kantons Zürich (IDG), die städtischen Vorgaben zum KI-Einsatz und der Schutz von Daten von Schülerinnen und Schülern.

**3 — Kontextdimensionen.** Deine Rollen, Organisationen und Lebensbereiche, 4–8 Stück. Entscheidend ist der *Kontrast*: Wähle Kontexte mit wirklich unterschiedlichen Constraints, Stakeholdern und Erfolgskriterien.

**4 — Kreuzinspiration.** Frameworks, Projekte, Komponenten, Hardware und Plattformen, die du **bereits hast**. 3–6 Einträge, je mit einem Satz zum Kernmechanismus.

**5 — Notion-Tags.** Die Optionen deiner Notion-Select-Eigenschaft, exakt in derselben Schreibweise. Pro Top-3-Use-Case wird genau ein Tag vergeben; neue Tags werden nie erfunden, sondern separat vorgeschlagen.

**6 — Notion-Export.** Link zur Notion-Datenbank und welche Eigenschaft welchen Wert aufnimmt. Nur nötig für `--notion`.

---

## Verwendung

### Interaktiv

```
/use-case-discovery https://github.com/[username]/[repo]
```

Ohne Argument fragt Claude zuerst nach der Quelle.

### Headless (Skripte, Stapelverarbeitung)

```bash
claude -p "/use-case-discovery https://github.com/[username]/[repo]" > analyse.md
```

Der Skill gibt die nötigen lesenden Werkzeuge vorab frei (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`, Notion-Fetch und -Suche) sowie das Skript, das dein Profil lädt. Headless Läufe bleiben so nicht an Berechtigungsabfragen hängen.

### Notion-Export

```
/use-case-discovery https://github.com/[username]/[repo] --notion
```

Mit `--notion` und einer Datenbank im Profil liest der Skill zuerst die Datenbank, sucht für jeden Top-3-Use-Case nach bestehenden Einträgen und legt nur neue Ideen an. Bestehende Seiten werden nie geändert oder gelöscht. Ohne `--notion` schreibt der Skill nichts nach Notion; der YAML-Block am Ende jeder Analyse bleibt die Ablage.

Das Schreiben (`notion-create-pages`) ist bewusst **nicht** vorab freigegeben: Interaktiv bestätigst du jede Schreibaktion. Für headless Läufe gibst du sie ausdrücklich frei:

```bash
claude -p "/use-case-discovery <Quelle> --notion" --allowedTools "mcp__notion__notion-create-pages"
```

### Quellenarten

| Quelle | Übergabe | Hinweis |
|---|---|---|
| GitHub-Repo, Paper, Webseite | URL | Gelesen per WebFetch; Repos werden bei Bedarf in einen temporären Ordner geklont |
| Notion-Seite | Notion-Link | Braucht einen verbundenen Notion-MCP-Server. Verweist die Seite nur auf eine andere Quelle (z.B. ein Bibliothekseintrag), wird das Original analysiert |
| Video, Podcast, Vortrag | Transkript-Datei (`.txt`, `.vtt`, `.srt`), optional gefolgt von der URL | Eine URL allein genügt nicht: Titel und Beschreibung sind nicht der Inhalt |
| Lokale Datei, PDF, Screenshot | Pfad | Der sicherste Weg für lange Texte |

```
/use-case-discovery https://app.notion.com/p/…
/use-case-discovery vortrag-transkript.vtt https://youtu.be/…
```

**Sekundärquellen und mehrere Themen.** Berichtet eine Quelle über ein anderes Werk (Newsletter, Blogbeitrag oder Notion-Kopie über ein Repo oder Paper), wird das Original gesucht und analysiert. Ist es nicht verlinkt oder nicht erreichbar, gilt höchstens `teilweise gelesen`, und Aussagen darüber werden als aus zweiter Hand gekennzeichnet. Behandelt eine Quelle mehrere unabhängige Themen, wird nur das Hauptthema analysiert (meist jenes im Titel); die übrigen werden für eigene Läufe aufgelistet. Für ein anderes Thema nennst du es nach der Quelle:

```
/use-case-discovery https://app.notion.com/p/… Thema: GitHub-Chatbot
```

**Name des Notion-Werkzeugs.** `allowed-tools` gibt `notion-fetch` und `notion-search` unter den Präfixen `mcp__Notion__` und `mcp__notion__` frei, also für einen Notion-Server namens `Notion` oder `notion`. Heisst dein Server anders (prüfen mit `claude mcp list`), passe die Einträge in `SKILL.md` an. Sonst fragt Claude bei jedem Lauf nach der Berechtigung, und headless Läufe können Notion nicht lesen.

### Fehlerbehebung

**Die Profilzeile meldet, dass kein Profil geladen werden konnte.** Prüfe, ob `profil-laden.sh` im Skill-Ordner ausführbar ist (`chmod +x ~/.claude/skills/use-case-discovery/profil-laden.sh`). Beim Kopieren aus einem ZIP-Archiv geht das Ausführungsrecht verloren.

---

## Prompt-Struktur

| Schritt | Inhalt |
|---|---|
| **0 — Quellenprüfung** | Quelle lesen; Status melden: vollständig gelesen, teilweise gelesen oder nicht erreichbar (Abbruch); danach die Profilzeile |
| **1 — Tool-Analyse** | Domänenunabhängige Abstraktion des Kernmechanismus; Erschlossenes als Annahme markiert |
| **2 — Use Case Matrix** | Deine Kontextdimensionen aus dem Profil, mit gezielten Use Cases pro Dimension; ohne plausiblen Bezug begründet leer |
| **3 — Kombinatorik** | 2–3 unerwartete Kombinationen mit deinen eigenen Frameworks/Projekten |
| **4 — Top-3-Empfehlung** | Bewertungstabelle der 5–8 stärksten Kandidaten (Impact, Umsetzbarkeit, Neuartigkeit; 1–3), Ausschluss bei verletzter Leitplanke; Top-3 mit Risiken & Voraussetzungen, Nächstem Schritt und Notion-Tag |
| **5 — Offene Fragen** | 3–5 generative Fragen für weitere Recherche oder Diskussion |
| **6 — Export** | Top-3 als YAML-Block; mit `--notion` Doppelprüfung und Ablage in der Notion-Datenbank |

### Beispiel: Kontextdimensionen im Profil

Die folgende Belegung ist die Konfiguration des Autors — eine Illustration der *Art* von Kontrast, die die Matrix zum Laufen bringt, keine zu übernehmende Vorgabe:

| Dim | Bereich |
|---|---|
| A | Schulamt der Stadt Zürich |
| B | Gesamte Stadtverwaltung (bereichsübergreifend) |
| C | KI-Fachgruppe (KI-Governance im öffentlichen Sektor) |
| D | Schulen & Bildung (operativ) |
| E | Privat: Sohn & Familie |
| F | Privat: Investitionen (Immobilien, ETF, Crypto) |
| G | Privat: Technologie & Making (Raspberry Pi, MCP, Edge AI) |

Beachte die Spannweite: A–D unterscheiden sich in Massstab und Mandat innerhalb eines beruflichen Kontexts, E–G ergänzen private Bereiche mit völlig anderen Erfolgskriterien. Ein Tool, das in einem Bereich unauffällig ist, ist im anderen oft transformativ.

---

## Designentscheidungen

**Warum zuerst die domänenunabhängige Abstraktion?**
Der Schlüssel zur Kombinatorik liegt in der Beschreibung ohne vorgesehene Domäne. «Ein Chat-Interface für Dokumente» wird zu «kontextgebundener Zustandstransformation mit persistentem Gedächtnis» — und plötzlich werden Anwendungen ausserhalb des ursprünglichen Use Cases sichtbar.

**Warum mehrere Dimensionen statt einer?**
Reale Kontexte haben unterschiedliche Constraints, Stakeholder und Erfolgskriterien. Ein in einem Technologiekontext triviales Tool kann in der öffentlichen Verwaltung transformativ sein — und umgekehrt. Unter vier Dimensionen entsteht diese Spannung selten, über acht verwässert sie.

**Warum zuerst die Quelle lesen?**
Eine Analyse auf einer nie gelesenen Quelle sieht genauso überzeugend aus wie eine echte. Der Quellenstatus zeigt, worauf die Analyse steht, und der Abbruch bei nicht erreichbarer Quelle verhindert, dass eine plausible, aber erfundene Kernbeschreibung die ganze Matrix trägt.

**Warum darf eine Dimension leer bleiben?**
Wer in jeder Dimension Ideen verlangt, bekommt in den unpassenden Füllmaterial, das genauso überzeugt klingt wie die guten Ideen. «Kein plausibler Bezug» mit Begründung ist eine ehrliche Aussage über die Reichweite eines Tools.

**Warum eine Bewertungstabelle vor den Top-3?**
Ohne sichtbare Bewertung lässt sich die Auswahl nicht prüfen und nicht diskutieren. Die Tabelle legt offen, welche Kandidaten im Rennen waren und warum. Neuartigkeit ist als Annahme markiert, weil sie ohne Recherche geschätzt wird.

**Warum Leitplanken?**
Eine kritische Haltung allein verhindert nicht, dass eine eindrückliche, aber unzulässige Idee auf Platz 1 landet. Leitplanken machen die Grenzen, die im eigenen Umfeld ohnehin gelten, zu einem prüfbaren Teil der Auswahl.

**Warum ein Nächster Schritt von max. 1 Tag?**
Ohne Handlungsanker bleibt Ideengenerierung akademisch. Der 1-Tages-Constraint verhindert Paralyse durch Perfektionismus und verwandelt Erkenntnisse in Momentum.

**Warum ein Profil statt ausgefüllter Platzhalter?**
Solange die persönliche Konfiguration in derselben Datei steht wie die Analyselogik, heisst jedes Update: neu kopieren und von Hand übertragen. Mit getrenntem Profil wird ein Update zum Austausch eines Ordners, und das Repository bleibt frei von persönlichen Angaben.

**Warum Notion nur mit `--notion`?**
Schreiben in eine geteilte Datenbank ist eine Handlung mit Aussenwirkung. Sie soll bewusst ausgelöst werden, nicht als Nebeneffekt jeder Analyse. Die Doppelprüfung hält die Datenbank sauber und zeigt nebenbei, welche Ideen im eigenen Bestand schon existieren.

---

## Tests

Ein fester Satz von zehn Testquellen prüft, ob die Regeln des Skills im echten Lauf greifen: Quellenstatus, Abbruch bei nicht erreichbaren Quellen, Sekundärquellen, mehrere Themen, Prompt-Injection, Bewertungstabelle, Leitplanken, Profil und Export-Block. Die Tests laufen headless gegen den Skill in diesem Repository und laden nie dein persönliches Profil:

```bash
python3 tests/run_tests.py --offline   # nur lokale Testquellen
python3 tests/run_tests.py             # alle, inklusive URLs
```

Fälle, Prüfstufen und Grenzen beschreibt [tests/README.md](tests/README.md). Eine neue Regel im Skill beginnt mit einem Testfall, der ohne sie scheitert.

---

## Projektstruktur

```
use-case-discovery/
├── .claude/
│   └── skills/
│       └── use-case-discovery/     ← Der Skill (ganzen Ordner kopieren)
│           ├── SKILL.md            ← Analyselogik und Vorgaben
│           ├── profil-laden.sh     ← Lädt dein Profil
│           └── profil-vorlage.md   ← Vorlage für dein Profil
├── tests/
│   ├── fixtures/           ← Lokale Testquellen
│   ├── run_tests.py        ← Testlauf und Prüfungen
│   └── README.md           ← Fälle und Vorgehen
├── README.md               ← Englische Version
├── README.de.md            ← Diese Datei
├── CHANGELOG.md            ← Versionsverlauf
└── LICENSE                 ← MIT-Lizenz
```

---

## Versionsverlauf

Siehe [CHANGELOG.md](CHANGELOG.md)

---

## Lizenz

MIT-Lizenz — siehe [LICENSE](LICENSE)

---

## Autor

Hayal Oezkan · [GitHub](https://github.com/malkreide)
