# Changelog

## [0.2.0] - 2026-02-12

### Added
- **Admin Officials CRUD** — Add, edit, delete officials from admin panel
  - Position dropdown with pre-loaded barangay positions
  - Sort order control for display ordering
- **Admin Services CRUD** — Add, edit, delete services from admin panel
  - Category selection, fees, processing time, requirements fields
  - Grouped display by category
- **Demo Seed Data** — Full demo barangay (Barangay San Isidro)
  - 11 officials (Captain, 7 Kagawads, Secretary, Treasurer, SK Chair)
  - 11 services across 4 categories
  - 3 realistic announcements
  - Demo login: demo@barangaysite.ph / demo1234
- **Admin Navigation** — Full nav bar with links to all admin sections
- **14 new integration tests** for officials and services CRUD
- **Test suite: 74 tests, 157 assertions, 0 failures**

## [0.1.0] - 2026-02-12

### Added
- **Rails 8.1 Project Scaffold** — Ruby on Rails with SQLite (dev) / PostgreSQL (prod)
- **User Authentication** — Signup, login, logout with bcrypt password hashing
- **5-Step Setup Wizard** — Guided barangay site creation
- **Public Site Template** — 6 auto-generated pages
- **Admin Dashboard** — Stats overview + quick actions
- **Announcements CRUD** — Create, edit, delete, publish/draft toggle
- **Tailwind CSS v4** — Mobile-first responsive design
- **Pre-loaded Data** — 8 common barangay services, 6 official positions
- **Test Suite** — 60 tests, 117 assertions
- **Multi-tenant Ready** — acts_as_tenant gem included
