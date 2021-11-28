class CustomersController < ApplicationController
  def index
    render "index"
  end

  def create
    item = Cart.find_item(params[:id])
    if item
      item.update_attribute(:qty, item.qty + 1)
      item.update_attribute(:price, item.price + item.price)
    else
      new_cart = Cart.create!(
        user_id: session[:current_user_id],
        menuitem_id: params[:id],
        qty: 1,
        price: Menuitem.find(params[:id]).price,
      )
    end
    redirect_to customers_path
  end
end
