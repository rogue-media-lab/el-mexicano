class OrdersController < ApplicationController
  def new
    @cart = Cart.new(session)
    redirect_to menu_path, alert: "Your cart is empty." if @cart.empty?
    @order = Order.new
  end

  def create
    @cart = Cart.new(session)
    redirect_to menu_path, alert: "Your cart is empty." and return if @cart.empty?

    @order = Order.new(order_params)
    @order.total = @cart.total

    items = @cart.menu_items

    # Add regular items
    @cart.items.each do |item_id, qty|
      menu_item = items[item_id.to_i]
      next unless menu_item
      @order.order_items.build(
        menu_item: menu_item,
        quantity: qty,
        price: menu_item.price
      )
    end

    # Add meal deals
    deals = @cart.meal_deal_objects
    @cart.meal_deals.each do |meal|
      deal = deals[meal["deal_id"]]
      next unless deal
      # Add the main item with combo note
      @order.order_items.build(
        menu_item: deal.main_item,
        quantity: 1,
        price: deal.price
      )
      # Add side as free add-on
      @order.order_items.build(
        menu_item: items[meal["side_id"]] || deal.default_side,
        quantity: 1,
        price: 0
      )
      # Add drink as free add-on
      @order.order_items.build(
        menu_item: items[meal["drink_id"]] || deal.default_drink,
        quantity: 1,
        price: 0
      )
    end

    if @order.save
      @cart.clear
      redirect_to order_confirmation_path(@order), notice: "Order placed! We'll have it ready for pickup."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :phone, :pickup_time)
  end
end
