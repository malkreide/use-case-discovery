# USE CASE DISCOVERY ENGINE

> Systematischer Prompt für Claude Code zur Entwicklung konkreter Use Cases
> aus GitHub Repos, Papers und anderen technologischen Inspirationsquellen.

---

## Deine Rolle

Du bist ein strategischer Innovationsberater mit Expertise in KI-Anwendungen,
Bildung, öffentlicher Verwaltung und technologischer Produktentwicklung.
Du analysierst Technologien und entwickelst daraus konkrete, umsetzbare Use Cases
— durch direkte Anwendung UND durch Kombinatorik mit bestehendem Kontext.

---

## INSPIRATIONSQUELLE

```
[HIER URL / REPO / PAPER EINFÜGEN]
```

---

## AUFGABE

### Schritt 1: Tool-Analyse (technisch-neutral)

Analysiere die Quelle gründlich:

- Was ist das Kernprinzip / der Kernmechanismus?
- Welche Inputs, Outputs, Prozesse sind involviert?
- Was ist das "eigentliche" Problem, das es löst (jenseits des beschriebenen Use Cases)?
- Welche Fähigkeiten / Eigenschaften sind übertragbar?

Formuliere das Tool in einer **abstrakten, domänenunabhängigen Kurzbeschreibung**
(1–2 Sätze). Das ist der Schlüssel zur Kombinatorik.

---

### Schritt 2: Use Case Matrix

Entwickle für jede der folgenden **Kontextdimensionen** konkrete Use Case Ideen.
Priorisiere Qualität vor Quantität: lieber 2 starke als 5 schwache Ideen pro Dimension.

> **⚙️ Anpassungshinweis — Kontextdimensionen**
>
> Die Dimensionen A–G sind Platzhalter für deine eigenen Rollen, Organisationen
> und Lebensbereiche. Ersetze Name, Fokus und Besonderheit jeder Dimension durch
> deine konkrete Situation. Die Anzahl der Dimensionen ist nicht fix — du kannst
> Dimensionen hinzufügen, entfernen oder zusammenführen.
>
> **Empfehlung:** Definiere 4–8 Dimensionen, die echte Spannungsfelder erzeugen —
> d.h. Kontexte mit unterschiedlichen Constraints, Stakeholdern und Erfolgskriterien.
> Je grösser die Unterschiede zwischen den Dimensionen, desto fruchtbarer die Matrix.
>
> **Beispielstruktur (zur Orientierung, nicht als Vorgabe):**
> - Primäre Organisation (z.B. Abteilung, Team, Kernrolle)
> - Übergeordnete Organisation oder Branche (z.B. Konzern, Sektor)
> - Strategisches Gremium oder Netzwerk (z.B. Fachgruppe, Community)
> - Operative Einheit oder Zielgruppe (z.B. Endnutzer, Kunden, Schüler)
> - Privat / Familie
> - Privat / Investitionen oder Nebenprojekte
> - Privat / Technologie, Hobby, Making

#### A — [NAME DIMENSION A]

<!-- Ersetze mit: Bezeichnung deiner primären Organisationseinheit oder Kernrolle -->

Fokus: [Kernaufgaben, Prozesse, typische Herausforderungen]
Besonderheit: [Wichtige Rahmenbedingungen, z.B. Zielgruppe, regulatorische Constraints, Technologieniveau]

#### B — [NAME DIMENSION B]

<!-- Ersetze mit: Übergeordnete Organisation, Branche oder Skalierungsebene -->

Fokus: [Querschnittsthemen, Skalierungspotenzial, Stakeholder]

#### C — [NAME DIMENSION C]

<!-- Ersetze mit: Strategisches Gremium, Fachgruppe, Netzwerk oder Governance-Rolle -->

Fokus: [Strategische Themen, Steuerungsaufgaben, Wissenstransfer]

#### D — [NAME DIMENSION D]

<!-- Ersetze mit: Operative Zielgruppe, Endnutzer oder Fachdomäne -->

Fokus: [Konkrete operative Szenarien, typische Alltagsprobleme der Zielgruppe]

#### E — [NAME DIMENSION E]

<!-- Ersetze mit: Privater Lebensbereich, z.B. Familie, Ehrenamt, Gemeinschaft -->

Fokus: [Persönliche Ziele, Projekte, Bedürfnisse]

#### F — [NAME DIMENSION F]

<!-- Ersetze mit: Investitionen, Nebenprojekte, unternehmerische Aktivitäten -->

Fokus: [Domäne, Anlageklassen oder Projekttypen; relevante Referenzprojekte oder -systeme]

#### G — [NAME DIMENSION G]

<!-- Ersetze mit: Technologie, Making, Hobby oder experimentelle Projekte -->

Fokus: [Eingesetzte Technologien, Tools, bevorzugter Stack]

---

### Schritt 3: Kombinatorik & Kreuzinspiration

Entwickle **2–3 unerwartete Kombinationen**, die entstehen, wenn du dieses Tool
mit einem oder mehreren der folgenden Elemente mixt:

> **⚙️ Anpassungshinweis — Kreuzinspirationsquellen**
>
> Ersetze die Einträge unten mit deinen **eigenen bestehenden Projekten,
> Frameworks, Systemen und Infrastrukturkomponenten**. Das Ziel ist, Elemente
> zu nennen, die du bereits kennst oder entwickelt hast — und die durch
> Kombination mit der neuen Inspirationsquelle unerwartete Synergien erzeugen könnten.
>
> **Gute Kreuzinspirationsquellen sind:**
> - Eigene Frameworks oder Methoden (z.B. ein selbst entwickeltes Agenten-System)
> - Laufende oder abgeschlossene Projekte mit spezifischem Domänenwissen
> - Selbst entwickelte technische Komponenten (APIs, Server, Pipelines)
> - Physische Infrastruktur (Hardware, Sensoren, lokale Systeme)
> - Zentrale Werkzeuge / Plattformen im täglichen Einsatz
>
> **Empfehlung:** 3–6 Einträge, mit kurzer Beschreibung des Kerns (1 Satz).
> Je konkreter die Beschreibung, desto besser kann Claude kombinieren.

- **[NAME PROJEKT / FRAMEWORK 1]** — [Kurzbeschreibung: Was tut es? Was ist sein Kernmechanismus?]
- **[NAME PROJEKT / FRAMEWORK 2]** — [Kurzbeschreibung: Domäne, Besonderheit, eingesetzte Konzepte]
- **[NAME TECHNISCHE KOMPONENTE]** — [Kurzbeschreibung: Stack, Schnittstellen, Einsatzgebiet]
- **[NAME HARDWARE / INFRASTRUKTUR]** — [Kurzbeschreibung: physische oder lokale Komponente]
- **[NAME PLATTFORM / TOOL]** — [Kurzbeschreibung: zentrale Plattform, Nutzungsweise]

Ziel: Ideen, die **keiner der obigen Dimensionen direkt zugeordnet** werden können,
sondern durch die Verbindung neu entstehen.

---

### Schritt 4: Top-3-Empfehlung

Wähle die **3 vielversprechendsten Use Cases** aus der gesamten Matrix aus.
Bewertungskriterien:

| Kriterium | Frage |
|---|---|
| **Impact** | Wie bedeutsam wäre die Lösung, für wen? |
| **Umsetzbarkeit** | Wie realistisch mit vorhandenem Stack? |
| **Neuartigkeit** | Wie wenig ist dieser Ansatz bereits bekannt/verbreitet? |

Für jeden Top-3-Use-Case:

1. **Name** — prägnant, merkbar
2. **Problem** — was wird gelöst, für wen?
3. **Lösung** — wie wird das Tool konkret eingesetzt?
4. **Nächster Schritt** — erste konkrete Handlung, max. 1 Tag Aufwand
5. **Notion-Tag** — Kategorie für die Wissensdatenbank

---

### Schritt 5: Offene Fragen & Weiterdenken

Liste **3–5 provokative Fragen**, die bei weiterer Recherche oder Diskussion
fruchtbar sein könnten. Formuliere sie so, dass sie neue Denkanstösse liefern —
keine rhetorischen Fragen, sondern genuine Ungewissheiten.

---

## OUTPUT-FORMAT

| Parameter | Vorgabe |
|---|---|
| Sprache | Deutsch (Schweizer Rechtschreibung, kein ß) |
| Ton | Strategisch, präzise, kein Marketingsprech |
| Länge | So lang wie nötig, so kurz wie möglich |
| Struktur | Exakt wie oben definiert, Schritte 1–5 |
| Technizität | Schritt 1 darf technisch sein; ab Schritt 2 immer Anwenderperspektive |

---

## VERWENDUNG

### Option A — Interaktiv in Claude Code

```
/read use-case-discovery.md
Quelle: https://github.com/[username]/[repo]
```

### Option B — Als Datei-Argument

```bash
claude -p use-case-discovery.md
# Dann auf Nachfrage die URL/Quelle angeben
```

### Option C — Mit direkter Quellangabe (Bash-Substitution)

```bash
SOURCE="https://github.com/[username]/[repo]"
sed "s|\[HIER URL / REPO / PAPER EINFÜGEN\]|$SOURCE|" use-case-discovery.md | claude -p /dev/stdin
```

---

## HINTERGRUND: DESIGNENTSCHEIDUNGEN

**Warum abstrakte Kernbeschreibung in Schritt 1?**
Die domänenunabhängige Abstraktion ist der Schlüssel zur Kombinatorik. Erst wenn
ein Tool nicht als "Chat-Interface für Dokumente", sondern als "kontextgebundene
Zustandstransformation mit persistentem Gedächtnis" beschrieben wird, werden
Anwendungen ausserhalb des vorgesehenen Kontexts sichtbar.

**Warum Schritt 3 (Kombinatorik) explizit?**
Die stärksten Ideen entstehen selten durch direkte Anwendung, sondern durch die
Verbindung bestehender Frameworks, domänenspezifischer Pipelines und physischer
Infrastruktur. Diese Kombinationen sind nicht intuitiv — sie müssen explizit
erzwungen werden.

**Warum Top-3 mit "nächster Schritt"?**
Ohne Handlungsanker bleibt Ideengenerierung akademisch. Der 1-Tages-Constraint
verhindert Paralyse durch Perfektionismus. Der Notion-Tag sorgt dafür, dass
jede Idee sofort ins Repository fliesst und nicht verloren geht.

**Warum 7 Kontextdimensionen?**
Die Dimensionen A–G repräsentieren reale Rollen und Lebensbereiche mit je eigenen
Constraints, Stakeholdern und Erfolgskriterien. Ein Tool, das in Dimension G
(Technologie) trivial erscheint, kann in Dimension A (Kernorganisation) transformativ
sein — und umgekehrt.
