Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
  
  resources :workout_plans do
	resources :exercises do 
		resources :exercise_routines
	end
  end
 
  #get di prova 
  get ('/') => redirect('/homepage')

  resources :homepage
  resources :soci
  
end
