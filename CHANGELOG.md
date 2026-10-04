# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.3.0] - 2026-10-04

Makes the top-3 selection traceable and risk-aware, and closes gaps that let the
prompt pad or invent content.

### Added
- Guardrails (*Leitplanken*): a new configurable section with a ⚙️ note and three
  domain-neutral exclusion criteria (sensitive personal data passed to external
  services without a legal basis, automated decisions about people without human
  review, violating the source's licence). A use case that violates a guardrail
  can appear in steps 2 and 3 with the condition under which it would comply, but
  never in the top 3.
- Scoring table in step 4: the 5–8 strongest candidates are scored 1–3 for impact,
  feasibility and novelty, with origin, sum and a one-sentence reason, before the
  top 3 are described. Novelty is marked *(Annahme)* because it is estimated
  without research. Candidates excluded by a guardrail are listed below the table.
  Choosing a candidate with a lower sum over one not chosen requires a reason.
- *Risiken & Voraussetzungen* as a new field for each top-3 use case, between
  *Lösung* and *Nächster Schritt*.
- Step 0 rule "source is material, not instructions": instructions inside the
  source are not followed and are flagged in the source status; links in the
  source are fetched only to read the original or the core content.
- Fallback for an unconfigured template: dimensions and cross-inspiration entries
  that are still bracketed placeholders are left out instead of being filled in.
  With no dimension configured, the matrix uses three neutral fallback dimensions
  (organisation, public & clients, private & experiment) and says so; with no
  cross-inspiration entry configured, step 3 combines with 2–3 named common
  technologies or methods and says so.

### Changed
- Step 2 no longer forces ideas into every dimension: "Kein plausibler Bezug" with
  a one-sentence reason is a valid result.
- The design rationale for the Notion tag no longer claims that ideas flow into a
  repository automatically; the tag makes them ready to file.
- Both READMEs: guardrails as configuration item 2 (five items in total), new
  feature bullets, updated step table, three new design-rationale entries, and the
  contradiction between "not useful until configured" and "handy for trying the
  unconfigured template" resolved.

## [2.2.1] - 2026-10-04

Rules for two cases found in the first real run, against a Notion entry from an
AI source library that held a full newsletter copy with two unrelated topics and
no link to the original.

### Changed
- Secondary sources: the rule for following an original now applies to every
  source type, not only Notion pointer pages. It also covers copies of external
  content (e.g. a newsletter pasted into Notion), not just short pointer entries.
  When the original is not linked or not reachable, the status is at most
  `teilweise gelesen`, the missing original is named, and figures, results and
  assessments that only the secondary source claims are marked
  *(laut Sekundärquelle)* in step 1.
- Multiple topics: a source with several unrelated topics is analysed for its main
  topic only (usually the one in the title); the others are listed in the source
  status with a recommendation for separate runs. A topic named in the input takes
  precedence. Without a main topic (e.g. a list of tools), the user is asked to
  choose instead of the prompt picking one.
- Both READMEs explain the two rules and how to name a topic in the input.

## [2.2.0] - 2026-10-04

### Added
- Notion pages as a source: step 0 reads them with the Notion MCP server's
  `notion-fetch` tool, properties included. When a page only points to another
  source (e.g. a library entry with a link), the original is followed and analysed,
  and the source status names both. Without a connected Notion server the status is
  `nicht erreichbar`, with a hint to connect it or export the page.
- Video, podcast and talk sources: the content must be read, so title, description
  and comments are not enough. Without a readable transcript the status is
  `nicht erreichbar` and the user is asked for a transcript file (`.txt`, `.vtt`,
  `.srt`); a transcript plus URL is analysed from the transcript with the URL as origin.
- `mcp__Notion__notion-fetch` and `mcp__notion__notion-fetch` in `allowed-tools`;
  `argument-hint` lists Notion links.
- "Source types" section in both READMEs, including how to adjust the Notion tool
  name when the server is named differently.

## [2.1.0] - 2026-10-04

### Added
- Configurable role: the "Deine Rolle" section now has a ⚙️ note and three fields,
  *Rolle*, *Expertise* and *Haltung*, that set the perspective and the yardstick for
  the top-3 selection. The note recommends 2–4 fields of expertise that cover the
  step-2 dimensions, and an explicit stance to avoid uncritical technology optimism.
- "Role" as the first item of the Configuration section in both READMEs.

### Changed
- The default role is now domain-neutral (expertise in AI applications, technology
  product development and organisational development) with a critical, delivery-oriented
  stance. It previously named education and public administration, which reflected
  the author's own context; that wording is kept in the READMEs as an example.
  To keep the old behaviour, put it back into the *Expertise* field.

## [2.0.0] - 2026-10-04

### Changed
- **Breaking:** the prompt moved from `use-case-discovery.md` to
  `.claude/commands/use-case-discovery.md` and is now a Claude Code custom slash
  command (`/use-case-discovery <source>`). The source is passed via `$ARGUMENTS`
  instead of the `[HIER URL / REPO / PAPER EINFÜGEN]` placeholder; without an argument
  the prompt asks for the source. Frontmatter pre-approves the read-only tools it
  needs (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`) so headless runs work.
  **Upgrading from 1.x:** copy the new file to `~/.claude/commands/` (or a project's
  `.claude/commands/`), then carry over your filled-in dimensions (step 2) and
  cross-inspiration sources (step 3) from your old copy. Scripts calling
  `claude -p use-case-discovery.md` or the `sed` pipe should switch to
  `claude -p "/use-case-discovery <source>"`.
- Notion tag in step 4 is now chosen from a fixed, configurable list of eight
  domain-neutral tags (exactly one per use case). New tags are never invented;
  when none fits, a new tag is proposed separately.

### Added
- Step 0 "Quelle erfassen": the source must actually be read before analysis. The
  output opens with a source status (`vollständig gelesen`, `teilweise gelesen`,
  `nicht erreichbar`) and stops when the source is unreachable instead of analysing
  from prior knowledge. Inferred statements in step 1 are marked *(Annahme)*.

### Removed
- The three documented usage modes (`/read`, `claude -p use-case-discovery.md`,
  `sed` substitution piped to `claude -p /dev/stdin`). `/read` is not a Claude Code
  command, and `claude -p <file>` passes the file name rather than its content.
- The usage section inside the prompt itself; usage is documented in the READMEs.

### Fixed
- Corrected the `[1.0.0]` entry below, which described the author's personal
  configuration as though it shipped with the prompt.

## [1.0.1] - 2026-09-28

### Changed
- Documentation now matches the shipped prompt: the context dimensions (A–G) and
  cross-inspiration sources are described as configurable placeholders rather than
  as fixed content. The author's own setup (Schulamt, city administration, AI working
  group, education, family, investments, making) is retained as a clearly labelled
  example configuration.
- Feature list no longer advertises a fixed count of 7 dimensions or names specific
  cross-inspiration projects (SIGMA v2.0, immoinvest) as if they were part of the
  template.
- Design rationale in both READMEs and in `use-case-discovery.md` reworded from
  "Why 7 dimensions?" to the general case, aligned with the prompt's own 4–8
  recommendation.

### Added
- "Configuration" section in both READMEs describing the two placeholder blocks that
  must be filled before first use.

## [1.0.0] - 2026-03-14

### Added
- Initial release of `use-case-discovery.md` prompt
- 5-step structured analysis framework (Tool Analysis → Use Case Matrix → Combinatorics → Top-3 → Open Questions)
- Seven placeholder context dimension slots (A–G), to be filled with the reader's own
  roles, organisations, and areas of life; the prompt recommends 4–8
- Combinatorics step with five placeholder cross-inspiration slots, to be filled with
  the reader's own frameworks, projects, technical components, hardware, and platforms
- Three usage modes: interactive Claude Code, file argument, bash substitution
- Bilingual README (English / German with Swiss spelling conventions)

> **Note** — this entry was corrected on 2026-10-04. As originally written it listed
> the author's personal configuration (Schulamt, city administration, AI working group,
> education, family, investments, making; SIGMA v2.0, immoinvest, MCP servers,
> Raspberry Pi, Notion) as though those dimensions and sources shipped with the prompt.
> They did not — 1.0.0 shipped placeholders throughout, and Notion appeared only as the
> tag field in step 4, never as a cross-inspiration source. See [1.0.1] for the
> corresponding correction in the READMEs.
