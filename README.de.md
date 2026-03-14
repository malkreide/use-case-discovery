# use-case-discovery

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-kompatibel-blueviolet)

> Ein strukturierter Claude Code Prompt zur systematischen Entwicklung von Use Cases aus GitHub Repos, Papers und anderen technologischen Quellen — mit kombinatorischer Kreuzinspiration über öffentliche Verwaltung, Bildung und private Projekte.

[🇬🇧 English Version](README.md)

---

## Übersicht

`use-case-discovery` ist ein Prompt-Template für **Claude Code**, das aus einem beliebigen GitHub Repository, Forschungspaper oder Technologie-Tool eine strukturierte Use-Case-Analyse macht. Es fragt nicht einfach «Was kann das?» — sondern erzwingt zuerst eine domänenunabhängige Abstraktion, kartiert dann potenzielle Anwendungen über sieben verschiedene Kontextdimensionen und generiert abschliessend unerwartete Kombinationen durch gezielte Kreuzbestäubung mit bestehenden Frameworks und Projekten.

Der Prompt wurde für einen spezifischen Kontext entwickelt (Schweizer Stadtverwaltung, Bildung, private Investments und Maker-Projekte), aber die Struktur ist vollständig auf jedes Multi-Stakeholder-Umfeld übertragbar.

---

## Funktionen

- **5-schrittiger strukturierter Analyseprozess** von technischer Abstraktion bis zu umsetzbaren Top-3-Empfehlungen
- **7 Kontextdimensionen** für öffentliche Verwaltung, Bildung, Investitionen und Technologie
- **Kombinatorik-Schritt** erzwingt unerwartete Verbindungen mit bestehenden Frameworks (SIGMA v2.0, immoinvest, MCP-Server, Raspberry Pi)
- **Handlungsorientierter Output** mit Nächsten Schritten (max. 1 Tag Aufwand) und Notion-Tags für das Wissensmanagement
- **Drei Verwendungsmodi**: interaktiv, Datei-Argument, Bash-Substitution

---

## Voraussetzungen

- [Claude Code](https://claude.ai/code) CLI installiert
- Eine GitHub-Repository-URL, ein Paper-Link oder eine Tool-Beschreibung als Input

---

## Verwendung / Quickstart

### Option A — Interaktiv in Claude Code

```
/read use-case-discovery.md
Quelle: https://github.com/[username]/[repo]
```

### Option B — Als Datei-Argument

```bash
claude -p use-case-discovery.md
# URL auf Nachfrage eingeben
```

### Option C — Mit direkter Quellangabe (Bash-Substitution)

```bash
SOURCE="https://github.com/[username]/[repo]"
sed "s|\[HIER URL / REPO / PAPER EINFÜGEN\]|$SOURCE|" use-case-discovery.md | claude -p /dev/stdin
```

---

## Prompt-Struktur

| Schritt | Inhalt |
|---|---|
| **1 — Tool-Analyse** | Domänenunabhängige Abstraktion des Kernmechanismus |
| **2 — Use Case Matrix** | 7 Kontextdimensionen (A–G) mit gezielten Use Cases pro Dimension |
| **3 — Kombinatorik** | 2–3 unerwartete Kombinationen mit bestehenden Frameworks/Projekten |
| **4 — Top-3-Empfehlung** | Bewertet nach Impact, Umsetzbarkeit, Neuartigkeit — mit Nächstem Schritt und Notion-Tag |
| **5 — Offene Fragen** | 3–5 generative Fragen für weitere Recherche oder Diskussion |

### Kontextdimensionen (A–G)

| Dim | Bereich |
|---|---|
| A | Schulamt der Stadt Zürich |
| B | Gesamte Stadtverwaltung (bereichsübergreifend) |
| C | KI-Fachgruppe (KI-Governance im öffentlichen Sektor) |
| D | Schulen & Bildung (operativ) |
| E | Privat: Sohn & Familie |
| F | Privat: Investitionen (Immobilien, ETF, Crypto) |
| G | Privat: Technologie & Making (Raspberry Pi, MCP, Edge AI) |

---

## Designentscheidungen

**Warum zuerst die domänenunabhängige Abstraktion?**
Der Schlüssel zur Kombinatorik liegt in der Beschreibung ohne vorgesehene Domäne. «Ein Chat-Interface für Dokumente» wird zu «kontextgebundener Zustandstransformation mit persistentem Gedächtnis» — und plötzlich werden Anwendungen ausserhalb des ursprünglichen Use Cases sichtbar.

**Warum 7 Dimensionen?**
Reale Kontexte haben unterschiedliche Constraints, Stakeholder und Erfolgskriterien. Ein in Dimension G (Technologie) triviales Tool kann in Dimension A (öffentliche Verwaltung) transformativ sein — und umgekehrt.

**Warum ein Nächster Schritt von max. 1 Tag?**
Ohne Handlungsanker bleibt Ideengenerierung akademisch. Der 1-Tages-Constraint verhindert Paralyse durch Perfektionismus und verwandelt Erkenntnisse in Momentum.

---

## Projektstruktur

```
use-case-discovery/
├── use-case-discovery.md   ← Haupt-Prompt (in Claude Code Projekt kopieren)
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
