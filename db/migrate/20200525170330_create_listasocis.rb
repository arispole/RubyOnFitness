class CreateListasocis < ActiveRecord::Migration[6.0]
# da definire oogni tipo come data ecc ... 

 def change
    create_table :listasocis do |t|
      t.string :nome
      t.string :cognome
      t.string :datasocio
      t.string :datanascita
      t.string :peso
      t.string :altezza
      t.string :sesso
      t.string :email
      t.string :indirizzo
      t.string :password
      t.string :username
      t.string :tipoabbonamento
      t.string :idtessera
      t.text :varie

      t.timestamps
    end
  end
end
