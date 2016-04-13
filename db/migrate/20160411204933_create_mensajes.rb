class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string :mensaje_mensaje
      t.datetime :mensaje_fecha
      t.integer :conversacion_ID

      t.timestamps null: false
    end
  end
end
