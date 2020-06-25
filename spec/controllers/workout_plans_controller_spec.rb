require 'rails_helper'

RSpec.describe "WorkoutPlans", type: :controller do

    context "workout plan page rendering test" do
        
        it "should render workout plans template" do
            user = User.create!(nome: 'test', email: 'user@test.com', password: 'password', password_confirmation: 'password')
            sign_in user
            redirect_to  :workout_plans
            expect(response).to 
        end
      end



end
