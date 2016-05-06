class AddUsuario1RefToMensajes < ActiveRecord::Migration
  def change
    add_reference :mensajes, :usuario, index: true, foreign_key: true
  end
end
