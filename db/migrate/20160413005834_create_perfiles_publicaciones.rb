class CreatePerfilesPublicaciones < ActiveRecord::Migration
  def change
    create_table :perfiles_publicaciones do |t|

      t.integer :archivos_ID
      t.integer :videos_ID
      t.integer :fotos_ID
      t.integer :ideas_ID
      t.integer :rubro_ID
      t.integer :perfil_ID
      t.integer :visitas_perfil_publicacion
      t.datetime :fecha_publicacion
      t.timestamps null: false
      
    end
  end
end
