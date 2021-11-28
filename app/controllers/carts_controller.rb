class CartsController < ApplicationController
  def index
    @cart = current_user.cart
    render "index"
  end

  def create
    item = Cart.find_item(params[:id])
    if item
      item.update_attribute(:qty, item.qty + 1)
      item.update_attribute(:price, item.price + item.price)
    else
      menuitem = Menuitem.find(params[:id])
      new_cart = Cart.create!(
        user_id: session[:current_user_id],
        menuitem_id: params[:id],
        qty: 1,
        price: menuitem.price,
        name: menuitem.name,
      )
    end
    redirect_to customers_path
  end
end
