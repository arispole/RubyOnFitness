require 'rails_helper'

RSpec.describe GroupLessonsController, type: :controller do
	
	describe 'GET group_lessons#showall' do
		it 'should render group_lessons#showall template' do
		end 
	end
	
	describe 'GET group_lessons#new' do
		it 'should render group_lessons#new template' do
		end
	end
	
	describe 'PUT group_lessons#update' do
		it 'should update an existing group lessons' do
		end
	end
	
	describe 'DELETE group_lessons#destroy' do
		it 'should delete a group lesson' do 
			user = User.create!(nome: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
			sign_in user
			group_lesson = GroupLesson.create!(user_id: user.id, nome: 'lezione test', descrizione: 'descrizione test', posti: 30, posti_disponibili: 30)	
			get group_lessons_path(group_lesson.id)
			page.should have_link('Cancella')
#			expect(group_lesson).to have_many(:booked_group_lessons).dependent(:destroy) 
			expect { click_link 'Cancella' }.to change(GroupLesson, :count).by(-1)
		end
	end
		
	
	describe 'POST group_lessons#create' do
		context 'with valid attributes' do
			it 'should save the new group lesson in the database'
			it 'should redirect to the group_lessons#index page'
		end
		
		context 'with invalid attributes' do 
			it 'should not save the new group lesson in the databse'
			it 'should render group_lesson#new template'
		end
	end
	
end

