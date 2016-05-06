class AddPerfilPublicacionRefToAdquiridos < ActiveRecord::Migration
  def change
    add_reference :adquiridos, :perfil_publicacion, index: true, foreign_key: true
  end
end
