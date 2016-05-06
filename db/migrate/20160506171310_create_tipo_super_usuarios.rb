class CreateTipoSuperUsuarios < ActiveRecord::Migration
  def change
    create_table :tipo_super_usuarios do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
