class ApplicationController < ActionController::Base

	include Pundit
	
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	protect_from_forgery with: :exception
	
	before_action :authenticate_user!
	
        before_action :configure_permitted_parameters,
	 if: :devise_controller?
          
          protected

          def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [ :avatar, :email, :password, :password_confirmation, :nome, :cognome, :datanascita, :sesso, :peso, :altezza, :indirizzo,  :varie, :tipoabbonamento])
            devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar, :email, :password, :password_confirmation, :nome, :cognome, :datanascita, :sesso, :peso, :altezza, :indirizzo,  :varie, :tipoabbonamento])

          end
	
		def user_not_authorized
			flash[:alert] = "You are not authorized to perform this action."
			redirect_to(request.referrer || '/')
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

