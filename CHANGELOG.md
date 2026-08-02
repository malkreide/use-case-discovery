# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
- 7 context dimensions covering Schulamt, city administration, AI working group, education, family, investments, and making/technology
- Combinatorics step with SIGMA v2.0, immoinvest, MCP servers, Raspberry Pi, and Notion as cross-inspiration sources
- Three usage modes: interactive Claude Code, file argument, bash substitution
- Bilingual README (English / German with Swiss spelling conventions)
