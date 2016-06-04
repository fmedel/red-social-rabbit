class CreateDenuncia < ActiveRecord::Migration
  def change
    create_table :denuncia do |t|
      t.text :razon

      t.timestamps null: false
    end
  end
end
