class CreateGrados < ActiveRecord::Migration
  def change
    create_table :grados do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
