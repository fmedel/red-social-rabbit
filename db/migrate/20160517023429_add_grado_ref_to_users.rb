class AddGradoRefToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :grado
    add_reference :users, :grado, index: true, foreign_key: true
  end
end
