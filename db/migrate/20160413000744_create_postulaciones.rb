class CreatePostulaciones < ActiveRecord::Migration
  def change
    create_table :postulaciones do |t|
      t.integer :idea_ID
      t.integer :persona_ID

      t.timestamps null: false
    end
  end
end
