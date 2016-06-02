class SearchController < ApplicationController
  def create

  	palabra = "%#{params[:keyword]}%"

  	@users = User.where("nombre_empresa LIKE ?",palabra)
  	
  	respond_to do |format|
		  format.html { redirect_to root_path }
  		format.json { render json: @users }
  		format.js
  	end
  end
end
