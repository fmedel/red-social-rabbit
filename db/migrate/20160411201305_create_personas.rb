class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :personas_nombre
      t.string :personas_apellido
      t.integer :personas_rut
      t.string :personas_email

      t.timestamps null: false
    end
  end
end
