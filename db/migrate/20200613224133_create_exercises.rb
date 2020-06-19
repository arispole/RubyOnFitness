class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :nome
      t.text :descrizione
      t.string :gruppo_muscolare
      t.binary :pittogramma

      t.timestamps
    end
  end
end
