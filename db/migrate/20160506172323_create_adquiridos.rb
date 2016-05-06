class CreateAdquiridos < ActiveRecord::Migration
  def change
    create_table :adquiridos do |t|

      t.timestamps null: false
    end
  end
end
