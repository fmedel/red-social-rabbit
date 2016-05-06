class CreateRubros < ActiveRecord::Migration
  def change
    create_table :rubros do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
