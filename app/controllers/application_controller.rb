class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  
    before_filter :configure_permitted_parameters, if: :devise_controller?
    skip_before_filter :verify_authenticity_token, if: :json_request?

    def json_request?
      request.format.json?
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :birthdate, :phonenumber, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :birthdate, :phonenumber, :email, :password, :current_password) }
        end

end
