class CreateAquiridos < ActiveRecord::Migration
  def change
    create_table :aquiridos do |t|

      t.timestamps null: false
    end
  end
  
end
