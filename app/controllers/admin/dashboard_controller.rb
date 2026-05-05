module Admin
  class DashboardController < BaseController
    def index
      @menu_items_count = MenuItem.count
      @categories_count = MenuCategory.count
      @testimonials_count = Testimonial.count
      @featured_items = MenuItem.featured.active.includes(:menu_category, photo_attachment: :blob)
    end
  end
end
