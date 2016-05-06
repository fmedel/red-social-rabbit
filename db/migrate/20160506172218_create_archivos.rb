class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.text :descripcion
      t.text :linkArchivo

      t.timestamps null: false
    end
  end
end
