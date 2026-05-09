# Italian Garden Restaurant

A custom restaurant website and ordering platform for Italian Garden Restaurant in York, SC. Built with Rails 8, featuring online ordering, table reservations, meal deals, and a full admin dashboard.

**Live:** [italian-garden-4ccf363272a1.herokuapp.com](https://italian-garden-4ccf363272a1.herokuapp.com/)

---

## Features

### Public Site
- **Online Ordering** — browse the menu, add items to cart, checkout for pickup
- **Meal Deals** — combo meals (main + side + drink) with drink swapping in cart
- **Table Reservations** — request a table with date, time, party size, and special requests
- **Real-Time Menu** — categories, items, and prices managed from the admin dashboard
- **Google Reviews** — live review integration with overall rating display
- **Review Links** — direct links to Google, Yelp, TripAdvisor, and Facebook
- **Mobile Responsive** — full ordering flow works on any device

### Admin Dashboard
- **Menu Management** — CRUD for categories and items with photo upload
- **Meal Deals** — bundle items into combos with custom pricing
- **Hours of Operation** — batch edit weekly hours
- **Orders** — real-time order feed via Turbo Streams, mark ready/complete
- **Reservations** — view, confirm, or cancel reservation requests
- **Testimonials** — manage customer reviews with star ratings
- **Site Settings** — edit hero text, about section, and contact info

### Technical
- **Real-Time Updates** — Turbo Streams + Action Cable push new orders to admin instantly
- **Session-Based Cart** — handles both individual items and meal deal bundles
- **Solid Trifecta** — cache, queue, and cable consolidated into a single PostgreSQL database
- **Devise Auth** — styled login, registration, and password reset pages
- **Static Food Photos** — images served as static assets for reliable hosting on Heroku

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Ruby on Rails 8.1 |
| Language | Ruby 3.4.1 |
| Database | PostgreSQL |
| CSS | Tailwind CSS v4 |
| Auth | Devise |
| Real-Time | Turbo Streams + Action Cable |
| Storage | Solid Trifecta (cache, queue, cable) |
| Deployment | Heroku |
| CI | GitHub Actions (brakeman, rubocop, tests) |

---

## Getting Started

### Prerequisites
- Ruby 3.4.1 (via rbenv)
- PostgreSQL
- Bundler

### Setup

```bash
git clone git@github.com:rogue-media-lab/italian-garden.git
cd italian-garden
rbenv local 3.4.1
bundle install
bin/rails db:create db:migrate db:seed
bin/dev
```

Visit `http://localhost:3000`

### Admin Login
- **Email:** admin@italiangarden.com
- **Password:** password123

---

## Database

26 tables across a single PostgreSQL database:

| Table | Purpose |
|-------|---------|
| `menu_categories` | Menu organization |
| `menu_items` | Individual dishes with prices |
| `meal_deals` | Combo bundles (main + side + drink) |
| `orders` | Customer pickup orders |
| `order_items` | Line items per order |
| `reservations` | Table reservation requests |
| `testimonials` | Customer reviews |
| `hours` | Weekly operating hours |
| `site_settings` | Key/value site content |
| `users` | Admin authentication |
| `solid_*` | Cache, queue, and cable (consolidated) |
| `active_storage_*` | File attachment metadata |

---

## Deployment

### Heroku

```bash
heroku git:remote -a italian-garden
git push heroku main
heroku run bin/rails db:migrate -a italian-garden
heroku run bin/rails db:seed -a italian-garden
```

**Config Vars:**
- `RAILS_MASTER_KEY` — from `config/master.key`
- `DATABASE_URL` — auto-set by Heroku PostgreSQL addon

### CI Pipeline

All code deploys through GitHub Actions:

1. **Brakeman** — security vulnerability scan
2. **Rubocop** — style and lint checks
3. **Tests** — unit and system tests against PostgreSQL

Deploy to Heroku only after CI passes.

---

## Project Structure

```
app/
├── controllers/
│   ├── admin/          # Dashboard controllers
│   ├── cart_controller.rb
│   ├── orders_controller.rb
│   └── ...
├── models/
│   ├── cart.rb         # Session-based cart logic
│   ├── food_photos.rb  # Static photo mapping
│   ├── meal_deal.rb    # Combo bundles
│   └── ...
├── views/
│   ├── admin/          # Dashboard views
│   ├── pages/          # Home, about
│   ├── menu/           # Full menu
│   ├── cart/           # Shopping cart
│   ├── orders/         # Checkout, confirmation
│   └── layouts/        # Application, admin, devise
└── assets/
    └── images/         # Static food photos
```

---

## Review Platform Links

| Platform | URL |
|----------|-----|
| Google Maps | [View Listing](https://www.google.com/maps/place/Italian+Garden+Restaurant/@34.9875107,-81.2274933,17z/data=!4m8!3m7!1s0x8856f38afc7c1885:0x1c7a0b6c7cc288e7!8m2!3d34.9875107!4d-81.2274933!9m1!1b1!16s%2Fg%2F1tfh_96q?entry=ttu&g_ep=EgoyMDI2MDQyOS4wIKXMDSoASAFQAw%3D%3D) |
| Yelp | [italian-garden-restaurant-york](https://www.yelp.com/biz/italian-garden-restaurant-york) |
| TripAdvisor | [Italian Garden Restaurant](https://www.tripadvisor.com/Restaurant_Review-g54509-d3620460-Reviews-Italian_Garden_Restaurant-York_South_Carolina.html) |
| Facebook | [Italian Garden Restaurant](https://www.facebook.com/p/Italian-Garden-Restaurant-100070887769336/) |

---

## License

Proprietary — Built by [Rogue Media Lab](https://roguemedialab.com)
