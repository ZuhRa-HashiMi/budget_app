class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :avatar)
    end
  end

  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to splashs_index_path
    end
  end
end
