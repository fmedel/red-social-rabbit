class SearchController < ApplicationController
  def create

  	palabra = "%#{params[:keyword]}%"

  	@users = User.where("nombre_empresa LIKE ? and tipo_id = 0 ", palabra )
  	
  	respond_to do |format|
		  format.html { redirect_to root_path }
  		format.json { render json: @users }
  		format.js
  	end
  end
end
