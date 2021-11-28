class MenuController < ApplicationController
  def index
    render "index"
  end

  def create
    item = Menuitem.new(
      name: params[:name],
      cat: params[:category],
      price: params[:price].to_f,
    )
    if item.save
      redirect_to menu_index_path
    else
      flash[:error] = item.errors.full_messages.join(", ")
      redirect_to menu_index_path
    end
  end
end
