class CreateTipoArchivos < ActiveRecord::Migration
  def change
    create_table :tipo_archivos do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
