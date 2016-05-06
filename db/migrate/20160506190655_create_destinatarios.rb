class CreateDestinatarios < ActiveRecord::Migration
  def change
    create_table :destinatarios do |t|

      t.timestamps null: false
    end
  end
end
