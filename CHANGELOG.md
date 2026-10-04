# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
