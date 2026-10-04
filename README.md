# use-case-discovery

![Version](https://img.shields.io/badge/version-3.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-blueviolet)

> A structured Claude Code skill for systematic use case discovery from GitHub repos, papers, and other technological sources — with combinatoric cross-inspiration across the professional and personal contexts you configure.

[🇩🇪 Deutsche Version](README.de.md)

---

## Overview

`use-case-discovery` is a **Claude Code skill** that turns any GitHub repository, research paper, or technology tool into a structured use case analysis. It does not just ask "what can this do?" — it forces domain-independent abstraction first, then maps potential applications across several distinct context dimensions, and finally generates unexpected combinations through deliberate cross-pollination with your own existing frameworks and projects.

Skill and configuration are separate: the skill holds the analysis logic, while your roles, dimensions, projects and tags live in a separate **profile**. Updating the skill leaves your profile untouched. Without a profile, the skill runs with neutral defaults and says so in the output: fine for a first try, too generic for real work.

The skill's instructions and output are in German (Swiss spelling).

---

## Features

- **Source check first**: the source must actually be read; the output opens with a source status and stops if the source is unreachable
- **Source types**: GitHub repos, papers and web pages, Notion pages (via a connected Notion MCP server), video and podcast transcripts, local files including PDFs
- **6-step structured analysis** from technical abstraction to actionable top-3 recommendations and export
- **Source is material, not instructions**: instructions inside the analysed source are not followed but flagged in the source status
- **Profile instead of placeholders**: role, guardrails, context dimensions, cross-inspiration and tags live in a file outside the skill
- **Configurable context dimensions** (4–8 recommended); a dimension without a plausible fit stays empty with a reason instead of being padded with filler ideas
- **Combinatorics step** forcing unexpected combinations with your own frameworks, projects, and infrastructure
- **Traceable selection**: the strongest candidates are scored in a table before the top 3, with a reason per row
- **Configurable guardrails** as exclusion criteria; every top-3 use case names its risks and prerequisites
- **Export**: the top 3 always appear as a YAML block; with `--notion` they are written to your Notion database after a duplicate check
- **Claude Code skill**: `/use-case-discovery <source>`, interactive or headless

---

## Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed
- A GitHub repository URL, paper link, or tool description as input
- For Notion sources and the Notion export: a connected Notion MCP server

---

## Installation

The skill is a folder with three files. Copy it into your personal skills folder (available in all projects) and create your profile:

```bash
mkdir -p ~/.claude/skills && cp -r .claude/skills/use-case-discovery ~/.claude/skills/
mkdir -p ~/.claude/use-case-discovery
cp .claude/skills/use-case-discovery/profil-vorlage.md ~/.claude/use-case-discovery/profil.md
```

For a single project, copy the folder to `/path/to/project/.claude/skills/` instead. Inside this repository the skill is available as-is, which is handy for trying it without a profile.

**Updating:** copy the skill folder again. The profile lives outside it and stays unchanged.

**Upgrading from 2.x:** delete `~/.claude/commands/use-case-discovery.md` (or the project copy), otherwise the command exists twice. Move your filled-in sections (role, guardrails, dimensions, cross-inspiration, tags) into the matching sections of `profil.md`; the template shows the format.

---

## Configuration: the profile

The profile is a Markdown file with up to six sections. Each is optional: a filled-in section fully replaces the skill's default of the same name, a missing one keeps the default. Entries with placeholders in square brackets are ignored. The template [`profil-vorlage.md`](.claude/skills/use-case-discovery/profil-vorlage.md) explains each section (in German).

The skill looks for the profile in three places; the first match wins:

1. The path in the environment variable `USE_CASE_DISCOVERY_PROFIL` (the value `keines` turns the profile off)
2. `.claude/use-case-discovery/profil.md` in the current project
3. `~/.claude/use-case-discovery/profil.md`

The second line of the output names the profile that was used.

**1 — Role (Rolle).** Three fields set the perspective the analysis is written from: *Rolle* (the viewpoint ideas are judged from), *Expertise* (2–4 fields, ideally covering your dimensions) and *Haltung* (how critical, risk-aware or experimental the assessment is). The author's earlier setting, for illustration: a strategic innovation advisor with expertise in AI applications, education, public administration, and technology product development.

**2 — Guardrails (Leitplanken).** Exclusion criteria that apply in your environment: a use case that violates one does not make the top 3. The default is domain-neutral (sensitive personal data, automated decisions about people, the source's licence); the template already contains it so it is not lost when you replace the section. 3–6 testable exclusions ("No …") are recommended. In the author's environment these would be, for example, the Zurich cantonal information and data protection act (IDG), the city's rules on AI use, and the protection of pupils' data.

**3 — Context dimensions (Kontextdimensionen).** Your roles, organisations, and areas of life, 4–8 of them. What matters is *contrast*: pick contexts with genuinely different constraints, stakeholders, and success criteria.

**4 — Cross-inspiration (Kreuzinspiration).** Frameworks, projects, components, hardware, and platforms **you already have**. 3–6 entries, each with a one-sentence description of its core mechanism.

**5 — Notion tags (Notion-Tags).** The options of your Notion select property, spelled exactly as in Notion. Each top-3 use case gets exactly one tag; new tags are never invented but proposed separately.

**6 — Notion export (Notion-Export).** Link to the Notion database and which property takes which value. Only needed for `--notion`.

---

## Usage

### Interactive

```
/use-case-discovery https://github.com/[username]/[repo]
```

Without an argument, Claude asks for the source first.

### Headless (scripts, batch processing)

```bash
claude -p "/use-case-discovery https://github.com/[username]/[repo]" > analysis.md
```

The skill pre-approves the read-only tools it needs (`WebFetch`, `Read`, `Glob`, `Grep`, `git clone`, Notion fetch and search) and the script that loads your profile, so headless runs don't get stuck on permission prompts.

### Notion export

```
/use-case-discovery https://github.com/[username]/[repo] --notion
```

With `--notion` and a database in the profile, the skill first reads the database, searches it for existing entries for each top-3 use case, and creates only new ideas. Existing pages are never changed or deleted. Without `--notion` the skill writes nothing to Notion; the YAML block at the end of every analysis is the record.

Writing (`notion-create-pages`) is deliberately **not** pre-approved: interactively you confirm each write. For headless runs, allow it explicitly:

```bash
claude -p "/use-case-discovery <source> --notion" --allowedTools "mcp__notion__notion-create-pages"
```

### Source types

| Source | How to pass it | Note |
|---|---|---|
| GitHub repo, paper, web page | URL | Read via WebFetch; repos are cloned to a temporary folder if needed |
| Notion page | Notion link | Needs a connected Notion MCP server. If the page only points to another source (e.g. a library entry), the original is analysed |
| Video, podcast, talk | Transcript file (`.txt`, `.vtt`, `.srt`), optionally followed by the URL | A URL alone is not enough: title and description are not the content |
| Local file, PDF, screenshot | Path | The most reliable way for long texts |

```
/use-case-discovery https://app.notion.com/p/…
/use-case-discovery talk-transcript.vtt https://youtu.be/…
```

**Secondary sources and multiple topics.** When a source reports on another work (a newsletter, blog post, or Notion copy about a repo or paper), the original is looked up and analysed. If it is not linked or not reachable, the status is at most `teilweise gelesen` and statements about it are marked as second-hand. When a source covers several unrelated topics, only the main topic is analysed (usually the one in the title); the others are listed for separate runs. To pick a different topic, name it after the source:

```
/use-case-discovery https://app.notion.com/p/… Thema: GitHub-Chatbot
```

**Notion tool name.** `allowed-tools` pre-approves `notion-fetch` and `notion-search` under the prefixes `mcp__Notion__` and `mcp__notion__`, i.e. for a Notion server called `Notion` or `notion`. If your server has a different name (check with `claude mcp list`), adjust the entries in `SKILL.md`; otherwise Claude asks for permission on each run, and headless runs cannot read Notion.

### Troubleshooting

**The profile line says the profile could not be loaded.** Check that `profil-laden.sh` in the skill folder is executable (`chmod +x ~/.claude/skills/use-case-discovery/profil-laden.sh`). Copying from a ZIP archive drops the executable bit.

---

## Prompt Structure

| Step | Content |
|---|---|
| **0 — Source Check** | Read the source; report status: fully read, partially read, or unreachable (stop); then the profile line |
| **1 — Tool Analysis** | Domain-independent abstraction of the core mechanism; inferences marked as assumptions |
| **2 — Use Case Matrix** | Your context dimensions from the profile, with targeted use cases per dimension; left empty with a reason when there is no plausible fit |
| **3 — Combinatorics** | 2–3 unexpected combinations with your own frameworks/projects |
| **4 — Top-3 Recommendation** | Scoring table of the 5–8 strongest candidates (impact, feasibility, novelty; 1–3), exclusion on a violated guardrail; top 3 with risks & prerequisites, next step and a Notion tag |
| **5 — Open Questions** | 3–5 generative questions for further research or discussion |
| **6 — Export** | Top 3 as a YAML block; with `--notion`, duplicate check and filing in the Notion database |

### Example: context dimensions in the profile

This is the author's own configuration — an illustration of the *kind* of contrast that makes the matrix work, not a default to adopt:

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

**Why a profile instead of filled-in placeholders?**
As long as the personal configuration sits in the same file as the analysis logic, every update means copying again and carrying settings over by hand. With a separate profile, an update is a folder swap, and the repository stays free of personal details.

**Why Notion only with `--notion`?**
Writing to a shared database is an action with external effect. It should be triggered deliberately, not as a side effect of every analysis. The duplicate check keeps the database clean and shows which ideas already exist in your own collection.

---

## Tests

A fixed set of ten test sources checks whether the skill's rules hold in a real run: source status, stopping on unreachable sources, secondary sources, multiple topics, prompt injection, the scoring table, guardrails, the profile and the export block. The tests run headless against the skill in this repository and never load your personal profile:

```bash
python3 tests/run_tests.py --offline   # local test sources only
python3 tests/run_tests.py             # all, including URLs
```

Cases, check levels and limits are described in [tests/README.md](tests/README.md) (German). A new rule in the skill starts with a test case that fails without it.

---

## Project Structure

```
use-case-discovery/
├── .claude/
│   └── skills/
│       └── use-case-discovery/     ← The skill (copy the whole folder)
│           ├── SKILL.md            ← Analysis logic and defaults
│           ├── profil-laden.sh     ← Loads your profile
│           └── profil-vorlage.md   ← Template for your profile
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
