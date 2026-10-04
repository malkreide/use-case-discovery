# use-case-discovery

![Version](https://img.shields.io/badge/version-2.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-blueviolet)

> A structured Claude Code prompt for systematic use case discovery from GitHub repos, papers, and other technological sources — with combinatoric cross-inspiration across the professional and personal contexts you configure.

[🇩🇪 Deutsche Version](README.de.md)

---

## Overview

`use-case-discovery` is a prompt template for **Claude Code** that turns any GitHub repository, research paper, or technology tool into a structured use case analysis. It does not just ask "what can this do?" — it forces domain-independent abstraction first, then maps potential applications across several distinct context dimensions, and finally generates unexpected combinations through deliberate cross-pollination with your own existing frameworks and projects.

The prompt ships **unconfigured**: context dimensions and cross-inspiration sources are placeholders you fill with your own roles, organisations, and projects. See [Configuration](#configuration) — the prompt is not useful until you do this.

---

## Features

- **Source check first**: the source must actually be read; the output opens with a source status and stops if the source is unreachable
- **5-step structured analysis** from technical abstraction to actionable top-3 recommendations
- **Configurable context dimensions** (4–8 recommended) covering whatever roles and domains you operate in
- **Combinatorics step** forcing unexpected combinations with your own frameworks, projects, and infrastructure
- **Actionable output** with next steps constrained to 1-day effort and Notion tags from a fixed, configurable list
- **Claude Code slash command**: `/use-case-discovery <source>`, interactive or headless

---

## Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed
- A GitHub repository URL, paper link, or tool description as input

---

## Configuration

Before first use, fill in the two placeholder blocks in `.claude/commands/use-case-discovery.md` and check the tag list. All three are marked with a ⚙️ note in the prompt itself.

**1 — Context dimensions (step 2).** Replace `[NAME DIMENSION A]` … `[NAME DIMENSION G]` with your own roles, organisations, and areas of life. The count is not fixed — 4–8 dimensions work well. What matters is *contrast*: pick contexts with genuinely different constraints, stakeholders, and success criteria. The greater the distance between dimensions, the more productive the matrix.

**2 — Cross-inspiration sources (step 3).** Replace the `[NAME PROJEKT / FRAMEWORK]` entries with frameworks, projects, components, hardware, and platforms **you already have**. 3–6 entries, each with a one-sentence description of its core mechanism. The more concrete the description, the better the combinations.

**3 — Notion tags (step 4).** The prompt ships with a domain-neutral list of eight tags and assigns exactly one per top-3 use case; it never invents new ones, and proposes a new tag separately when none fits. Replace the list with the options of your Notion select property so the values match exactly. This block works unconfigured.

The prompt keeps its placeholders on purpose, so the repository stays reusable. Your filled-in version is personal — keep it in your own project rather than committing it back here.

---

## Usage / Quickstart

The prompt is a [Claude Code custom slash command](https://code.claude.com/docs/en/slash-commands): the source you pass is inserted via `$ARGUMENTS`.

### Install

Copy the file to one of the two command folders, then configure it (see [Configuration](#configuration)):

```bash
# Personal: available in every project (recommended, keeps your configuration private)
mkdir -p ~/.claude/commands && cp .claude/commands/use-case-discovery.md ~/.claude/commands/

# Project: available only in that project
mkdir -p /path/to/project/.claude/commands && cp .claude/commands/use-case-discovery.md /path/to/project/.claude/commands/
```

Inside this repository the command is available as-is, which is handy for trying the unconfigured template.

### Option A — Interactive

```
/use-case-discovery https://github.com/[username]/[repo]
```

Without an argument, Claude asks for the source first.

### Option B — Headless (scripts, batch runs)

```bash
claude -p "/use-case-discovery https://github.com/[username]/[repo]" > analysis.md
```

The command pre-approves the read-only tools it needs (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`), so headless runs are not blocked by permission prompts.

---

## Prompt Structure

| Step | Content |
|---|---|
| **0 — Source Check** | Read the source; report status: fully read, partially read, or unreachable (stop) |
| **1 — Tool Analysis** | Domain-independent abstraction of the core mechanism; inferences marked as assumptions |
| **2 — Use Case Matrix** | Your configured context dimensions, with targeted use cases per dimension |
| **3 — Combinatorics** | 2–3 unexpected combinations with your own frameworks/projects |
| **4 — Top-3 Recommendation** | Ranked by impact, feasibility, novelty — with next step and a Notion tag from the fixed list |
| **5 — Open Questions** | 3–5 generative questions for further research or discussion |

### Example configuration (A–G)

The prompt ships with seven empty slots, A–G. This is the author's own configuration — an illustration of the *kind* of contrast that makes the matrix work, not a default to adopt:

| Dim | Domain |
|---|---|
| A | Municipal School Office (Schulamt) |
| B | City administration (cross-departmental) |
| C | AI working group (public sector AI governance) |
| D | Schools & education (operational) |
| E | Private: children & family |
| F | Private: investments (real estate, ETF, crypto) |
| G | Private: technology & making (Raspberry Pi, MCP, Edge AI) |

Note the spread: A–D differ in scale and mandate within one professional context, E–G add private domains with entirely different success criteria. A tool that is unremarkable in one is often transformative in another.

---

## Design Rationale

**Why domain-independent abstraction first?**
The key to combinatorics is describing tools without their intended domain. "A document chat interface" becomes "context-bound state transformation with persistent memory" — and suddenly applications outside the original use case become visible.

**Why several dimensions instead of one?**
Real-world contexts have different constraints, stakeholders, and success criteria. A tool trivial in a technology context can be transformative in a public administration one — and vice versa. Fewer than four dimensions rarely produce that tension; more than eight tend to dilute it.

**Why read the source first?**
An analysis built on a source that was never read looks just as convincing as a real one. The source status shows what the analysis rests on, and stopping when the source is unreachable prevents a plausible but invented core description from carrying the whole matrix.

**Why a 1-day next step?**
Without an action anchor, idea generation stays academic. The 1-day constraint prevents perfectionism paralysis and turns insight into momentum.

---

## Project Structure

```
use-case-discovery/
├── .claude/
│   └── commands/
│       └── use-case-discovery.md   ← Main prompt as a slash command (copy, then configure)
├── README.md               ← This file
├── README.de.md            ← German version
├── CHANGELOG.md            ← Version history
└── LICENSE                 ← MIT License
```

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

---

## License

MIT License — see [LICENSE](LICENSE)

---

## Author

Hayal Oezkan · [GitHub](https://github.com/malkreide)
