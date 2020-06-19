class CreateWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
