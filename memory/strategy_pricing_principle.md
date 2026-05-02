---
name: Rentor Workspace Pricing Principle
description: Half the price of a competitor, 5x cost in margin. Validated heuristic from Darus post-NARPM.
type: strategy
tier: warm
source: Darus's NARPM debrief 2026-05-01
last_verified: "2026-05-01"
originSessionId: 97637e75-e13e-4fd6-beb0-69a64118b124
---
## The Principle

> "Goal is to have our pricing be half as much but still have us earning five times our costs."

In practice this means:
- **50% of competitor pricing** (Appfolio, Edge, Haven, RentVine reference points)
- **5x markup over Rentor's COGS** (AI API costs, infrastructure, support)
- Therefore: COGS must be ≤ 10% of revenue

## Why This Works

1. **Beats competitors on price** without being a discount brand
2. **5x margin** maintains 80%+ gross margin (matches the business plan target)
3. **Forces architectural discipline** — high-cost features kill the model

## What This Means for Tier Math

| Tier | Competitor Reference | Rentor Price | Implied Max COGS |
|------|---------------------|--------------|------------------|
| Starter | $1,000-2,000/mo | $500-1,000/mo | $100-200/mo |
| Professional | $2,000-6,000/mo | $1,000-3,000/mo | $200-600/mo |
| Enterprise | $6,000-20,000/mo | $3,000-10,000/mo | $600-2,000/mo |

## Critical Cost Items to Track

1. **Grok / Claude / OpenAI API costs** per call coached
2. **Telnyx voice minutes** per outbound campaign
3. **Supabase / hosting** per active door under management
4. **Support time** (this is the killer — must be < 10% of revenue)

## Risk Flags

- 🚩 If Edge or Haven undercut us by going to 25% of Appfolio → we're in price war territory
- 🚩 If LLM API costs spike (model price increases) → margin compresses fast
- 🚩 If support scales linearly with doors instead of being architected to be self-serve → COGS exceeds 10%

## How to Apply (Chief's Coaching Note)

When pricing decisions come up:
1. First question: "What's the competitor reference price?" Half of that is the ceiling.
2. Second question: "What's our COGS to deliver this?" 5x that is the floor.
3. If those two numbers don't intersect → either the feature is too expensive to build, or the competitor is mispriced. Investigate.

When Darus considers adding a feature, ask: "Will this push COGS above 10% of revenue at our pricing? If yes, we need to architect it differently."

> **Provenance:** Darus's pricing gut, captured in the NARPM 2026 doc on 2026-05-01: "Goal is to have our pricing be half as much but still have us earning five times our costs."
