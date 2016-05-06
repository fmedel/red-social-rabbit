class AddGradoRefToUsuarios < ActiveRecord::Migration
  def change
    add_reference :usuarios, :grado, index: true, foreign_key: true
  end
end
