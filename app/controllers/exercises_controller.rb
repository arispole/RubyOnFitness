class ExercisesController < ApplicationController

	def index
		@exercises = authorize Exercise.all
		@workoutplan_id = params[:workout_plan_id]
	end
	
	def show
		id = params[:id]
		if Exercise.exists?(id)
			@exercise = authorize Exercise.find(id)
		else
			render html: 'Non esiste questo esercizio'
		end
	end	
	
end
