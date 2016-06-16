class AddFkToMensaje < ActiveRecord::Migration
  def change
  	add_reference :mensajes, :user, index: true, foreign_key: true
  	add_reference :mensajes, :idea, index: true, foreign_key: true
  end
end
