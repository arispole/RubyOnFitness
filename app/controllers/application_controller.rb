class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	
	before_action :authenticate_user!
	
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
