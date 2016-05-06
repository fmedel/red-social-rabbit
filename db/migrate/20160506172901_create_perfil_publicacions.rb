class CreatePerfilPublicacions < ActiveRecord::Migration
  def change
    create_table :perfil_publicacions do |t|
      t.integer :visita

      t.timestamps null: false
    end
  end
end
