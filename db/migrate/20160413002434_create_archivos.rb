class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.string :link_archivos
      t.string :descripcion_archivo

      t.timestamps null: false
    end
  end
end
