require 'rails_helper'
require_relative '../support/devise'

RSpec.describe GroupLessonsController, type: :controller do
		
	describe 'GET showall' do
		it 'should render group_lessons#showall template' do
			user = create :user
			sign_in user
			get :showall
			expect(response).to render_template(:showall)
		end 
	end
	
	describe 'GET group_lessons#new' do
		it 'should render group_lessons#new template' do
			user = create :user
			sign_in user
			get :new
			expect(response).to render_template(:new)
		end
	end
	
	describe 'PUT group_lessons#update' do
		it 'should update an existing group lessons' do
		end
	end
	
	describe 'DELETE group_lessons#destroy' do

		it 'should delete a group lesson' do 
			user = create :user
			sign_in user
			group_lesson = GroupLesson.create!(user_id: user.id, nome: 'lezione test', descrizione: 'descrizione test', posti: 30, posti_disponibili: 30)
			expect { delete :destroy, params: {id: group_lesson.id} }.to change(GroupLesson, :count).by(-1)
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

