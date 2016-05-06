class AddUsuarioRefToAdquiridos < ActiveRecord::Migration
  def change
    add_reference :adquiridos, :usuario, index: true, foreign_key: true
  end
end
