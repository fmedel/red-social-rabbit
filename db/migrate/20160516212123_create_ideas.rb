class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :titulo 
      t.text :contenido
      t.integer :visita
      t.integer :estado
      t.integer :user

      t.timestamps null: false
    end
  end
end
