Rails.application.routes.draw do

  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
  
  resources :workout_plans do
	resources :exercises do 
		resources :exercise_routines
	end
  end
  
    resources :private_lessons do 
		collection do 
			get 'showall'
		end
	end
	
	resources :group_lessons do
		collection do
			get 'showall'
		end
	end
	
	post '/bookprivate/:id', to: 'booked_private_lessons#book', as: 'book_private'

	delete  '/deleteprivate/:id', to: 'booked_private_lessons#destroy', as: 'delete_private'
	
	get '/bookedprivate', to: 'booked_private_lessons#showbooked', as: 'show_booked_private'

	post '/bookgroup/:id', to: 'booked_group_lessons#book', as: 'book_group'

	delete  '/deletegroup/:id', to: 'booked_group_lessons#destroy', as: 'delete_group'
	
	get '/bookedgroup', to: 'booked_group_lessons#showbooked', as: 'show_booked_group'
	
	#get di prova 
	get ('/') => redirect('/homepage')

	resources :info_e_contatti
	resources :personal_profile
	resources :homepage
	resources :soci
  
end
