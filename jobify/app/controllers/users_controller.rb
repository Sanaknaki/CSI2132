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
    if params[:user_type] == 'student'
      @student = Student.create(student_params)
      @user.student = @student
      @student.save
    elsif params[:user_type] == 'moderator'
      @moderator = Moderator.new(moderator_params)
      @moderator.save
      @user.moderator = @moderator
    end
    if @user.save
      session[:user_id] = @user.id
      if params[:user_type] == 'student'
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

  def student_params
    params.require(:person).permit(
      :first_name,
      :last_name,
      :student_num
    )
  end

  def moderator_params
    params.require(:person).permit(
      :first_name,
      :last_name
    )
  end

end
