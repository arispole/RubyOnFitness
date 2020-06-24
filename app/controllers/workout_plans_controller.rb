class WorkoutPlansController < ApplicationController

	def index
		@workoutplans = authorize current_user.workout_plans
	end
	
	def show
		id = params[:id]
		if WorkoutPlan.exists?(id)
			@workoutplan = authorize WorkoutPlan.find(id)
			@exerciseroutines = @workoutplan.exercise_routines
		else
			render html: 'Questa scheda non esiste'
		end
	end
	
#	def showall
#		@workoutplans = WorkoutPlan.all
#	end
	
	def new
		
	end
	
	def create
        @workoutplan = authorize current_user.workout_plans.new(params[:workoutplan].permit!) 
        if @workoutplan.save
            flash[:notice] = "Scheda aggiunta"
            redirect_to workout_plans_path
        else
            flash[:notice] = @workoutplan.errors.full_messages
            redirect_to homepage_index_path
        end
    end
	
	def edit
		id = params[:id]
		@workoutplan = authorize WorkoutPlan.find(id)
	end
	
	def update 
		id = params[:id]
		@workoutplan = authorize WorkoutPlan.find(id)
		@workoutplan.update_attributes!(params[:workoutplan].permit(:nome, :note))
		redirect_to workout_plan_path(@workoutplan)
	end
	
	def destroy
		id = params[:id]
		@workoutplan = authorize WorkoutPlan.find(id)
		@workoutplan.destroy
		redirect_to workout_plans_path
	end
	
end
