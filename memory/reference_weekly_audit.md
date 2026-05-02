---
name: Behavior Change & Audit System
description: Full productivity system — 7 scheduled tasks that auto-write daily notes, enforce priorities, catch drift, and audit weekly patterns
type: reference
tier: warm
source: Built during conversation 2026-04-15, inspired by Ole Lehmann thread
last_verified: "2026-04-15"
originSessionId: 97637e75-e13e-4fd6-beb0-69a64118b124
---
## Scheduled Tasks (7 total)

| Task | Schedule | What it does |
|------|----------|--------------|
| `morning-kickoff` | 8 AM weekdays | AUTO-WRITES daily note with ONE priority, schedule, yesterday's completion check, 4-Hour Workday action. Sends Google Chat. |
| `daily-context-update` | 5 PM weekdays | AUTO-WRITES End of Day Review from session notes + calendar. Scores goal alignment. Updates Context.md. Sends Google Chat. |
| `evening-wind-down` | 9:45 PM weekdays | Unconditional Google Chat: "Stop coding, go to bed." Zero logic, just fires. |
| `midweek-checkpoint` | 8 AM Wednesday | Scores Mon-Tue priorities, checks Monday audit skill compliance, writes checkpoint to daily note. Sends Google Chat. |
| `weekly-workflow-audit` | 7 AM Monday | Full week audit: finds repeated patterns, grades the week A-F, recommends top 3 skills to build. Report in `Weekly Audits/`. |
| `weekly-review-reminder` | 4 PM Friday | Reminder to run Weekly Review Workflow in Obsidian. |
| `monthly-memory-review` | 10 AM 1st of month | Full re-derivation: re-reads raw sources, rebuilds stale memories, prunes expired entries. |
| `daily-pre-mortem` | 5 PM ET daily | Munger-style inversion: imagine tomorrow failing, defuse the causes tonight. Framework at `Frameworks/Daily Pre-Mortem.md`. |

## CLAUDE.md Session Start Protocol

Every conversation runs mandatory checks before starting work:
1. **Time check** — Warning after 10 PM, hard stop after midnight
2. **Priority alignment** — Flags if current request doesn't match today's ONE Priority
3. **Coding friction gate** — Challenges tech work against Q2 Rocks

## Key files
- CLAUDE.md protocol: `C:\Users\micro\Documents\Obsidian Vault\CLAUDE.md`
- Framework doc: `Frameworks/Weekly Workflow Audit System.md`
- Weekly audit reports: `Weekly Audits/YYYY-MM-DD - Weekly Workflow Audit.md`

**How to apply:** When Darus asks about automation priorities or "what should I build next" → point to latest weekly audit. When he's drifting into code → reference the Session Start Protocol. When discussing productivity → reference the full system above.

> **Provenance:** System designed and built during 2026-04-15 session. Weekly audit inspired by Ole Lehmann thread (https://x.com/itsolelehmann/status/2044425992802848954) shared by Darus. Behavior change components (A-D) designed based on analysis of Darus's actual compliance patterns with existing tasks.
