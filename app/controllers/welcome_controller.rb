class WelcomeController < ApplicationController
  def index
  	if  user_signed_in?
  		redirect_to  ideas_path
	else
		redirect_to registrar_path
	end
  end
end
