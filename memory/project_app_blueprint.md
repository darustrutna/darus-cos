---
name: Rentor App Blueprint — Product Strategy Source of Truth
description: The product/market/monetization/tech blueprint for Rentor Workspace. Source: APP_BLUEPRINT.md in the MonoRepo, dated 2026-05-02.
type: project
tier: hot
source: APP_BLUEPRINT.md from C:\Users\micro\Desktop\DarusTech\- - - Rentor MonoRepo, read 2026-05-02
last_verified: "2026-05-02"
---

## What This Is
Rentor Workspace — vertical operating system for residential & small-commercial property management companies. PM-vertical SaaS. Coexists with AppFolio (decorator → substrate strategy), bundles 25 apps, monetizes via tiered subscriptions.

## The Wedge (Memorize This)
> "AppFolio is a substrate, not a competitor. Decorate, don't replace, until we earn the right to migrate."

Conversion driver = AppFolio Workspace Chrome extension (F1). Free for solo operators, paid for teams. Trojan horse distribution play.

## ICP
- **Primary:** PM operators with 200–5,000 doors on AppFolio/Buildium/Rent Manager
- **Secondary:** 3rd-party PM franchises needing multi-tenant ops layer

## Pricing (per PM company, billed monthly, annual −15%)
| Tier | Doors | Price | Includes |
|---|---|---|---|
| Starter | ≤ 250 | $249/mo | Workspace ext, Tasks, Inbox, Roadmap |
| Pro | ≤ 1,000 | $899/mo | + Accounting, Scale CRM, Maps, Voice (5 lines), Process |
| Scale | ≤ 3,000 | $2,499/mo | + Summit (HR), Vault, Overwatch, AIAgents, 25 voice lines |
| Enterprise | 3,000+ | ~$0.85/door + $1,500 platform | All apps, SLA, dedicated CSM |

## MVP Conversion-Critical Features (5)
1. **F1: AppFolio Workspace** (Chrome extension) — conversion driver
2. **F2: Trust Accounting Three-Way Recon** — depends on Rentor's own dogfooding (trust reconciliation must be current)
3. **F3: Tasks + Inbox** (cross-app inbox)
4. **F4: Scale CRM** (owner-leads pipeline)
5. **F5: Process** (workflow engine)

**Trial conversion gate:** First successful three-way reconciliation. Don't gate by feature; gate by pain-relief moment.

## Revenue Math
| Customers | Mix (S/P/Sc/E) | MRR | ARR |
|---|---|---|---|
| 10 | 5/3/2/0 | $9.2K | $111K |
| 50 | 20/20/8/2 | $58.9K | $707K |
| 200 | 70/85/35/10 | $268.9K | $3.23M |
| 1,000 | 300/450/200/50 | $1.49M | **$17.94M** |

**Goal:** $20M+ ARR by EOY 2028. Blueprint SOM 24 mo = $13M. Need to hit ~75% of SOM in 24 mo, then scale 50%+ in last 8 mo.

## Tech Stack (Stable)
- Frontend: Vite + React 19 + Tailwind v4 (most apps), Next.js 16 (`apps/one`)
- Backend: Supabase Edge Functions (Deno) per app
- DB: Supabase Postgres + RLS, multi-tenant via `roadmap_tenants`
- AI: Claude (Opus 4.7 = Rooney; Haiku 4.5 = classifiers); OpenAI fallback
- Voice: Telnyx WebRTC + Twilio fallback
- Email: Resend (transactional)
- Payments: Stripe Billing + Plaid (ACH)
- Hosting: Firebase Hosting (`web.app` per app) + Netlify
- Monitoring: Overwatch (`apps/overwatch`, TimescaleDB) + Sentry

## Build Sequence (4-Week Public Launch Push)
- **Week 1:** Stripe billing + marketing site + PostHog. Milestone = signup → checkout works.
- **Week 2:** Onboarding rails + extension install detection + AppFolio sync. Milestone = new org reaches first_recon in <30 min unaided.
- **Week 3:** Trial-to-paid prompts + billing portal + viral loops (statement footer, Rooney share-link). Milestone = 3 paying customers.
- **Week 4:** Status page + SOC 2 readiness + Product Hunt launch. Milestone = 500 extension installs + 25 paid trials in 14 days.

## Critical Risks (Chief Is Watching)
1. **Trust reconciliation deferred 23+ days** — F2's case study depends on Rentor's own books being current. The Wednesday weekly ping is a launch dependency now.
2. **Chrome Web Store submission deferred** — 7-day review minimum. Must start Monday May 4 or Product Hunt launch fails.
3. **Distribution = real bottleneck** — Product is 70% built, distribution is 10%. Daily content + Reddit + LinkedIn ABM all require operators (not Darus).
4. **Schema debt** — Accounting in `public.*` with `appfolio_` prefix. Refactor before 100+ customers, not after.

## Operating Principles (From Blueprint)
1. **Ship vertical, not horizontal.** Pick one PM workflow and finish it.
2. **AppFolio is substrate, not competitor.** Decorate, don't replace.
3. **RLS first, app-layer auth second.** Every table has RLS in its creation migration.
4. **Edits to edge functions go in `apps/edge-functions/` only.** `supabase/functions/` is a sync target.
5. **One `@rentor.com` SSO across the suite.**
6. **Living roadmaps over tickets.** `*_ROADMAP.md` files updated in the same PR that ships.

## Distribution Strategy (From Blueprint)
1. **0–10 customers:** Founder-led to Darus's PM network. Free Scale tier as design partners (Mark Cropper from NARPM fits this).
2. **10–30:** NARPM Slack + r/PropertyManagement. Workspace extension as Trojan horse.
3. **30–100:** Content + paid (LinkedIn ABM to Director of Operations / Controller titles, 200–3K-door PM companies).

## Viral Loops
1. Workspace extension forwarding (each team member install → invite to org)
2. Owner-statement PDF "Powered by Rentor" footer + share link
3. Rooney AI share-link (public read-only URL with redaction)

## How to Apply
When Darus brings up:
- **Product feature decisions** → check it against MVP conversion-critical 5 (F1–F5). If not in there, defer.
- **Pricing questions** → reference the tier math here, plus `strategy_pricing_principle.md`.
- **Tech stack debates** → the stack is locked per blueprint. Debate scope, not stack.
- **Distribution / marketing** → push back on Founder Mode work; demand Alden/Brittany/contractor ownership.
- **Trust reconciliation** → it's now a launch dependency, not just operational. Apply Dreamer Protocol urgency.

> **Provenance:** Read on 2026-05-02 from APP_BLUEPRINT.md in the Rentor MonoRepo. Full strategic memo at `RentorOS/App Blueprint - Chief's Strategic Memo.md`. Update this memory file whenever the blueprint evolves (re-read and re-extract).
