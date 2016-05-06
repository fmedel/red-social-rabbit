class AddEstadoRefToPerfilPublicacions < ActiveRecord::Migration
  def change
    add_reference :perfil_publicacions, :estado, index: true, foreign_key: true
  end
end
