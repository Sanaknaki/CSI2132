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
    if params[:is_student]
      @student = Student.new(person_params)
    elsif params[:is_moderator]
      @moderator = Moderator.new(person_params)
    end
    if @user.save
      session[:user_id] = @user.id
      if params[:is_student]
        redirect_to :controller => 'resumes', :action => 'upload'
      else
        redirect_to '/'
      end
    else
      render 'sessions/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def person_params
    params.require(:person).permit(
      :first_name,
      :last_name
    )
  end
end
