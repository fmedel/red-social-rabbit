class AddTipoRefToArchivos < ActiveRecord::Migration
  def change
    add_reference :archivos, :tipo_archivo, index: true, foreign_key: true
  end
end
