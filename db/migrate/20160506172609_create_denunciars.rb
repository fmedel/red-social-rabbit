class CreateDenunciars < ActiveRecord::Migration
  def change
    create_table :denunciars do |t|
      t.text :razon

      t.timestamps null: false
    end
  end
end
