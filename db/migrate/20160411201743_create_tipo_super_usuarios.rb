class CreateTipoSuperUsuarios < ActiveRecord::Migration
  def change
    create_table :tipo_super_usuarios do |t|
      t.string :tipo_super_usuario_descripcion

      t.timestamps null: false
    end
  end
end
