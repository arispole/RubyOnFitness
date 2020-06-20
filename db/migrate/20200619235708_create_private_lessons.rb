class CreatePrivateLessons < ActiveRecord::Migration[6.0]

  def change
    create_table :private_lessons do |t|
		t.references :user, null: false, foreign_key: true
		t.datetime :inizio
		t.boolean :booked, default: false
		t.timestamps
    end
  end
  
end
