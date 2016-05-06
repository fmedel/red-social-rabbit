class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombreEmpresa
      t.string :emailEmpresa
      t.integer :rutEmpresa
      t.string :pasword
      t.string :emailPersona
      t.string :apellidosPersona
      t.string :nombresPersona
      t.integer :rutPersona
      
      t.timestamps null: false
    end
  end
end
