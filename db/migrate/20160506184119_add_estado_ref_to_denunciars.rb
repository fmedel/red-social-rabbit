class AddEstadoRefToDenunciars < ActiveRecord::Migration
  def change
    add_reference :denunciars, :estado, index: true, foreign_key: true
  end
end
