# Profil für /use-case-discovery

<!--
Vorlage für deine persönliche Konfiguration. Kopiere sie an einen dieser Orte:

  ~/.claude/use-case-discovery/profil.md          für alle Projekte
  .claude/use-case-discovery/profil.md            nur für ein Projekt (hat Vorrang)

Jeder Abschnitt ist optional. Ein Abschnitt, den du hier ausfüllst, ersetzt die
gleichnamige Vorgabe im Skill vollständig; ein gelöschter Abschnitt lässt die
Vorgabe gelten. Einträge mit Platzhaltern in eckigen Klammern werden ignoriert.

Das Profil liegt ausserhalb des Skill-Ordners. Ein Update des Skills lässt es
deshalb unberührt.
-->

## Rolle

<!--
Die Rolle bestimmt Blickwinkel, Fachwissen und Bewertungsmassstab, besonders bei
der Auswahl der Top-3 in Schritt 4.
- Rolle: die Perspektive, aus der die Ideen beurteilt werden, z.B.
  Innovationsberatung, Geschäftsleitung, Fachgruppe, Produktentwicklung.
- Expertise: 2–4 Fachgebiete. Sie sollten deine Kontextdimensionen abdecken,
  sonst bleiben einzelne Dimensionen oberflächlich. Mehr verwässert.
- Haltung: wie kritisch, risikobewusst oder experimentierfreudig bewertet wird.
  Eine explizite Haltung verhindert reinen Technologie-Optimismus.
-->

- **Rolle:** [z.B. Strategische Innovationsberatung]
- **Expertise:** [2–4 Fachgebiete]
- **Haltung:** [z.B. Kritisch und umsetzungsorientiert. Benenne Grenzen, Risiken
  und Voraussetzungen ebenso klar wie das Potenzial.]

## Leitplanken

<!--
Ausschlusskriterien: Ein Use Case, der eine davon verletzt, kommt nicht in die
Top-3. Formuliere 3–6 prüfbare Ausschlüsse («Keine …»), nicht Ziele; Ziele
gehören in die Bewertung. Typische Quellen: Datenschutzrecht, interne
KI-Richtlinien, Informationssicherheit, Beschaffungsvorgaben, Budgetgrenzen.

Die drei Einträge unten sind die Vorgaben des Skills. Da dieser Abschnitt die
Vorgabe ersetzt, behalte sie, wenn sie weiter gelten sollen.
-->

- Keine Lösung, die besonders schützenswerte Personendaten (z.B. Gesundheitsdaten,
  Daten von Kindern) ohne geklärte Rechtsgrundlage an externe Dienste weitergibt.
- Keine automatisierten Entscheide über Personen ohne menschliche Prüfung.
- Kein Einsatz, der die Lizenz- oder Nutzungsbedingungen der Quelle verletzt.
- [Weitere Leitplanke aus deinem Umfeld]

## Kontextdimensionen

<!--
Deine Rollen, Organisationen und Lebensbereiche. Empfohlen sind 4–8 Dimensionen
mit echten Spannungsfeldern: Kontexte mit unterschiedlichen Constraints,
Stakeholdern und Erfolgskriterien. Je grösser die Unterschiede, desto
fruchtbarer die Matrix. Unter vier entsteht die Spannung selten, über acht
verwässert sie.

Beispielstruktur (zur Orientierung, nicht als Vorgabe):
- Primäre Organisation (Abteilung, Team, Kernrolle)
- Übergeordnete Organisation oder Branche
- Strategisches Gremium oder Netzwerk
- Operative Einheit oder Zielgruppe
- Privat: Familie, Investitionen, Technologie und Making
-->

### A — [Name der Dimension]

Fokus: [Kernaufgaben, Prozesse, typische Herausforderungen]
Besonderheit: [Rahmenbedingungen, z.B. Zielgruppe, Regulierung, Technologieniveau]

### B — [Name der Dimension]

Fokus: [Querschnittsthemen, Skalierungspotenzial, Stakeholder]

### C — [Name der Dimension]

Fokus: [Strategische Themen, Steuerungsaufgaben, Wissenstransfer]

### D — [Name der Dimension]

Fokus: [Konkrete operative Szenarien, Alltagsprobleme der Zielgruppe]

## Kreuzinspiration

<!--
Frameworks, Projekte, Komponenten, Hardware und Plattformen, die du bereits
hast. Mit ihnen kombiniert Schritt 3 die neue Quelle. 3–6 Einträge mit je einem
Satz zum Kernmechanismus; je konkreter, desto besser die Kombinationen.
-->

- **[Name Projekt / Framework]** — [Was tut es? Was ist sein Kernmechanismus?]
- **[Name technische Komponente]** — [Stack, Schnittstellen, Einsatzgebiet]
- **[Name Hardware / Infrastruktur]** — [physische oder lokale Komponente]
- **[Name Plattform / Werkzeug]** — [zentrale Plattform, Nutzungsweise]

## Notion-Tags

<!--
Die Optionen deiner Notion-Eigenschaft (Select oder Multi-Select), exakt in
derselben Schreibweise. Empfohlen: 6–10 Tags. Weniger trennt nicht, mehr wird
beliebig. Ohne diesen Abschnitt gilt die neutrale Liste des Skills.
-->

- `[Tag]` — [wofür er steht]

## Notion-Export

<!--
Nur nötig für den Export mit «--notion». Ohne diesen Abschnitt schreibt der
Skill nie nach Notion.

- Datenbank: Link zur Notion-Datenbank (Datenbank-Ansicht kopieren).
- Eigenschaften: welche Notion-Eigenschaft welchen Wert aufnimmt. Die Namen
  müssen exakt mit denen in Notion übereinstimmen.
-->

- **Datenbank:** [https://www.notion.so/…]
- **Eigenschaften:**
  - Titel → `[Name der Titeleigenschaft]`
  - Tag → `[Name der Select-Eigenschaft]`
  - Quelle → `[Name der URL-Eigenschaft]`
  - Status → `[Name der Status-Eigenschaft]`: `[Wert für neue Einträge, z.B. Idee]`
