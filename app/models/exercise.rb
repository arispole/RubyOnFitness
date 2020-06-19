class Exercise < ApplicationRecord
	has_many :exercise_routines
	has_many :workout_plans, through: :exercise_routines
end
