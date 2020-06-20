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
			get 'showbooked'
		end
	end

	post '/book/:id', to: 'booked_private_lessons#book', as: 'book'

	delete  '/delete/:id', to: 'booked_private_lessons#destroy', as: 'delete'
 
  #get di prova 
  get ('/') => redirect('/homepage')

  resources :info_e_contatti
  resources :homepage
  resources :soci
  
end
