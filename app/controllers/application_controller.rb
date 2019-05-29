class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def user_params 
    devise_parameter_sanitizer.permit(:sgin_up, keys: [:name])
  end
end
