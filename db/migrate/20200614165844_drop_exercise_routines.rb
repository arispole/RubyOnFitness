class DropExerciseRoutines < ActiveRecord::Migration[6.0]
  def change
	  drop_table :exercise_routines
  end
end
