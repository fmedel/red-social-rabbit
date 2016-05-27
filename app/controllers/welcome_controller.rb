class WelcomeController < ApplicationController
  def index
  	if  user_signed_in?
  		
  		redirect_to '/ver_idea'
	else
		redirect_to registrar_path
	end
  end
end
