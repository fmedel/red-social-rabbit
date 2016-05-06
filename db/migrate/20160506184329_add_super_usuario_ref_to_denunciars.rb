class AddSuperUsuarioRefToDenunciars < ActiveRecord::Migration
  def change
    add_reference :denunciars, :super_usuario, index: true, foreign_key: true
  end
end
