class CartController < ApplicationController
  def show
    @cart = Cart.new(session)
  end

  def add
    cart = Cart.new(session)
    cart.add(params[:menu_item_id], params[:quantity]&.to_i || 1)
    redirect_to menu_path, notice: "Added to cart!"
  end

  def add_meal
    cart = Cart.new(session)
    cart.add_meal(params[:deal_id], params[:drink_id])
    redirect_to cart_path, notice: "Meal deal added to cart!"
  end

  def update
    cart = Cart.new(session)
    cart.update_quantity(params[:menu_item_id], params[:quantity].to_i)
    redirect_to cart_path
  end

  def swap_drink
    cart = Cart.new(session)
    cart.swap_drink(params[:meal_index].to_i, params[:drink_id])
    redirect_to cart_path, notice: "Drink updated!"
  end

  def remove
    cart = Cart.new(session)
    cart.remove(params[:menu_item_id])
    redirect_to cart_path, notice: "Item removed."
  end

  def remove_meal
    cart = Cart.new(session)
    cart.remove_meal(params[:meal_index].to_i)
    redirect_to cart_path, notice: "Meal deal removed."
  end

  def clear
    cart = Cart.new(session)
    cart.clear
    redirect_to cart_path, notice: "Cart cleared."
  end
end
