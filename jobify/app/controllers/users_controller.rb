# app/controllers/sessions_controller.rb
class UsersController < ApplicationController
  # TODO
  # Send email verification
  # reset password
  layout 'index_layout', only: [:new, :create]
  def new
    render 'sessions/new'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'sessions/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
