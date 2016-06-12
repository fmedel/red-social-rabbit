class AddFkToAdquiridos < ActiveRecord::Migration
  def change
  	add_reference :aquiridos, :user, index: true, foreign_key: true
  	add_reference :aquiridos, :idea, index: true, foreign_key: true
  end
end
