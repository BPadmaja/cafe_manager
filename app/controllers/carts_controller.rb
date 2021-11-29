class CartsController < ApplicationController
  def index
    @cart = current_user.cart
    render "index"
  end

  def create
    item = Cart.find_item(params[:id])
    if item
      item.update_attribute(:qty, item.qty + 1)
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

  def add
    item = Cart.find(params[:id])
    item.update_attribute(:qty, item.qty + 1)
    redirect_to carts_path
  end

  def remove
    item = Cart.find(params[:id])
    if item.qty > 1
      item.update_attribute(:qty, item.qty - 1)
    else
      item.destroy
    end
    redirect_to carts_path
  end

  def destroy
    item = Cart.find(params[:id])
    item.destroy
    redirect_to carts_path
  end
end
