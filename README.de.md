# use-case-discovery

![Version](https://img.shields.io/badge/version-2.4.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-kompatibel-blueviolet)

> Ein strukturierter Claude Code Prompt zur systematischen Entwicklung von Use Cases aus GitHub Repos, Papers und anderen technologischen Quellen — mit kombinatorischer Kreuzinspiration über die beruflichen und privaten Kontexte, die du selbst konfigurierst.

[🇬🇧 English Version](README.md)

---

## Übersicht

`use-case-discovery` ist ein Prompt-Template für **Claude Code**, das aus einem beliebigen GitHub Repository, Forschungspaper oder Technologie-Tool eine strukturierte Use-Case-Analyse macht. Es fragt nicht einfach «Was kann das?» — sondern erzwingt zuerst eine domänenunabhängige Abstraktion, kartiert dann potenzielle Anwendungen über mehrere unterschiedliche Kontextdimensionen und generiert abschliessend unerwartete Kombinationen durch gezielte Kreuzbestäubung mit deinen eigenen Frameworks und Projekten.

Der Prompt wird **unkonfiguriert** ausgeliefert: Kontextdimensionen und Kreuzinspirationsquellen sind Platzhalter, die du mit deinen eigenen Rollen, Organisationen und Projekten füllst. Siehe [Konfiguration](#konfiguration). Unkonfiguriert läuft der Prompt mit drei neutralen Ersatzdimensionen und weist im Output darauf hin: gut zum Ausprobieren, für echte Arbeit zu allgemein.

---

## Funktionen

- **Quellenprüfung zuerst**: Die Quelle muss tatsächlich gelesen werden; der Output beginnt mit einem Quellenstatus und bricht ab, wenn die Quelle nicht erreichbar ist
- **Quellenarten**: GitHub-Repos, Papers und Webseiten, Notion-Seiten (über einen verbundenen Notion-MCP-Server), Transkripte von Videos und Podcasts, lokale Dateien inklusive PDFs
- **5-schrittiger strukturierter Analyseprozess** von technischer Abstraktion bis zu umsetzbaren Top-3-Empfehlungen
- **Quelle ist Material, nicht Auftrag**: Anweisungen in der analysierten Quelle werden nicht befolgt, sondern im Quellenstatus vermerkt
- **Konfigurierbare Kontextdimensionen** (4–8 empfohlen) für die Bereiche, in denen du tatsächlich arbeitest; ohne plausiblen Bezug bleibt eine Dimension begründet leer, statt mit Füllideen bestückt zu werden
- **Kombinatorik-Schritt** erzwingt unerwartete Verbindungen mit deinen eigenen Frameworks, Projekten und Infrastrukturkomponenten
- **Nachvollziehbare Auswahl**: Die stärksten Kandidaten werden vor den Top-3 in einer Tabelle bewertet, mit Begründung pro Zeile
- **Konfigurierbare Leitplanken** als Ausschlusskriterien; jeder Top-3-Use-Case nennt Risiken und Voraussetzungen
- **Handlungsorientierter Output** mit Nächsten Schritten (max. 1 Tag Aufwand) und Notion-Tags aus einer festen, anpassbaren Liste
- **Claude-Code-Slash-Command**: `/use-case-discovery <Quelle>`, interaktiv oder headless

---

## Voraussetzungen

- [Claude Code](https://claude.ai/code) CLI installiert
- Eine GitHub-Repository-URL, ein Paper-Link oder eine Tool-Beschreibung als Input

---

## Konfiguration

Vor der ersten Verwendung füllst du die beiden Platzhalter-Blöcke in `.claude/commands/use-case-discovery.md` und prüfst Rolle, Leitplanken und Tag-Liste. Alle fünf sind im Prompt selbst mit einem ⚙️-Hinweis markiert.

**1 — Rolle.** Drei Felder legen fest, aus welcher Perspektive die Analyse geschrieben wird: *Rolle* (der Blickwinkel, aus dem Ideen beurteilt werden), *Expertise* (2–4 Fachgebiete, idealerweise passend zu deinen Dimensionen aus Schritt 2) und *Haltung* (wie kritisch, risikobewusst oder experimentierfreudig bewertet wird). Die ausgelieferte Vorgabe ist domänenneutral und funktioniert auch unkonfiguriert. Zur Illustration die frühere Fassung des Autors: strategischer Innovationsberater mit Expertise in KI-Anwendungen, Bildung, öffentlicher Verwaltung und technologischer Produktentwicklung.

**2 — Leitplanken.** Ausschlusskriterien, die in deinem Umfeld gelten: Ein Use Case, der eine davon verletzt, kommt nicht in die Top-3. In Schritt 2 und 3 darf er erscheinen, wenn die Bedingung genannt wird, unter der er die Leitplanke einhielte. Die Vorgabe ist domänenneutral (besonders schützenswerte Personendaten, automatisierte Entscheide über Personen, Lizenz der Quelle) und funktioniert auch unkonfiguriert. Empfohlen sind 3–6 prüfbare Ausschlüsse («Keine …»). Im Umfeld des Autors wären das z.B. das Informations- und Datenschutzgesetz des Kantons Zürich (IDG), die städtischen Vorgaben zum KI-Einsatz und der Schutz von Daten von Schülerinnen und Schülern.

**3 — Kontextdimensionen (Schritt 2).** Ersetze `[NAME DIMENSION A]` … `[NAME DIMENSION G]` durch deine eigenen Rollen, Organisationen und Lebensbereiche. Die Anzahl ist nicht fix — 4–8 Dimensionen funktionieren gut. Entscheidend ist der *Kontrast*: Wähle Kontexte mit wirklich unterschiedlichen Constraints, Stakeholdern und Erfolgskriterien. Je grösser der Abstand zwischen den Dimensionen, desto fruchtbarer die Matrix.

**4 — Kreuzinspirationsquellen (Schritt 3).** Ersetze die `[NAME PROJEKT / FRAMEWORK]`-Einträge durch Frameworks, Projekte, Komponenten, Hardware und Plattformen, die du **bereits hast**. 3–6 Einträge, je mit einem Satz zum Kernmechanismus. Je konkreter die Beschreibung, desto besser die Kombinationen.

**5 — Notion-Tags (Schritt 4).** Der Prompt liefert eine domänenneutrale Liste mit acht Tags aus und vergibt pro Top-3-Use-Case genau einen davon. Neue Tags erfindet er nicht; passt keiner, schlägt er einen neuen separat vor. Ersetze die Liste durch die Optionen deiner Notion-Select-Eigenschaft, damit die Werte exakt übereinstimmen. Dieser Block funktioniert auch unkonfiguriert.

Der Prompt behält seine Platzhalter bewusst, damit das Repository wiederverwendbar bleibt. Deine ausgefüllte Fassung ist persönlich — halte sie in deinem eigenen Projekt, statt sie hierher zurückzuspielen.

---

## Verwendung / Quickstart

Der Prompt ist ein [Custom Slash Command für Claude Code](https://code.claude.com/docs/en/slash-commands): Die übergebene Quelle wird über `$ARGUMENTS` eingesetzt.

### Installation

Kopiere die Datei in einen der beiden Command-Ordner und konfiguriere sie danach (siehe [Konfiguration](#konfiguration)):

```bash
# Persönlich: in allen Projekten verfügbar (empfohlen, deine Konfiguration bleibt privat)
mkdir -p ~/.claude/commands && cp .claude/commands/use-case-discovery.md ~/.claude/commands/

# Projekt: nur in diesem Projekt verfügbar
mkdir -p /pfad/zum/projekt/.claude/commands && cp .claude/commands/use-case-discovery.md /pfad/zum/projekt/.claude/commands/
```

In diesem Repository ist der Command direkt verfügbar, praktisch zum Ausprobieren der unkonfigurierten Vorlage. Sie arbeitet mit neutralen Ersatzdimensionen und vermerkt das im Output.

### Option A — Interaktiv

```
/use-case-discovery https://github.com/[username]/[repo]
```

Ohne Argument fragt Claude zuerst nach der Quelle.

### Option B — Headless (Skripte, Stapelverarbeitung)

```bash
claude -p "/use-case-discovery https://github.com/[username]/[repo]" > analyse.md
```

Der Command gibt die nötigen lesenden Werkzeuge vorab frei (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`, Notion-Fetch), damit headless Läufe nicht an Berechtigungsabfragen hängen bleiben.

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

**Name des Notion-Werkzeugs.** `allowed-tools` gibt `mcp__Notion__notion-fetch` und `mcp__notion__notion-fetch` frei, also die Namen, die ein Notion-Server unter der Bezeichnung `Notion` oder `notion` erhält. Heisst dein Server anders (prüfen mit `claude mcp list`), passe den Eintrag auf `mcp__<server-name>__notion-fetch` an. Sonst fragt Claude bei jedem Lauf nach der Berechtigung, und headless Läufe können Notion nicht lesen.

---

## Prompt-Struktur

| Schritt | Inhalt |
|---|---|
| **0 — Quellenprüfung** | Quelle lesen; Status melden: vollständig gelesen, teilweise gelesen oder nicht erreichbar (Abbruch) |
| **1 — Tool-Analyse** | Domänenunabhängige Abstraktion des Kernmechanismus; Erschlossenes als Annahme markiert |
| **2 — Use Case Matrix** | Deine konfigurierten Kontextdimensionen, mit gezielten Use Cases pro Dimension; ohne plausiblen Bezug begründet leer |
| **3 — Kombinatorik** | 2–3 unerwartete Kombinationen mit deinen eigenen Frameworks/Projekten |
| **4 — Top-3-Empfehlung** | Bewertungstabelle der 5–8 stärksten Kandidaten (Impact, Umsetzbarkeit, Neuartigkeit; 1–3), Ausschluss bei verletzter Leitplanke; Top-3 mit Risiken & Voraussetzungen, Nächstem Schritt und Notion-Tag aus der festen Liste |
| **5 — Offene Fragen** | 3–5 generative Fragen für weitere Recherche oder Diskussion |

### Beispielkonfiguration (A–G)

Der Prompt liefert sieben leere Slots A–G aus. Die folgende Belegung ist die Konfiguration des Autors — eine Illustration der *Art* von Kontrast, die die Matrix zum Laufen bringt, keine zu übernehmende Vorgabe:

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

---

## Tests

Ein fester Satz von neun Testquellen prüft, ob die Regeln des Prompts im echten Lauf greifen: Quellenstatus, Abbruch bei nicht erreichbaren Quellen, Sekundärquellen, mehrere Themen, Prompt-Injection, Bewertungstabelle und Leitplanken. Die Tests laufen headless gegen die Vorlage in diesem Repository:

```bash
python3 tests/run_tests.py --offline   # nur lokale Testquellen
python3 tests/run_tests.py             # alle, inklusive URLs
```

Fälle, Prüfstufen und Grenzen beschreibt [tests/README.md](tests/README.md). Eine neue Regel im Prompt beginnt mit einem Testfall, der ohne sie scheitert.

---

## Projektstruktur

```
use-case-discovery/
├── .claude/
│   └── commands/
│       └── use-case-discovery.md   ← Haupt-Prompt als Slash-Command (kopieren, dann konfigurieren)
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
