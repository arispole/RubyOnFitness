class AddNameToWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
	add_column :workout_plans, :nome, :string
  end
end
