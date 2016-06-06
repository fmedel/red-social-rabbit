class WelcomeController < ApplicationController
  def index
  	if  user_signed_in?
  		case @current_user.tipo_id 
			when 0 
			       redirect_to index_path   
			when 1
			 	   
			when 2 

			else
				
		end
	else
		redirect_to registrar_path
	end
  end
end
