# darus-cos — Darus's Chief of Staff

This repo is the version-controlled backup of Chief — the AI Chief of Staff that runs Darus's executive operating system across local Claude Code + cloud Claude Routines.

## Structure

```
darus-cos/
├── CLAUDE.md                    # The constitution. Operating principles, Session Start Protocol, working style.
├── memory/                      # Chief's persistent knowledge — read every session.
│   ├── MEMORY.md                # Index of all memories (HOT / WARM / COLD tiers)
│   ├── user_*.md                # Identity, profile, family
│   ├── feedback_*.md            # Coaching style, CoS mode, behavioral frameworks
│   ├── project_*.md             # Active projects (Rentor priorities, NARPM, DarusTech)
│   ├── team_*.md                # Team rosters and roles
│   ├── brand_*.md               # Brand decisions (Workspace > One > OS hierarchy)
│   ├── strategy_*.md            # Strategic conviction (positioning, pricing)
│   ├── tech_*.md                # Technical architecture references
│   └── reference_*.md           # System documentation
├── skills/
│   └── scheduled-tasks/         # Backup of all recurring Chief routines
│       ├── morning-kickoff.md
│       ├── daily-context-update.md
│       ├── daily-pre-mortem.md
│       ├── evening-wind-down.md
│       ├── midweek-checkpoint.md
│       ├── weekly-workflow-audit.md
│       ├── weekly-review-reminder.md
│       └── monthly-memory-review.md
├── context/                     # Active context for Claude Routines (cloud)
└── outputs/                     # Where cloud routines write reports
```

## How Chief Operates

**Local (this machine):**
- CLAUDE.md is read at every Claude Code session
- Memory files in `~/.claude/projects/{project}/memory/` are loaded by tier
- Scheduled tasks fire on cron via `~/.claude/scheduled-tasks/{taskId}/SKILL.md`

**Cloud (Anthropic infrastructure):**
- Claude Routines run against this GitHub repo
- Daily NARPM Countdown + Monday Weekly Audit
- Routines write reports back to this repo via `outputs/`

## Why This Repo Exists

Three reasons:
1. **Backup** — if local machine fails, Chief can be rebuilt from this repo
2. **Version control** — Chief's evolution is git history
3. **Cloud routines source** — Anthropic's Claude Routines need a public repo to clone

## Recovery: Rebuild Chief on a New Machine

1. Clone this repo somewhere local
2. Copy `CLAUDE.md` to vault root
3. Copy `memory/*` to `~/.claude/projects/{project-name}/memory/`
4. Copy `skills/scheduled-tasks/*.md` to `~/.claude/scheduled-tasks/{taskId}/SKILL.md`
5. Re-create Google Chat webhook references (URL is in MEMORY.md)
6. Re-link scheduled tasks via `mcp__scheduled-tasks__create_scheduled_task`

## Sync Cadence

This repo should be updated:
- **After major framework additions** (new memory tiers, new operating principles)
- **After scheduled task changes** (new tasks, prompt updates)
- **Weekly minimum** — push memory state for safety

Most easily done by Claude Code itself: "Hey Chief, sync the brain to GitHub."

## Architecture Reference

See `Frameworks/Chief's Brain Map.md` in the Obsidian vault for the full system architecture, backup strategy, and recovery scenarios.

---

*Last manual sync: 2026-05-02 — post-OneDrive migration. First full Chief brain backup.*
