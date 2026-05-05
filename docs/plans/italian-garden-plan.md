# Italian Garden Restaurant — Rails 8 Implementation Plan

> **For Hermes:** Use subagent-driven-development skill to implement this plan task-by-task.

**Goal:** Build a full Rails 8 restaurant website with admin dashboard for menu management, hours, testimonials, and site content. Mobile-responsive, deployed to Heroku.

**Architecture:** Rails 8 monolith with Solid trifecta (single DB), Devise auth, Active Storage for photos, Tailwind CSS for styling. Admin dashboard at `/admin`, public site at root.

**Tech Stack:** Rails 8.1, Ruby 3.4+, PostgreSQL, Tailwind CSS v4, Devise, Active Storage, Solid Queue/Cache/Cable

---

## Models

| Model | Fields |
|-------|--------|
| User | email, password (Devise) |
| MenuCategory | name, sort_order, active |
| MenuItem | name, description, price, featured, active, menu_category_id, photo (Active Storage) |
| Hour | day_of_week (0-6), open_time, close_time, closed |
| Testimonial | customer_name, quote, stars (1-5), featured, active |
| SiteSetting | key, value (singleton-style for hero text, about, address, phone, email) |

---

## Phase 1: Project Setup

### Task 1: Create Rails 8 App

```bash
cd ~/Studio-Projects
rails new italian-garden --database=postgresql --css=tailwind
cd italian-garden
```

### Task 2: Consolidate Solid Trifecta

Follow `rails-8-project-setup` skill — run generators, point configs to primary DB, create migration files from schema files, delete separate schema files.

### Task 3: Install Devise

```bash
echo 'gem "devise", "~> 4.9"' >> Gemfile
bundle install
bin/rails generate devise:install
bin/rails generate devise User
```

Set `default_url_options` in development.rb, add flash messages to layout.

### Task 4: Run Initial Migrations

```bash
bin/rails db:create
bin/rails db:migrate
```

---

## Phase 2: Models & Migrations

### Task 5: MenuCategory

```bash
bin/rails generate model MenuCategory name:string sort_order:integer active:boolean
```

- Default `active: true`, `sort_order: 0`
- Validates: `name` presence, uniqueness

### Task 6: MenuItem

```bash
bin/rails generate model MenuItem name:string description:text price:decimal featured:boolean active:boolean menu_category:references
```

- `price` precision: 8, scale: 2
- Default `active: true`, `featured: false`
- Validates: `name`, `price` presence; `price` numericality >= 0
- `belongs_to :menu_category`
- `has_one_attached :photo`

### Task 7: Hour

```bash
bin/rails generate model Hour day_of_week:integer open_time:time close_time:time closed:boolean
```

- Default `closed: false`
- Validates: `day_of_week` inclusion 0-6, uniqueness
- Seed 7 rows (Sun-Sat)

### Task 8: Testimonial

```bash
bin/rails generate model Testimonial customer_name:string quote:text stars:integer featured:boolean active:boolean
```

- Default `active: true`, `featured: false`
- Validates: `customer_name`, `quote` presence; `stars` inclusion 1-5

### Task 9: SiteSetting

```bash
bin/rails generate model SiteSetting key:string value:text
```

- Validates: `key` presence, uniqueness
- Class method `SiteSetting.get(key)` / `SiteSetting.set(key, value)`
- Seed keys: `hero_heading`, `hero_subheading`, `about_heading`, `about_body`, `address`, `phone`, `email`

### Task 10: Run All Migrations & Verify

```bash
bin/rails db:migrate
bin/rails runner "puts ActiveRecord::Base.connection.tables.sort"
```

---

## Phase 3: Seed Data

### Task 11: Create Seed File

`db/seeds.rb` — Create admin user, menu categories, menu items (with real data from the restaurant), hours (Mon-Sat 10:30-9/10, Sun 12-9), testimonials, site settings.

Admin: `admin@italiangarden.com` / `password123`

---

## Phase 4: Admin Dashboard

### Task 12: Admin Layout & Routes

- Namespace routes under `/admin`
- `AdminController` base class with `before_action :authenticate_user!`
- Admin layout with sidebar nav: Dashboard, Menu Categories, Menu Items, Hours, Testimonials, Site Settings
- Tailwind sidebar + content area layout

### Task 13: Admin Dashboard Home

- `/admin` — stats overview (total menu items, categories, testimonials)
- Quick links to each section

### Task 14: Menu Categories CRUD

- Index (sortable table with drag handles or up/down arrows)
- New / Edit form (name, sort_order, active toggle)
- Delete with confirmation

### Task 15: Menu Items CRUD

- Index with filters (by category, active/featured)
- New / Edit form (name, description, price, category dropdown, featured toggle, photo upload)
- Delete with confirmation
- Photo preview via Active Storage

### Task 16: Hours Management

- Single page edit — 7 rows (Sun-Sat), each with open/close time pickers + "Closed" checkbox
- Save all at once (batch update)

### Task 17: Testimonials CRUD

- Index table (name, stars, featured badge, active toggle)
- New / Edit form
- Delete with confirmation

### Task 18: Site Settings

- Single page edit — grouped fields (Hero, About, Contact)
- Text inputs for short fields, textarea for about body
- Save all at once

---

## Phase 5: Public Site

### Task 19: Public Layout

- Navbar: Logo + nav links + "Order Now" CTA
- Mobile: hamburger menu (Stimulus toggle)
- Footer: copyright, social links
- Google Fonts: Playfair Display + DM Sans

### Task 20: Home Page

- Hero section (from SiteSettings)
- Signature Favorites (3 featured MenuItems)
- Our Story (from SiteSettings)
- Menu preview (first 7 items per category with prices)
- Testimonials (featured Testimonials)
- Contact section (hours, address, phone, email)
- Map section (address from SiteSettings)

### Task 21: Menu Page

- Full menu organized by MenuCategory
- Each item: name, description, price, photo (if present)
- Mobile: single column stack

### Task 22: Contact Page

- Address, phone, email, hours
- Embedded map (Google Maps iframe or Leaflet)
- Simple contact form (optional — could just be "call us")

### Task 23: About Page

- Full about text from SiteSettings
- Maybe a photo section

---

## Phase 6: Responsive Design

### Task 24: Mobile Navigation

- Hamburger menu at < 768px
- Slide-out or dropdown nav
- Touch-friendly tap targets (44px min)

### Task 25: Responsive Home Page

- Hero: full width, smaller text on mobile
- Featured cards: stack vertically
- Menu preview: single column
- Testimonials: single column
- Contact: stack columns

### Task 26: Responsive Menu Page

- Single column on mobile
- Category headers sticky or prominent

### Task 27: Responsive Admin

- Sidebar collapses to top nav on mobile
- Tables scroll horizontally or switch to card layout

---

## Phase 7: Polish & Deploy

### Task 28: Add Placeholder Images

- Use gradient placeholders or SVG icons for menu items without photos
- Food emoji fallbacks for featured cards on homepage

### Task 29: SEO Basics

- Page titles and meta descriptions
- Open Graph tags
- Semantic HTML (header, main, nav, footer, section)

### Task 30: Heroku Deploy

- Follow `rails-heroku-deploy` skill
- Procfile, production config, ENV vars
- Run migrations on deploy

---

## File Structure

```
italian-garden/
├── app/
│   ├── controllers/
│   │   ├── admin/
│   │   │   ├── base_controller.rb
│   │   │   ├── dashboard_controller.rb
│   │   │   ├── menu_categories_controller.rb
│   │   │   ├── menu_items_controller.rb
│   │   │   ├── hours_controller.rb
│   │   │   ├── testimonials_controller.rb
│   │   │   └── site_settings_controller.rb
│   │   ├── pages_controller.rb
│   │   ├── menu_controller.rb
│   │   └── contact_controller.rb
│   ├── models/
│   │   ├── menu_category.rb
│   │   ├── menu_item.rb
│   │   ├── hour.rb
│   │   ├── testimonial.rb
│   │   └── site_setting.rb
│   ├── views/
│   │   ├── admin/
│   │   │   ├── layout.html.erb
│   │   │   ├── dashboard/
│   │   │   ├── menu_categories/
│   │   │   ├── menu_items/
│   │   │   ├── hours/
│   │   │   ├── testimonials/
│   │   │   └── site_settings/
│   │   ├── pages/
│   │   │   └── home.html.erb
│   │   ├── menu/
│   │   │   └── index.html.erb
│   │   ├── contact/
│   │   │   └── index.html.erb
│   │   └── layouts/
│   │       └── application.html.erb
│   └── assets/
│       └── stylesheets/
│           └── application.tailwind.css
├── config/
│   └── routes.rb
├── db/
│   ├── migrate/
│   └── seeds.rb
└── docs/
    └── plans/
        └── italian-garden-plan.md
```

---

## Routes

```ruby
# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  # Public
  root "pages#home"
  get "menu", to: "menu#index"
  get "contact", to: "contact#index"
  get "about", to: "pages#about"

  # Admin
  namespace :admin do
    root "dashboard#index"
    resources :menu_categories
    resources :menu_items
    resource :hours, only: [:edit, :update]
    resources :testimonials
    resource :site_settings, only: [:edit, :update]
  end
end
```

---

## Execution Order

1. Phase 1 (Tasks 1-4): Project setup — ~15 min
2. Phase 2 (Tasks 5-10): Models — ~20 min
3. Phase 3 (Task 11): Seeds — ~10 min
4. Phase 4 (Tasks 12-18): Admin dashboard — ~60 min
5. Phase 5 (Tasks 19-23): Public site — ~60 min
6. Phase 6 (Tasks 24-27): Responsive — ~30 min
7. Phase 7 (Tasks 28-30): Polish & deploy — ~30 min

**Total estimated: ~3.5 hours**
