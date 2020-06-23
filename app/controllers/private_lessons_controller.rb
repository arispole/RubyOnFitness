class PrivateLessonsController < ApplicationController

	def showall
		@privatelessons = PrivateLesson.where(booked: false)
	end

	def index
		@privatelessons = current_user.private_lessons
	end
	
	def show
		id = params[:id]
		if PrivateLesson.exists?(id)
			@privatelesson = PrivateLesson.find(id)
			@member = nil
			if (@privatelesson.booked != false)
				@member = (@privatelesson.booked_private_lesson).user_id
			end
		else
			render html: 'Questa lezione non esiste'
		end
	end
	
	def new
		
	end
	
	def create
        @privatelesson = current_user.private_lessons.new(params[:privatelesson].permit!) 
        if @privatelesson.save
            flash[:notice] = "Lezione aggiunta"
            redirect_to private_lessons_path
        else
            flash[:notice] = @privatelesson.errors.full_messages
            redirect_to private_lessons_path
        end
    end
	
	def edit
		id = params[:id]
		@privatelesson = PrivateLesson.find(id)
	end
	
	def update 
		id = params[:id]
		@privatelesson = PrivateLesson.find(id)
		@privatelesson.update_attributes!(params[:privatelesson].permit(:inizio))
		redirect_to private_lesson_path(@privatelesson)
	end
	
	def destroy
		id = params[:id]
		@privatelesson = PrivateLesson.find(id)
		@privatelesson.destroy
		redirect_to private_lessons_path
	end
	
end
