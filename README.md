# use-case-discovery

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-blueviolet)

> A structured Claude Code prompt for systematic use case discovery from GitHub repos, papers, and other technological sources — with combinatoric cross-inspiration across public sector, education, and personal projects.

[🇩🇪 Deutsche Version](README.de.md)

---

## Overview

`use-case-discovery` is a prompt template for **Claude Code** that turns any GitHub repository, research paper, or technology tool into a structured use case analysis. It does not just ask "what can this do?" — it forces domain-independent abstraction first, then maps potential applications across seven distinct context dimensions, and finally generates unexpected combinations through deliberate cross-pollination with existing frameworks and projects.

The prompt was designed for a specific context (Swiss public administration, education, private investing, and maker projects) but the structure is fully adaptable to any multi-stakeholder environment.

---

## Features

- **5-step structured analysis** from technical abstraction to actionable top-3 recommendations
- **7 context dimensions** covering public sector, education, investment, and technology
- **Combinatorics step** forcing unexpected combinations with existing frameworks (SIGMA v2.0, immoinvest, MCP servers, Raspberry Pi)
- **Actionable output** with next steps constrained to 1-day effort and Notion tags for knowledge management
- **Three usage modes**: interactive, file argument, bash substitution

---

## Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed
- A GitHub repository URL, paper link, or tool description as input

---

## Usage / Quickstart

### Option A — Interactive in Claude Code

```
/read use-case-discovery.md
Source: https://github.com/[username]/[repo]
```

### Option B — As file argument

```bash
claude -p use-case-discovery.md
# Provide the URL when prompted
```

### Option C — With direct source substitution (Bash)

```bash
SOURCE="https://github.com/[username]/[repo]"
sed "s|\[HIER URL / REPO / PAPER EINFÜGEN\]|$SOURCE|" use-case-discovery.md | claude -p /dev/stdin
```

---

## Prompt Structure

| Step | Content |
|---|---|
| **1 — Tool Analysis** | Domain-independent abstraction of the core mechanism |
| **2 — Use Case Matrix** | 7 context dimensions (A–G) with targeted use cases per dimension |
| **3 — Combinatorics** | 2–3 unexpected combinations with existing frameworks/projects |
| **4 — Top-3 Recommendation** | Ranked by impact, feasibility, novelty — with next step and Notion tag |
| **5 — Open Questions** | 3–5 generative questions for further research or discussion |

### Context Dimensions (A–G)

| Dim | Domain |
|---|---|
| A | Municipal School Office (Schulamt) |
| B | City administration (cross-departmental) |
| C | AI working group (public sector AI governance) |
| D | Schools & education (operational) |
| E | Private: children & family |
| F | Private: investments (real estate, ETF, crypto) |
| G | Private: technology & making (Raspberry Pi, MCP, Edge AI) |

---

## Design Rationale

**Why domain-independent abstraction first?**
The key to combinatorics is describing tools without their intended domain. "A document chat interface" becomes "context-bound state transformation with persistent memory" — and suddenly applications outside the original use case become visible.

**Why 7 dimensions?**
Real-world contexts have different constraints, stakeholders, and success criteria. A tool trivial in dimension G (technology) can be transformative in dimension A (public administration) — and vice versa.

**Why a 1-day next step?**
Without an action anchor, idea generation stays academic. The 1-day constraint prevents perfectionism paralysis and turns insight into momentum.

---

## Project Structure

```
use-case-discovery/
├── use-case-discovery.md   ← Main prompt (copy this into your Claude Code project)
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

Hayal Küey · [GitHub](https://github.com/malkreide)
