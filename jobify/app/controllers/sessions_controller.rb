# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  before_filter :authenticate_user, except: [:new, :create, :destroy]
  layout 'index_layout', only: [:new, :create]
  def new
    unless session[:user_id] || (User.find_by_id(session[:user_id]))
      render 'new'
    else
      redirect_to '/login'
    end
  end

  def create
    @user = User.find_by_email(params[:email].downcase)
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      @error = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
