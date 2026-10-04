# use-case-discovery

![Version](https://img.shields.io/badge/version-2.4.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-blueviolet)

> A structured Claude Code prompt for systematic use case discovery from GitHub repos, papers, and other technological sources — with combinatoric cross-inspiration across the professional and personal contexts you configure.

[🇩🇪 Deutsche Version](README.de.md)

---

## Overview

`use-case-discovery` is a prompt template for **Claude Code** that turns any GitHub repository, research paper, or technology tool into a structured use case analysis. It does not just ask "what can this do?" — it forces domain-independent abstraction first, then maps potential applications across several distinct context dimensions, and finally generates unexpected combinations through deliberate cross-pollination with your own existing frameworks and projects.

The prompt ships **unconfigured**: context dimensions and cross-inspiration sources are placeholders you fill with your own roles, organisations, and projects. See [Configuration](#configuration). Unconfigured, the prompt runs with three neutral fallback dimensions and says so in the output: fine for a first try, too generic for real work.

---

## Features

- **Source check first**: the source must actually be read; the output opens with a source status and stops if the source is unreachable
- **Source types**: GitHub repos, papers and web pages, Notion pages (via a connected Notion MCP server), video and podcast transcripts, local files including PDFs
- **5-step structured analysis** from technical abstraction to actionable top-3 recommendations
- **Source is material, not instructions**: instructions inside the analysed source are not followed but flagged in the source status
- **Configurable context dimensions** (4–8 recommended) covering whatever roles and domains you operate in; a dimension without a plausible fit stays empty with a reason instead of being padded with filler ideas
- **Combinatorics step** forcing unexpected combinations with your own frameworks, projects, and infrastructure
- **Traceable selection**: the strongest candidates are scored in a table before the top 3, with a reason per row
- **Configurable guardrails** as exclusion criteria; every top-3 use case names its risks and prerequisites
- **Actionable output** with next steps constrained to 1-day effort and Notion tags from a fixed, configurable list
- **Claude Code slash command**: `/use-case-discovery <source>`, interactive or headless

---

## Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed
- A GitHub repository URL, paper link, or tool description as input

---

## Configuration

Before first use, fill in the two placeholder blocks in `.claude/commands/use-case-discovery.md` and check the role, the guardrails and the tag list. All five are marked with a ⚙️ note in the prompt itself.

**1 — Role.** Three fields set the perspective the analysis is written from: *Rolle* (the viewpoint ideas are judged from), *Expertise* (2–4 fields, ideally covering your dimensions from step 2) and *Haltung* (how critical, risk-aware or experimental the assessment is). The shipped default is domain-neutral and works unconfigured. The author's earlier setting, for illustration: a strategic innovation advisor with expertise in AI applications, education, public administration, and technology product development.

**2 — Guardrails (Leitplanken).** Exclusion criteria that apply in your environment: a use case that violates one does not make the top 3. It may still appear in steps 2 and 3 if the condition under which it would comply is named. The shipped default is domain-neutral (sensitive personal data, automated decisions about people, the source's licence) and works unconfigured. 3–6 testable exclusions ("No …") are recommended. In the author's environment these would be, for example, the Zurich cantonal information and data protection act (IDG), the city's rules on AI use, and the protection of pupils' data.

**3 — Context dimensions (step 2).** Replace `[NAME DIMENSION A]` … `[NAME DIMENSION G]` with your own roles, organisations, and areas of life. The count is not fixed — 4–8 dimensions work well. What matters is *contrast*: pick contexts with genuinely different constraints, stakeholders, and success criteria. The greater the distance between dimensions, the more productive the matrix.

**4 — Cross-inspiration sources (step 3).** Replace the `[NAME PROJEKT / FRAMEWORK]` entries with frameworks, projects, components, hardware, and platforms **you already have**. 3–6 entries, each with a one-sentence description of its core mechanism. The more concrete the description, the better the combinations.

**5 — Notion tags (step 4).** The prompt ships with a domain-neutral list of eight tags and assigns exactly one per top-3 use case; it never invents new ones, and proposes a new tag separately when none fits. Replace the list with the options of your Notion select property so the values match exactly. This block works unconfigured.

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

Inside this repository the command is available as-is, which is handy for trying the unconfigured template. It works with neutral fallback dimensions and says so in the output.

### Option A — Interactive

```
/use-case-discovery https://github.com/[username]/[repo]
```

Without an argument, Claude asks for the source first.

### Option B — Headless (scripts, batch runs)

```bash
claude -p "/use-case-discovery https://github.com/[username]/[repo]" > analysis.md
```

The command pre-approves the read-only tools it needs (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`, Notion fetch), so headless runs are not blocked by permission prompts.

### Source types

| Source | How to pass it | Note |
|---|---|---|
| GitHub repo, paper, web page | URL | Read via WebFetch; repos may be cloned to a temporary folder |
| Notion page | Notion link | Needs a connected Notion MCP server. If the page only points to another source (e.g. a library entry), the original is analysed |
| Video, podcast, talk | Transcript file (`.txt`, `.vtt`, `.srt`), optionally followed by the URL | A URL alone is not enough: title and description are not the content |
| Local file, PDF, screenshot | Path | The safest way to pass long text |

```
/use-case-discovery https://app.notion.com/p/…
/use-case-discovery talk-transcript.vtt https://youtu.be/…
```

**Secondary sources and multiple topics.** When a source reports on another work (a newsletter, blog post or Notion copy about a repo or paper), the original is looked up and analysed. If it is not linked or not reachable, the status is at most `teilweise gelesen` and claims about it are marked as second-hand. When a source covers several unrelated topics, only the main topic (usually the one in the title) is analysed and the others are listed for separate runs. To pick a different topic, name it after the source:

```
/use-case-discovery https://app.notion.com/p/… Thema: GitHub-Chatbot
```

**Notion tool name.** `allowed-tools` pre-approves `mcp__Notion__notion-fetch` and `mcp__notion__notion-fetch`, the names a Notion server gets when it is called `Notion` or `notion`. If your server has a different name (check with `claude mcp list`), adjust the entry to `mcp__<server-name>__notion-fetch`; otherwise Claude asks for permission on each run, and headless runs cannot read Notion.

---

## Prompt Structure

| Step | Content |
|---|---|
| **0 — Source Check** | Read the source; report status: fully read, partially read, or unreachable (stop) |
| **1 — Tool Analysis** | Domain-independent abstraction of the core mechanism; inferences marked as assumptions |
| **2 — Use Case Matrix** | Your configured context dimensions, with targeted use cases per dimension; left empty with a reason when there is no plausible fit |
| **3 — Combinatorics** | 2–3 unexpected combinations with your own frameworks/projects |
| **4 — Top-3 Recommendation** | Scoring table of the 5–8 strongest candidates (impact, feasibility, novelty; 1–3), exclusion on a violated guardrail; top 3 with risks & prerequisites, next step and a Notion tag from the fixed list |
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

**Why may a dimension stay empty?**
Demanding ideas in every dimension produces filler in the ill-fitting ones, and filler sounds just as convincing as the good ideas. "No plausible fit", with a reason, is an honest statement about a tool's reach.

**Why a scoring table before the top 3?**
Without visible scoring the selection can be neither checked nor discussed. The table shows which candidates were in the running and why. Novelty is marked as an assumption because it is estimated without research.

**Why guardrails?**
A critical stance alone does not stop an impressive but impermissible idea from landing in first place. Guardrails turn the limits that already apply in your environment into a checkable part of the selection.

**Why a 1-day next step?**
Without an action anchor, idea generation stays academic. The 1-day constraint prevents perfectionism paralysis and turns insight into momentum.

---

## Tests

A fixed set of nine test sources checks whether the prompt's rules hold in a real run: source status, stopping on unreachable sources, secondary sources, multiple topics, prompt injection, the scoring table and guardrails. The tests run headless against the template in this repository:

```bash
python3 tests/run_tests.py --offline   # local test sources only
python3 tests/run_tests.py             # all, including URLs
```

Cases, check levels and limits are described in [tests/README.md](tests/README.md) (German). A new rule in the prompt starts with a test case that fails without it.

---

## Project Structure

```
use-case-discovery/
├── .claude/
│   └── commands/
│       └── use-case-discovery.md   ← Main prompt as a slash command (copy, then configure)
├── tests/
│   ├── fixtures/           ← Local test sources
│   ├── run_tests.py        ← Test run and checks
│   └── README.md           ← Cases and procedure (German)
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
