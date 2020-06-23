class CreateGroupLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :group_lessons do |t|
		t.references :user, null: false, foreign_key: true
		t.string :nome
		t.text :descrizione
		t.integer :posti
		t.integer :posti_disponibili
		t.datetime :inizio
		t.timestamps
    end
  end
end
