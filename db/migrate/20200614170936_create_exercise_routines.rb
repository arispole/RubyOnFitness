class CreateExerciseRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_routines do |t|
      t.references :workout_plan, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :serie
      t.integer :ripetizione
      t.integer :chilogrammi

      t.timestamps
    end
  end
end
