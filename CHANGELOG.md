# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- **Breaking:** the prompt moved from `use-case-discovery.md` to
  `.claude/commands/use-case-discovery.md` and is now a Claude Code custom slash
  command (`/use-case-discovery <source>`). The source is passed via `$ARGUMENTS`
  instead of the `[HIER URL / REPO / PAPER EINFÜGEN]` placeholder; without an argument
  the prompt asks for the source. Frontmatter pre-approves the read-only tools it
  needs (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`) so headless runs work.
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
