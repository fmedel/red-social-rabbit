class AddDestinatarioRefToMensajes < ActiveRecord::Migration
  def change
    add_reference :mensajes, :destinatario, index: true, foreign_key: true
  end
end
