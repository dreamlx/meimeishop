class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters_name, if: :devise_controller? 
 
    def configure_permitted_parameters_name
        added_attrs = [:phone, :email, :password, :password_confirmation, :remember_me, :inviter]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
