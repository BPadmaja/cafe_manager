class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to customers_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
