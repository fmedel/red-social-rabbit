class AddTermi < ActiveRecord::Migration
  def change
  	change_table :usuarios do |t|
  		t.string  :termino_de_uso 
  	end
  end
end
