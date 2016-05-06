class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.text :mensaje

      t.timestamps null: false
    end
  end
end
