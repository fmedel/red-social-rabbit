class CreateAdquiridos < ActiveRecord::Migration
  def change
    create_table :adquiridos do |t|
      t.integer :idea_ID
      t.integer :estado_ID
      t.integer :perfil1_ID
      t.integer :perfil2_ID

      t.timestamps null: false
    end
  end
end
