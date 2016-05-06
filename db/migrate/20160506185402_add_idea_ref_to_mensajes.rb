class AddIdeaRefToMensajes < ActiveRecord::Migration
  def change
    add_reference :mensajes, :idea, index: true, foreign_key: true
  end
end
