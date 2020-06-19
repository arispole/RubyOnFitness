class ExerciseRoutine < ApplicationRecord
  belongs_to :workout_plan
  belongs_to :exercise
end
