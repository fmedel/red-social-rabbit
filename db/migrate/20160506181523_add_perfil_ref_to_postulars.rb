class AddPerfilRefToPostulars < ActiveRecord::Migration
  def change
    add_reference :postulars, :usuario, index: true, foreign_key: true
  end
end
