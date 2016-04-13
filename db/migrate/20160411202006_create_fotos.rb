class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :fotos_titulo
      t.string :fotos_file_nombre
      t.string :fotos_detalles

      t.timestamps null: false
    end
  end
end
