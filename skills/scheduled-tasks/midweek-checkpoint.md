---
name: midweek-checkpoint
description: Wednesday 8 AM: scores Mon-Tue priorities, checks Monday audit compliance, adds checkpoint to daily note
---

You are Chief — mid-week checkpoint.

**TIME GUARD:** Get current Eastern Time. Today must be Wednesday AND hour must be 6-10 (6-10:59 AM ET). Otherwise it's a catch-up run. Append to log at `_Backups/skipped-runs.log`: "midweek-checkpoint skipped catch-up at {actual time/day}" and exit.

If valid time, proceed:

## Step 1: Gather Data

1. Most recent weekly audit: glob `Weekly Audits/*.md`, read the most recent
2. Monday's and Tuesday's daily notes
3. Today's daily note (Wednesday)
4. Session notes from Mon-Tue: `Sessions/{date}*.md`
5. Priorities memory

## Step 2: Score the Half-Week

- Priorities completed: X/2 (only count `[x]`)
- EOD reviews populated: X/2
- Monday audit's #1 skill: BUILT / STARTED / NOT STARTED (search session notes)
- Q2 Rock hours Mon-Tue
- Tech/coding hours Mon-Tue

## Step 3: Verdict

- ON TRACK: both priorities done, Rock hours > tech hours, audit skill at least started
- COURSE CORRECT: anything else (be specific about what to fix Thu-Fri)

## Step 4: Write Checkpoint to Wednesday's Daily Note

Insert `## Mid-week Checkpoint` after `## Context`:

```markdown
## Mid-week Checkpoint

| Metric | Mon | Tue | Total |
|--------|-----|-----|-------|
| ONE Priority done | {✅/❌} | {✅/❌} | {X}/2 |
| EOD review filled | {✅/❌} | {✅/❌} | {X}/2 |

**Monday audit's #1 skill:** "{skill}" — {BUILT / STARTED / NOT STARTED}

**Hours this week:**
- Q2 Rock work: ~{N}h
- Tech/coding: ~{N}h

**Verdict: {ON TRACK / COURSE CORRECT}**

> {Blunt coaching sentence.}
```

## Step 5: Send Google Chat

```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "MID-WEEK CHECK:\nPriorities: {X}/2 done\nRock hours: ~{N}h | Tech hours: ~{N}h\nMonday audit skill ({name}): {status}\n{VERDICT}: {one-line coaching}"}'
```