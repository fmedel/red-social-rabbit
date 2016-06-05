class AreglarPostulacion2 < ActiveRecord::Migration
  def change
  	remove_reference :apelars, :idea
  	add_column :apelars, :denuncia_id, :integer
  	add_index :apelars, :denuncia_id
  end
end
