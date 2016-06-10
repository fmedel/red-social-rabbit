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

    @ideas = Idea.where("titulo LIKE ?", palabra ) #hay que cambiar

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @ideas }
      format.js
    end

  end
end
