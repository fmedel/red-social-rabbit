class AddTipoToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :tipo, index: true, foreign_key: true, default: 0
  end
end
