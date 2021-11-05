class CustomersController < ApplicationController
  def index
    render "index"
  end

  def create
    item = Menuitem.find(params[:id])
    render plain: item.name
  end
end
