class OrdersController < ApplicationController
  def index
    render "index"
  end

  def new
    cart = current_user.cart
    order = Order.create!(
      status: "Placed",
      user_id: session[:current_user_id],
      date: Date.today,
      total: cart.sum("qty * price"),
    )
    cart.each do |item|
      new_item = OrderItem.create!(
        order_id: order.id,
        menu_item_id: item.menuitem_id,
        name: item.name,
        qty: item.qty,
        price: item.price,
      )
      cart.destroy_all
    end
    redirect_to placed_order_path
  end

  def create
    order = Order.find(params[:id])
    order.update_attribute(:status, "Delivered")
    redirect_to orders_path
  end

  def show
    render "placed"
  end

  def placed
    render "placed"
  end
end
