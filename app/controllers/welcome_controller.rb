class WelcomeController < ApplicationController
  def index
    @title = "Red Rabbit Network";
  end
  def identify
  	@title ="¿Haz olvidado la contraseña?"
  	if request.post?
      if params[:user].present?
      	#comparacion con la base 
      	if params[:user]!='Error'
         nombre=params[:user]
         @nombre=nombre
         @error=false
        else
        	@error=true
        end;
      else
         @nombre=false
      end;
   end;
   if request.post?
      if params[:commit].present?
      	if params[:commit]=='Enviar token.'
      		redirect_to :controller => "welcome", :action => "index"
      	end;
      end;
    end;
  end
end