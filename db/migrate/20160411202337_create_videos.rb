class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_titulo
      t.string :video_file_nombre
      t.integer :video_duracion
      t.string :video_formato
      t.string :video_detalles

      t.timestamps null: false
    end
  end
end
