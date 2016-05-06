class AddTipoSuperUsuariRefToSuperUsuarios < ActiveRecord::Migration
  def change
    add_reference :super_usuarios, :tipo_super_usuario, index: true, foreign_key: true
  end
end
