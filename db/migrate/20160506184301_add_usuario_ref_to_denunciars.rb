class AddUsuarioRefToDenunciars < ActiveRecord::Migration
  def change
    add_reference :denunciars, :usuario, index: true, foreign_key: true
  end
end
