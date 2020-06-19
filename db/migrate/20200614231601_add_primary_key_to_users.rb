class AddPrimaryKeyToUsers < ActiveRecord::Migration[6.0]
  def change
	change_column :users, :id, :integer, limit: 12, :primary_key => true,  auto_increment: true
  end
end
