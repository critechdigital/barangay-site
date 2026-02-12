# Changelog

## [0.1.0] - 2026-02-12

### Added
- **Rails 8.1 Project Scaffold** — Ruby on Rails with SQLite (dev) / PostgreSQL (prod)
- **User Authentication** — Signup, login, logout with bcrypt password hashing
- **5-Step Setup Wizard** — Guided barangay site creation:
  1. Basics (name, location, region)
  2. Officials (pre-populated positions: Captain, Kagawads, SK Chair)
  3. Services (pre-loaded common barangay services: clearance, cedula, blotter, etc.)
  4. Contact (address, phone, email, office hours)
  5. Preview & Publish
- **Public Site Template** — Auto-generated pages:
  - Home with hero, officials, services, announcements
  - Services directory grouped by category
  - Officials page with initials avatars
  - Announcements feed
  - Contact page
  - Transparency Seal (RA 9485 compliant)
- **Admin Dashboard** — Stats overview + quick actions
- **Announcements CRUD** — Create, edit, delete, publish/draft toggle
- **Tailwind CSS v4** — Mobile-first responsive design
- **Pre-loaded Data** — 8 common barangay services, 6 official positions
- **Test Suite** — 60 tests, 117 assertions covering models, auth, wizard, public site, admin
- **Multi-tenant Ready** — acts_as_tenant gem included
- **Philippine Regions** — All 17 regions in dropdown (including BARMM)
