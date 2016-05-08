class AddToken < ActiveRecord::Migration
  def change
  	change_table :usuarios do |t|
  		t.string  :pasword2 
  		t.string  :token1
  		t.string :token2
  	end
  end
end
