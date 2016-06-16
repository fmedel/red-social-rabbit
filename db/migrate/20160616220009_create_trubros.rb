class CreateTrubros < ActiveRecord::Migration
  def change
  	create_table :rubros do |t|
      t.timestamps null: false
    end
    create_table :trubros do |t|
      t.string :descripcion
      t.timestamps null: false
    end
    add_reference :rubros, :user, index: true, foreign_key: true
  	add_reference :rubros, :trubro, index: true, foreign_key: true
  end
end
