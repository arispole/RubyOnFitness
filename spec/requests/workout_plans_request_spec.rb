require 'rails_helper'

RSpec.describe "WorkoutPlans", type: :request do

    context "workout plan page rendering test" do
        
        it "should redirect to user sign in" do
          get "/workout_plans"
          response.should redirect_to ("/users/sign_in")    
        end
    
        it "should render workout plans template" do
            
        end
      end



end
