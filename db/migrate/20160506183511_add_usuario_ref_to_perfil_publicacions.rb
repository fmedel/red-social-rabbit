class AddUsuarioRefToPerfilPublicacions < ActiveRecord::Migration
  def change
    add_reference :perfil_publicacions, :usuario, index: true, foreign_key: true
  end
end
