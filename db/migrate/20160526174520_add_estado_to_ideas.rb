class AddEstadoToIdeas < ActiveRecord::Migration
  def change
  	remove_column :ideas, :estado
    add_reference :ideas, :estado, index: true, foreign_key: true
  end
end
