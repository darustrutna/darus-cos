---
name: chief-brain-github-sync
description: Sunday 11 AM ET — Sync Chief's brain (CLAUDE.md, memory, scheduled tasks) to darus-cos GitHub repo
---

You are Chief — weekly brain sync to GitHub.

**NO TIME GUARD.** This sync is idempotent and safe to run anytime. If nothing changed since last run, it no-ops cleanly. Do not skip on catch-up runs — a late sync is still a good sync. Just run it.

## Purpose
Mirror Chief's local identity (CLAUDE.md, memory files, scheduled task SKILL.md files) to the `darustrutna/darus-cos` GitHub repo for cloud redundancy and version history. **The job is not done until the commit is verified present on the GitHub remote.**

## Step 1: Copy files into the local repo

```bash
REPO="C:/Users/micro/Desktop/darus-cos"
MEM="C:/Users/micro/.claude/projects/C--Users-micro-Documents-Obsidian-Vault/memory"
VAULT="C:/Users/micro/Documents/Obsidian Vault"

# Constitution
cp "$VAULT/CLAUDE.md" "$REPO/CLAUDE.md"

# Memory (all .md and .json)
cp -r "$MEM/." "$REPO/memory/"

# Recurring scheduled-task SKILL.md files
mkdir -p "$REPO/skills/scheduled-tasks"
for task in morning-kickoff daily-context-update daily-pre-mortem evening-wind-down \
            midweek-checkpoint weekly-workflow-audit weekly-review-reminder \
            monthly-memory-review chief-brain-github-sync weekly-trust-reconciliation \
            weekly-vip-review morning-intel-brief; do
  cp "C:/Users/micro/.claude/scheduled-tasks/$task/SKILL.md" "$REPO/skills/scheduled-tasks/$task.md" 2>/dev/null
done
```

## Step 2: Detect changes

```bash
cd "C:/Users/micro/Desktop/darus-cos"
git status --porcelain
```

If output is EMPTY → no changes. Send the "no changes" ping (Step 5) and exit successfully.
If there ARE changes → continue.

## Step 3: Commit

```bash
cd "C:/Users/micro/Desktop/darus-cos"
git add -A
git commit -m "$(cat <<'EOF'
Weekly Chief brain sync — {YYYY-MM-DD}

Auto-sync of CLAUDE.md, memory files, and scheduled task SKILL.md files.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
EOF
)"
```

Capture the new local commit SHA:
```bash
LOCAL_SHA=$(git rev-parse HEAD)
echo "LOCAL_SHA=$LOCAL_SHA"
```

## Step 4: Push AND VERIFY (the critical part)

```bash
cd "C:/Users/micro/Desktop/darus-cos"
git push origin main 2>&1
echo "PUSH_EXIT=$?"
```

**Then verify the commit actually landed on GitHub.** Do not trust the push exit code alone — fetch the remote and compare SHAs:

```bash
cd "C:/Users/micro/Desktop/darus-cos"
git fetch origin main 2>&1
REMOTE_SHA=$(git rev-parse origin/main)
LOCAL_SHA=$(git rev-parse HEAD)
echo "LOCAL_SHA=$LOCAL_SHA"
echo "REMOTE_SHA=$REMOTE_SHA"
```

- If `LOCAL_SHA == REMOTE_SHA` → push verified. Send SUCCESS ping (Step 5).
- If `LOCAL_SHA != REMOTE_SHA` → **THE PUSH FAILED SILENTLY.** This is the exact failure mode this task exists to catch. Go to FAILURE handling.

## Step 5: Notify (only after verification)

SUCCESS (verified remote == local):
```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "Chief brain synced + VERIFIED on GitHub.\n\nCommit {SHORT_SHA} confirmed present on origin/main.\nhttps://github.com/darustrutna/darus-cos\n\nWhiteboard model holding. Machine is ephemeral; brain is in the cloud."}'
```

NO CHANGES (Step 2 empty):
```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "Chief brain sync ran — no changes since last sync. Remote already current. All clean."}'
```

## FAILURE handling (push failed OR SHAs mismatch OR any git error)

This must be LOUD. A silent backup failure is the whole problem.

1. Append to `C:\Users\micro\Documents\Obsidian Vault\_Backups\skipped-runs.log`:
   `{ISO timestamp} chief-brain-github-sync FAILED — local={LOCAL_SHA} remote={REMOTE_SHA} — {captured git error}`
2. Send the failure ping with the ACTUAL error text (not a placeholder):
```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "⚠️ CHIEF BRAIN SYNC FAILED — backup did NOT reach GitHub.\n\nLocal commit exists but origin/main does not match. Likely git auth (credential-manager headless) or network.\n\nError: {ACTUAL_ERROR}\n\nFix: open Claude Code on the desktop and run a manual push, or re-auth git. Your brain is committed locally but NOT backed up to the cloud until this is resolved."}'
```
3. Do NOT retry automatically. Do NOT report success. Darus must see the failure.

## Notes
- The repo is PUBLIC — only commit Chief identity, never customer data, API keys, or trust-account info.
- Force-pushes are forbidden. On conflict, escalate to Darus via the failure ping; do not resolve blindly.
- The success ping is a PROMISE that the remote matches local. Only send it after Step 4 verification passes.
