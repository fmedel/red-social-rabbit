class CreatePerfiles < ActiveRecord::Migration
  def change
    create_table :perfiles do |t|
      t.integer :rut_perfil_empresa
      t.string :email_perfil_empresa
      t.integer :rubro_ID
      t.integer :usuario_ID
      t.timestamps null: false
    end
  end
end
