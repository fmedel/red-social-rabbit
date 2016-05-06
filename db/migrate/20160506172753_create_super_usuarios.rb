class CreateSuperUsuarios < ActiveRecord::Migration
  def change
    create_table :super_usuarios do |t|
      t.string :nombres
      t.string :apellidos
      t.integer :rut
      t.string :email
      t.string :pasword

      t.timestamps null: false
    end
  end
end
