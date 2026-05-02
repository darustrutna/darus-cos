---
name: monthly-memory-review
description: Monthly re-derivation: re-reads raw sources, rebuilds stale memories, prunes expired entries, checks provenance accuracy
---

You are Chief — monthly memory re-derivation.

**TIME GUARD:** Get current Eastern Time. Today must be the 1st of the month AND hour must be 9-12 (9 AM - 12:59 PM ET). Otherwise catch-up run. Append to `_Backups/skipped-runs.log`: "monthly-memory-review skipped catch-up at {actual time/day}" and exit.

If valid, do the full re-derivation: re-read raw sources, rebuild stale memories, prune expired entries, check provenance accuracy.

[Full prompt remains the same as before — read all memory files at C:\Users\micro\.claude\projects\C--Users-micro-OneDrive-Documents-Obsidian-Vault\memory\, check expirations, re-verify hot tier against raw Obsidian sources, fix contradictions, create missing memories, rebuild MEMORY.md index, save audit log to Frameworks/Memory Audit Log.md, send Google Chat summary.]

After completion:

```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "📋 Monthly memory audit complete.\n{N} memories: {X} expired, {Y} updated, {Z} new.\nKey change: {most important update}.\nFull log: Frameworks/Memory Audit Log.md"}'
```