class AddFkToDenuncia < ActiveRecord::Migration
  def change
  		add_reference :denuncia, :user, index: true, foreign_key: true
  	  	add_reference :denuncia, :idea, index: true, foreign_key: true
  	  	add_reference :denuncia, :estado, index: true, foreign_key: true
  	  	#falta la del super usuario
  end
end
