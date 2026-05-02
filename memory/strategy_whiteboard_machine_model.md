---
name: The Whiteboard Machine Model
description: Darus runs a distributed-storage model. Local machine is ephemeral compute. Don't recommend whole-machine backup tools.
type: strategy
tier: warm
source: Darus's pushback on Backblaze recommendation 2026-05-02
last_verified: "2026-05-02"
---

## The Architecture Decision

Darus runs a **distributed durability model** where:
- Local machine = ephemeral compute layer (replaceable)
- All durable data = lives in cloud services (each tool does one job)

## What Lives Where (Authoritative)

| Data | Durable storage |
|------|----------------|
| Vault | Obsidian Sync |
| Code | GitHub |
| Chief brain | darus-cos GitHub |
| Important docs | Google Drive (manual save) |
| Photos/music | Phone cloud / streaming |
| Browser state | Chrome account sync |

## What Chief Should NOT Recommend

- ❌ **Backblaze** or any whole-machine backup
- ❌ **Time Machine / File History** style backups
- ❌ **Local-only redundancy** strategies
- ❌ Anything that treats the machine as the source of truth

## What Chief SHOULD Recommend (When Topic Comes Up)

- ✅ Commit + push discipline (frequent git pushes)
- ✅ Move important files to a durable cloud location BEFORE the machine fails
- ✅ Pick the right cloud tool for the data type (don't mix)
- ✅ Periodic sync of Chief brain to darus-cos repo

## Why This Matters

This is the 3 A's filter applied to infrastructure. Adding more backup layers = activity, not outcome. The right architecture is fewer tools doing one job each, not more tools doing the same job redundantly.

When in doubt: ask "is this data already durable in the cloud?" If yes, no extra backup needed.

> **Provenance:** Darus pushed back on Chief's Backblaze recommendation on 2026-05-02 with the argument: "the computer itself is just kind of a whiteboard." Chief audited the recommendation against the existing tool stack and confirmed Backblaze added zero unique coverage. Decision documented in `Frameworks/Chief's Brain Map.md`.
