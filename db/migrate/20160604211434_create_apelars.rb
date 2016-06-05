class CreateApelars < ActiveRecord::Migration
  def change
    create_table :apelars do |t|
      t.text :razon

      t.timestamps null: false
    end
  end
end
