class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
