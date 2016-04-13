class CreateDenuncia < ActiveRecord::Migration
  def change
    create_table :denuncia do |t|
      t.integer :perfil_ID
      t.integer :publicacion_ID
      t.string :razon_de_denuncia
      t.integer :estado_ID
      t.integer :super_ususario_ID

      t.timestamps null: false
    end
  end
end
