class CreateGrados < ActiveRecord::Migration
  def change
    create_table :grados do |t|
      t.string :grados_descripcion
      
      t.timestamps null: false
    end
  end
end
