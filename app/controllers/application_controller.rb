class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #to make them available for views too
  helper_method :current_chef, :logged_in?

  #or equal to ||= pulls from DB only if @current_chef is nil 
  def current_chef
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  #returns true/false if current_chef expression has value or nil
  def logged_in?
    !!current_chef
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
