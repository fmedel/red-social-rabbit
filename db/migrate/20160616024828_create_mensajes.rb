class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.text :mensaje
      t.boolean :visto_duenio
      t.boolean :visto_destinatario
      t.timestamps null: false
    end
  end
end
