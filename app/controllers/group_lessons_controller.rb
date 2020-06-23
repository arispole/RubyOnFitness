class GroupLessonsController < ApplicationController

	def showall
		@grouplessons = GroupLesson.where.not(posti_disponibili: 0)
	end
	
	def index
		@grouplessons = current_user.group_lessons
	end
	
	def show
		id = params[:id]
		if GroupLesson.exists?(id)
			@grouplesson = GroupLesson.find(id)
			@bookedlessons = nil
			if (@grouplesson.posti_disponibili != @grouplesson.posti) 
				@bookedlessons = @grouplesson.booked_group_lessons
			end
		else
			render html: 'Questa lezione non esiste'
		end
	end
	
	def new
		
	end
	
	def create
        @grouplesson = current_user.group_lessons.new(params[:grouplesson].permit!) 
        if @grouplesson.save
            flash[:notice] = "Lezione aggiunta"
            redirect_to group_lessons_path
        else
            flash[:notice] = @privatelesson.errors.full_messages
            redirect_to group_lessons_path
        end
    end
	
	def edit
		id = params[:id]
		@grouplesson = GroupLesson.find(id)
	end
	
	def update 
		id = params[:id]
		@grouplesson = GroupLesson.find(id)
		@grouplesson.update_attributes!(params[:grouplesson].permit(:nome, :descrizione, :posti, :inizio))
		redirect_to group_lesson_path(@grouplesson)
	end
	
	def destroy
		id = params[:id]
		@grouplesson = GroupLesson.find(id)
		@grouplesson.destroy
		redirect_to group_lessons_path
	end
	
end
