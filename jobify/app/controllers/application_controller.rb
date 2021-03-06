class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  NotAuthorized = Class.new(StandardError)
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      redirect_to '/login'
    end
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error_page(status: 404, text: 'Not found')
  end

  rescue_from ApplicationController::NotAuthorized do |exception|
    render_error_page(status: 403, text: 'Forbidden')
  end

  private

  def render_error_page(status:, text:, template: 'errors')
    respond_to do |format|
      format.json { render json: {errors: [message: "#{status} #{text}"]}, status: status }
      format.html { render template: "#{template}/#{status}", status: status, layout: false }
      format.any  { head status }
    end
  end
end
