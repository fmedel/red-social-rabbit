class AddfkToApelar < ActiveRecord::Migration
  def change
  	  	add_reference :apelars, :idea, index: true, foreign_key: true
  	  	add_reference :apelars, :estado, index: true, foreign_key: true
  end
end
