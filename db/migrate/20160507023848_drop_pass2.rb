class DropPass2 < ActiveRecord::Migration
  def change
  	remove_column :usuarios , :pasword2
  end
end
