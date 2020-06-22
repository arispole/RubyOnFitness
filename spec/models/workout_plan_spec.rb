require 'rails_helper'

RSpec.describe WorkoutPlan, type: :model do
  context 'validation test' do 
    it 'ensures workout plan name presence' do
      w_plan= WorkoutPlan.new(note: 'note di test').save
      expect(w_plan).to eql(false)
    end

    it 'should create new workout plan succesfully' do
      w_plan = WorkoutPlan.new(id: 1, user_id: 2, nome: 'nome di test', note: 'note di test', created_at: DateTime.now - 2.day, updated_at: DateTime.now - 1.day).save
      expect(w_plan).to eql(true)  
    end
  end
end
