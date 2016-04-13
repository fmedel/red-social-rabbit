class CreateConversaciones < ActiveRecord::Migration
  def change
    create_table :conversaciones do |t|
      t.integer :perfil1_ID
      t.integer :perfil2_ID

      t.timestamps null: false
    end
  end
end
