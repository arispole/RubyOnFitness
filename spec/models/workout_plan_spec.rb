require 'rails_helper'

RSpec.describe WorkoutPlan, type: :model do

  context 'validation test' do 
    it 'ensures workout plan name presence' do
      user = User.create!(nome: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      w_plan = WorkoutPlan.new(user_id: user.id, note: 'note di test').save
      expect(w_plan).to eql(false)  
    end

    
    it 'should create new workout plan succesfully' do
      user = User.create!(nome: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      w_plan = WorkoutPlan.new(user_id: user.id, nome: 'nome di test', note: 'note di test').save
      expect(w_plan).to eql(true)  
    end
  
  end

end
