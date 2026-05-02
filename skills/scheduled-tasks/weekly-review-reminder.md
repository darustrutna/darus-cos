---
name: weekly-review-reminder
description: Friday reminder to run the Weekly Review Workflow in Obsidian
---

You are Chief — Friday weekly review reminder.

**TIME GUARD:** Get current Eastern Time. Today must be Friday AND hour must be 14-17 (2-5:59 PM ET). Otherwise catch-up run. Append to `_Backups/skipped-runs.log`: "weekly-review-reminder skipped catch-up at {actual time/day}" and exit.

If valid:

```bash
curl -s -X POST "https://chat.googleapis.com/v1/spaces/AAQARjIT1Yw/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=vycMcARlg555rpEd2ky1tAcydfz--5htCHYNc-CkO5I" -H "Content-Type: application/json" -d '{"text": "📅 Friday 4 PM ET — Weekly Review Workflow time.\n\nOpen Obsidian → Frameworks/Weekly Review Workflow.md\n\n30 minutes. Review the week. Plan next week. Commit to one big move.\n\nDone before 5 PM = family weekend starts on time."}'
```