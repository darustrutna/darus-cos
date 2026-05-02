---
name: Rentor Tech Stack & Architecture
description: Complete technical reference for the Rentor monorepo, all apps, deployment, and Supabase setup
type: reference
tier: cold
source: Built across sessions 2026-04-12 through 2026-04-14
last_verified: "2026-04-14"
originSessionId: 97637e75-e13e-4fd6-beb0-69a64118b124
---
## Monorepo

Location: `C:\Users\micro\OneDrive\Desktop\DarusTech\- - - Rentor MonoRepo`
GitHub: `https://github.com/Rentor-CA/rentor-monorepo`
Build system: Nx
Package manager: npm

## Supabase

Project: RentorOS
Project ID: `opdnbjdhvxxayeomvufg`
URL: `https://opdnbjdhvxxayeomvufg.supabase.co`
Region: us-east-1
All apps share this single Supabase project.

### Key Tables
- `public.scratchpads` — Per-user, per-app persistent notepad (user_id + app_name unique constraint, RLS enabled)

## Apps

### Rentor Direct (React + Vite)
- Path: `apps/direct/`
- Purpose: Self-directed property management for DIY landlords (the $1M Rentor Direct idea)
- Auth: `@rentor/auth` shared package with `useAuth()` hook
- Supabase: `@rentor/supabase` shared package (`createRentorClient()`)
- Netlify site: `rentordirect` (ID: eaa9e4b2-43c6-4916-9c64-ca34885ce8c3)
- URL: https://rentordirect.netlify.app
- Features: Marketing/listings, screening, leases, rent collection, maintenance, consulting, admin scratchpad

### Rentor Scale (React + Vite)
- Path: `apps/scale/`
- Purpose: CRM for converting owner leads to PM clients
- Auth: `@rentor/auth` with `useAuth()`
- Supabase: `@rentor/supabase` + `supabase.schema('scale')` for Scale-specific tables
- Netlify site: `rentorscale` (ID: 01b5fda3-c37d-4af9-80c4-e2d4e37d04c2)
- URL: https://rentorscale.netlify.app
- Features: Lead pipelines, contacts, properties, documents, payments, metrics, playbook, admin scratchpad
- Has collapsible sidebar

### Rentor Process (React + Vite)
- Path: `apps/process/`
- Purpose: BPMS workflow automation engine
- Auth: `@rentor/auth` with `useAuth()`
- Supabase: `@rentor/supabase`
- Netlify site: `rentorprocess` (ID: 5c32d9d8-201e-48cd-a63e-eae9224408c4)
- URL: https://rentorprocess.netlify.app
- Features: Workflow designer, templates, instances, audit trail, admin scratchpad
- Has collapsible sidebar

### Rentor Ledger (Next.js 16 + App Router)
- Path: `apps/ledger/`
- Purpose: Financial dashboard with QuickBooks integration
- Auth: Direct `createClient()` from `@supabase/ssr` — does NOT use the shared @rentor/auth package
- Netlify site: `rentorledger` (ID: 5a53db27-80b5-415c-8e54-968f7303f1d1) — deploys via CI/CD on git push
- URL: https://rentorledger.netlify.app
- Features: Revenue, unit economics, growth, productivity, profitability, portfolio, reports, audit, actions, admin scratchpad
- Has collapsible sidebar with QuickBooks live status indicator
- Uses `"use client"` directive on all interactive pages
- Page pattern: `apps/ledger/src/app/(protected)/[feature]/page.tsx` with `export default function`

### Other Apps
- `apps/one/` — Rentor One (unified dashboard concept)
- `apps/inbox/` — Rentor Inbox (communications)
- `apps/myrentor/` — MyRentor (tenant portal)

## Shared Packages
- `libs/shared/supabase/` — `@rentor/supabase` package, exports `createRentorClient()`
- `libs/shared/auth/` — `@rentor/auth` package, exports `AuthProvider` + `useAuth()` hook (Google OAuth)

## Deployment Pattern (Vite apps)
```bash
# Build
cd "C:\Users\micro\OneDrive\Desktop\DarusTech\- - - Rentor MonoRepo"
npx nx build {app-name}

# Deploy (use absolute path to dist, --no-build to skip Netlify's build)
cd apps/{app-name}
npx netlify deploy --prod --dir="ABSOLUTE_PATH_TO_DIST" --no-build --site=SITE_ID
```

Ledger (Next.js) deploys automatically via Netlify CI/CD on git push to main.

## Common Patterns
- Admin gating: `const ADMIN_EMAILS = ['darus@rentor.com']` — used to show admin-only features like scratchpad
- Scratchpad: Full-page auto-saving notepad, gated to admin, accessed via StickyNote icon next to username in sidebar footer. Saves to Supabase `public.scratchpads` table with unique app_name per app.
- Collapsible sidebar: All apps have collapsible sidebars with localStorage persistence for collapsed state
- Color system: Scale uses `rentor-*` CSS custom properties. Direct/Process/Ledger use Tailwind `primary`/`muted`/etc tokens.
