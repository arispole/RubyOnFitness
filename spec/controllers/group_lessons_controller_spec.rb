require 'rails_helper'
require_relative '../support/devise'

RSpec.describe GroupLessonsController, type: :controller do
		
	describe 'GET group_lessons#showall' do
		context 'when user' do 
			it 'should render group_lessons#showall template' do
				user = create :user
				sign_in user
				get :showall
				expect(response).to render_template(:showall)
			end 
		end
		
		context 'when trainer' do
			it 'should redirect to homepage and show an error message' do
				trainer = create :trainer
				sign_in trainer
				get :showall
				expect(response).to redirect_to('/')
				expect(flash[:alert]).to be_present
			end
		end
		
	end
	
	describe 'GET group_lessons#index' do 
		context 'when trainer' do 
			it 'should render group_lessons#index template' do
				trainer = create :trainer
				sign_in trainer
				get :index
				expect(response).to render_template(:index)
			end 
		end
		context 'when user' do 
			it 'should redirect to homepage and show an error message' do
				user = create :user
				sign_in user
				get :index
				expect(response).to redirect_to('/')
				expect(flash[:alert]).to be_present
			end
		end
	end
	
	describe 'GET group_lessons#show' do
		context 'when trainer is reading his group lesson' do 
			it 'should render group_lessons#show template'do
				trainer = create :trainer
				sign_in trainer
				grouplesson = GroupLesson.create(nome: "lezione di prova", descrizione: "descrizione lezione prova", user_id: trainer.id)
				get :show, params: {id: grouplesson.id}
				expect(response).to render_template(:show)
			end
		end
		context 'when trainer il reading a group lesson of another trainer' do 
			it 'should redirect to homepage and show an error message' do
				trainer1 = create :trainer
				trainer2 = create :trainer
				grouplesson = GroupLesson.create(nome: "lezione", descrizione: "descrizione lezione", user_id: trainer2.id)
				sign_in trainer1
				get :show, params: {id: grouplesson.id}
				expect(response).to redirect_to('/')
				expect(flash[:alert]).to be_present
			end
		end
	end
	
	describe 'GET group_lessons#new' do
		it 'should render group_lessons#new template' do
			trainer = create :trainer
			sign_in trainer
			get :new
			expect(response).to render_template(:new)
		end
	end
	

	describe 'POST group_lessons#create' do
		
		it 'should save the new group lesson in the database and redirect to the group_lessons#index page' do 
			trainer = create :trainer
			sign_in trainer
			attributes = { :nome => "test3", :descrizione => "testo" }
			post :create, params: { grouplesson: attributes }
			grouplesson = GroupLesson.find_by(user_id: trainer.id)
			expect(assigns(:grouplesson)).to eq(grouplesson)
			expect(response).to redirect_to(group_lessons_path())
		end
		
	end
	
	describe 'GET group_lessons#edit' do
		it 'should render group_lessons#edit template' do
				trainer = create :trainer
				sign_in trainer
				grouplesson = GroupLesson.create(nome: "test", descrizione: "descrizione", user_id: trainer.id)
				get :edit, params: {id: grouplesson.id}
				expect(response).to render_template(:edit)
			end 
	end
	
	describe 'PUT group_lessons#update' do
		it 'should update an existing group lessons' do
			trainer = create :trainer
			sign_in trainer
			grouplesson = GroupLesson.create(nome: "test", descrizione: "descrizione", user_id: trainer.id)
			updated_attributes = { :nome => "prova"}
			put :update, params: {id: grouplesson.id, grouplesson: updated_attributes}
			grouplesson.reload
			expect(grouplesson.nome).to eq("prova")
		end
	end
	
	describe 'DELETE group_lessons#destroy' do
		it 'should delete a group lesson' do 
			trainer = create :trainer
			sign_in trainer
			group_lesson = GroupLesson.create(nome: "test2", descrizione: "desc", user_id: trainer.id)
			expect { delete :destroy, params: {id: group_lesson.id} }.to change(GroupLesson, :count).by(-1)
		end
	end
		
	
	
end

