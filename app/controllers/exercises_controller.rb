class ExercisesController < ApplicationController

	def index
		@exercises = Exercise.all
		@workoutplan_id = params[:workout_plan_id]
	end
	
	def show
		id = params[:id]
		if Exercise.exists?(id)
			@exercise = Exercise.find(id)
		else
			render html: 'Non esiste questo esercizio'
		end
	end	
	
end
