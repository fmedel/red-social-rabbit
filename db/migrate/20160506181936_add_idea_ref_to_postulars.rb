class AddIdeaRefToPostulars < ActiveRecord::Migration
  def change
    add_reference :postulars, :idea, index: true, foreign_key: true
  end
end
