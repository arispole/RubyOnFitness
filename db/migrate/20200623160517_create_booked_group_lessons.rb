class CreateBookedGroupLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_group_lessons do |t|
	  t.references :group_lesson, null: false, foreign_key: true
	  t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
