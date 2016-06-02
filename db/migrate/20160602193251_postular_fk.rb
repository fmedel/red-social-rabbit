class PostularFk < ActiveRecord::Migration
  def change
  	  add_reference :postulars, :user, index: true, foreign_key: true
  	  add_reference :postulars, :idea, index: true, foreign_key: true
  end
end
