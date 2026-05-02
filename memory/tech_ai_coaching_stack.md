---
name: AI Coaching Tech Stack — Grok Voice API + Telnyx
description: Grok Voice API is the LLM for Rentor Scale Sales Call AI Coaching. Reads transcription from Telnyx (voice provider).
type: tech
tier: warm
source: Darus decision 2026-04-17
last_verified: "2026-04-17"
originSessionId: 97637e75-e13e-4fd6-beb0-69a64118b124
---
## The Stack

```
Sales agent makes outbound call via Rentor Voice (Telnyx)
  ↓
Telnyx records + transcribes the call
  ↓
Transcript stored in Supabase (scale schema)
  ↓
Grok Voice API reads the transcript
  ↓
Returns 3-5 coaching insights
  ↓
Displayed in Rentor Scale on the call record
```

## Why Grok Voice API

- Darus decided 2026-04-17 to TEST Grok Voice API for the LLM layer of AI Coaching
- Reference: https://x.com/xai/status/2045297699352924504
- Not locked in yet — this is the first test. Can swap to Claude/GPT later if results are weak.

## Build Location

- App: `apps/scale/` (Rentor Scale)
- Edge function: `apps/edge-functions/scale-ai-coach/` (new Saturday 2026-04-18)
- Table: `scale.call_coaching_insights` (new)

## NARPM Demo Readiness

- This is Killer Feature #2 for NARPM April 28
- MVP must ship Saturday 2026-04-18
- "Done" = real call transcript → real coaching insights → displayed in Scale UI

## Dependencies Status

- ✅ Telnyx voice provider wired (confirmed 2026-04-14)
- ✅ AI Voice Agents set up on Rentor Scale (confirmed 2026-04-16 by Darus)
- 🟡 Call transcription storage — need to verify in Saturday build
- 🔴 Grok Voice API integration — build Saturday

**How to apply:** When Darus opens AI Coaching build session Saturday, the LLM call should use Grok Voice API (not Claude Haiku, which was Chief's original suggestion). The prompt/scope stays the same. Only the model endpoint changes.

> **Provenance:** Darus stated 2026-04-17 evening: "We'll be testing Grok Voice API for the LLM to perform the Sales Call AI Coaching (as it will read the transcription from Telnyx)." Linked xAI announcement: https://x.com/xai/status/2045297699352924504
