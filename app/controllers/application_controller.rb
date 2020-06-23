class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	
	before_action :authenticate_user!
	
        before_action :configure_permitted_parameters,
	 if: :devise_controller?
          
          protected

          def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :email, :password, :password_confirmation, :nome, :cognome, :datanascita, :sesso, :peso, :altezza, :indirizzo,  :varie])
            devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])

          end




        def after_sign_in_path_for(resource)
		if resource.class == User
			if resource.admin_role?
				rails_admin_path
			else 
				homepage_index_path
			end
		end
	end
	
        

end

