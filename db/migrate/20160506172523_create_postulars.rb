class CreatePostulars < ActiveRecord::Migration
  def change
    create_table :postulars do |t|

      t.timestamps null: false
    end
  end
end
