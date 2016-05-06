class AddIdeaRefToPerfilPublicacions < ActiveRecord::Migration
  def change
    add_reference :perfil_publicacions, :idea, index: true, foreign_key: true
  end
end
