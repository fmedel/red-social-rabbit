class AddTextToPostular < ActiveRecord::Migration
  def change
  	add_column :postulars, :oferta, :string, default: "", null: false
  end
end
