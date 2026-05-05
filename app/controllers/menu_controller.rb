class MenuController < ApplicationController
  def index
    @categories = MenuCategory.active.ordered.includes(menu_items: { photo_attachment: :blob })
  end
end
