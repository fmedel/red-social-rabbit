class AddPerfilPublicacionRefToArchivos < ActiveRecord::Migration
  def change
    add_reference :archivos, :perfil_publicacion, index: true, foreign_key: true
  end
end
