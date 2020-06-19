class ChangeIntegerLimitInUsers < ActiveRecord::Migration[6.0]
  def change
	change_column :users, :id, :integer, limit: 12
  end
end
