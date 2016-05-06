class AddPerfilPublicacionRefToDenunciars < ActiveRecord::Migration
  def change
    add_reference :denunciars, :perfil_publicacion, index: true, foreign_key: true
  end
end
