class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters_name, if: :devise_controller? 
    protect_from_forgery
    def configure_permitted_parameters_name
        added_attrs = [:phone, :email, :password, :password_confirmation, :remember_me, :inviter]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def render_json(result)
        return render json: {status: 400 , message: 'render error'} unless result.is_a?(Array)
        result_length = result.length
        if result_length == 2
          json_data = {status: result[0], message: result[1]}
        else
          json_data = {status: result[0], message: result[1], data: result[2]}
        end
        render json: json_data
      end
end
