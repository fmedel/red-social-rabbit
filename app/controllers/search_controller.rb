class SearchController < ApplicationController
  def create
 
  	palabra = "%#{params[:keyword]}%"

  	@users = User.where("nombre_empresa LIKE ?", palabra )
  	
  	respond_to do |format|
		  format.html { redirect_to root_path }
  		format.json { render json: @users }
  		format.js
  	end
  end
  def apelar
    
    palabra = "%#{params[:keyword]}%"

    @ideas = Idea.select('"denuncia".*,"ideas".id as "id ideas","ideas".titulo , "ideas".contenido, "ideas".visita, "ideas".created_at as "created_at idea", "ideas".updated_at as "updated_at ideas", "ideas".user_id').joins("FULL OUTER JOIN denuncia  ON  ideas.id= denuncia.idea_id").where("titulo LIKE ? AND ideas.estado_id IN (3, 5)", palabra ) #hay que cambiar

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @ideas }
      format.js
    end

  end
end
 