# use-case-discovery

![Version](https://img.shields.io/badge/version-2.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-kompatibel-blueviolet)

> Ein strukturierter Claude Code Prompt zur systematischen Entwicklung von Use Cases aus GitHub Repos, Papers und anderen technologischen Quellen — mit kombinatorischer Kreuzinspiration über die beruflichen und privaten Kontexte, die du selbst konfigurierst.

[🇬🇧 English Version](README.md)

---

## Übersicht

`use-case-discovery` ist ein Prompt-Template für **Claude Code**, das aus einem beliebigen GitHub Repository, Forschungspaper oder Technologie-Tool eine strukturierte Use-Case-Analyse macht. Es fragt nicht einfach «Was kann das?» — sondern erzwingt zuerst eine domänenunabhängige Abstraktion, kartiert dann potenzielle Anwendungen über mehrere unterschiedliche Kontextdimensionen und generiert abschliessend unerwartete Kombinationen durch gezielte Kreuzbestäubung mit deinen eigenen Frameworks und Projekten.

Der Prompt wird **unkonfiguriert** ausgeliefert: Kontextdimensionen und Kreuzinspirationsquellen sind Platzhalter, die du mit deinen eigenen Rollen, Organisationen und Projekten füllst. Siehe [Konfiguration](#konfiguration) — vorher ist der Prompt nicht einsatzfähig.

---

## Funktionen

- **Quellenprüfung zuerst**: Die Quelle muss tatsächlich gelesen werden; der Output beginnt mit einem Quellenstatus und bricht ab, wenn die Quelle nicht erreichbar ist
- **5-schrittiger strukturierter Analyseprozess** von technischer Abstraktion bis zu umsetzbaren Top-3-Empfehlungen
- **Konfigurierbare Kontextdimensionen** (4–8 empfohlen) für die Bereiche, in denen du tatsächlich arbeitest
- **Kombinatorik-Schritt** erzwingt unerwartete Verbindungen mit deinen eigenen Frameworks, Projekten und Infrastrukturkomponenten
- **Handlungsorientierter Output** mit Nächsten Schritten (max. 1 Tag Aufwand) und Notion-Tags aus einer festen, anpassbaren Liste
- **Claude-Code-Slash-Command**: `/use-case-discovery <Quelle>`, interaktiv oder headless

---

## Voraussetzungen

- [Claude Code](https://claude.ai/code) CLI installiert
- Eine GitHub-Repository-URL, ein Paper-Link oder eine Tool-Beschreibung als Input

---

## Konfiguration

Vor der ersten Verwendung füllst du die beiden Platzhalter-Blöcke in `.claude/commands/use-case-discovery.md` und prüfst Rolle und Tag-Liste. Alle vier sind im Prompt selbst mit einem ⚙️-Hinweis markiert.

**1 — Rolle.** Drei Felder legen fest, aus welcher Perspektive die Analyse geschrieben wird: *Rolle* (der Blickwinkel, aus dem Ideen beurteilt werden), *Expertise* (2–4 Fachgebiete, idealerweise passend zu deinen Dimensionen aus Schritt 2) und *Haltung* (wie kritisch, risikobewusst oder experimentierfreudig bewertet wird). Die ausgelieferte Vorgabe ist domänenneutral und funktioniert auch unkonfiguriert. Zur Illustration die frühere Fassung des Autors: strategischer Innovationsberater mit Expertise in KI-Anwendungen, Bildung, öffentlicher Verwaltung und technologischer Produktentwicklung.

**2 — Kontextdimensionen (Schritt 2).** Ersetze `[NAME DIMENSION A]` … `[NAME DIMENSION G]` durch deine eigenen Rollen, Organisationen und Lebensbereiche. Die Anzahl ist nicht fix — 4–8 Dimensionen funktionieren gut. Entscheidend ist der *Kontrast*: Wähle Kontexte mit wirklich unterschiedlichen Constraints, Stakeholdern und Erfolgskriterien. Je grösser der Abstand zwischen den Dimensionen, desto fruchtbarer die Matrix.

**3 — Kreuzinspirationsquellen (Schritt 3).** Ersetze die `[NAME PROJEKT / FRAMEWORK]`-Einträge durch Frameworks, Projekte, Komponenten, Hardware und Plattformen, die du **bereits hast**. 3–6 Einträge, je mit einem Satz zum Kernmechanismus. Je konkreter die Beschreibung, desto besser die Kombinationen.

**4 — Notion-Tags (Schritt 4).** Der Prompt liefert eine domänenneutrale Liste mit acht Tags aus und vergibt pro Top-3-Use-Case genau einen davon. Neue Tags erfindet er nicht; passt keiner, schlägt er einen neuen separat vor. Ersetze die Liste durch die Optionen deiner Notion-Select-Eigenschaft, damit die Werte exakt übereinstimmen. Dieser Block funktioniert auch unkonfiguriert.

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

In diesem Repository ist der Command direkt verfügbar, praktisch zum Ausprobieren der unkonfigurierten Vorlage.

### Option A — Interaktiv

```
/use-case-discovery https://github.com/[username]/[repo]
```

Ohne Argument fragt Claude zuerst nach der Quelle.

### Option B — Headless (Skripte, Stapelverarbeitung)

```bash
claude -p "/use-case-discovery https://github.com/[username]/[repo]" > analyse.md
```

Der Command gibt die nötigen lesenden Werkzeuge vorab frei (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`), damit headless Läufe nicht an Berechtigungsabfragen hängen bleiben.

---

## Prompt-Struktur

| Schritt | Inhalt |
|---|---|
| **0 — Quellenprüfung** | Quelle lesen; Status melden: vollständig gelesen, teilweise gelesen oder nicht erreichbar (Abbruch) |
| **1 — Tool-Analyse** | Domänenunabhängige Abstraktion des Kernmechanismus; Erschlossenes als Annahme markiert |
| **2 — Use Case Matrix** | Deine konfigurierten Kontextdimensionen, mit gezielten Use Cases pro Dimension |
| **3 — Kombinatorik** | 2–3 unerwartete Kombinationen mit deinen eigenen Frameworks/Projekten |
| **4 — Top-3-Empfehlung** | Bewertet nach Impact, Umsetzbarkeit, Neuartigkeit — mit Nächstem Schritt und Notion-Tag aus der festen Liste |
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

**Warum ein Nächster Schritt von max. 1 Tag?**
Ohne Handlungsanker bleibt Ideengenerierung akademisch. Der 1-Tages-Constraint verhindert Paralyse durch Perfektionismus und verwandelt Erkenntnisse in Momentum.

---

## Projektstruktur

```
use-case-discovery/
├── .claude/
│   └── commands/
│       └── use-case-discovery.md   ← Haupt-Prompt als Slash-Command (kopieren, dann konfigurieren)
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
