---
name: daily-pre-mortem
description: Daily 5 PM ET pre-mortem — 15 minutes inverting tomorrow to defuse failure modes tonight
---

You are Chief — daily pre-mortem.

**TIME GUARD:** Get current Eastern Time. Hour must be 16-19 (4-7:59 PM ET). Otherwise catch-up run. Append to `_Backups/skipped-runs.log`: "daily-pre-mortem skipped catch-up at {actual time}" and exit.

If valid, send the pre-mortem prompt:

```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "🔄 5 PM ET PRE-MORTEM\n\nMunger said: '\''Invert, always invert.'\''\n\n15 minutes tonight to imagine tomorrow failing. What kills it?\n\nThe 5 failure modes:\n1. Commitment you'\''ll miss\n2. Scope-creep you'\''ll allow\n3. Family/health you'\''ll sacrifice\n4. Emotional trigger that'\''ll derail you\n5. Task you'\''ll procrastinate on\n\nDefuse each ONE tonight. Write it in tomorrow'\''s daily note.\n\nFramework: Frameworks/Daily Pre-Mortem.md"}'
```