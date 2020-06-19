class ExerciseRoutinesController < ApplicationController
	
	def new
		@workout_plan_id = params[:workout_plan_id]
		@exercise_id = params[:exercise_id]
	end
	
	def create
		workoutplan_id = params[:workout_plan_id]
		exercise_id = params[:exercise_id]
        @exerciseroutine = ExerciseRoutine.new(params[:exercise_routine].permit!) 
		@exerciseroutine.workout_plan_id = workoutplan_id
		@exerciseroutine.exercise_id = exercise_id
        if @exerciseroutine.save
			flash[:notice] = "Aggiunto esercizio"
        else
			flash[:notice] = @exerciseroutine.errors.full_messages
        end
        redirect_to workout_plan_path(workoutplan_id)
    end 
	
	def edit
		id = params[:id]
		@exerciseroutine = ExerciseRoutine.find(id)
	end
	
	def update 
		id = params[:id]
		@exerciseroutine = ExerciseRoutine.find(id)
		@exerciseroutine.update_attributes!(params[:exercise_routine].permit(:serie, :ripetisione, :chilogrammi))
		redirect_to workout_plan_path(@exerciseroutine.workout_plan_id)
	end
	
	def destroy
		id = params[:id]
		@exerciseroutine = ExerciseRoutine.find(id)
		workoutplan_id = @exerciseroutine.workout_plan_id
		@exerciseroutine.destroy
		redirect_to workout_plan_path(workoutplan_id)
	end
		
end
