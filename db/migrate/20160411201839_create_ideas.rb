class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :Idea_blog

      t.timestamps null: false
    end
  end
end
