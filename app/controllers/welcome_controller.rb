class WelcomeController < ApplicationController
  def index
  	if  user_signed_in?
  		case @current_user.tipo_id 
			when 1 
			       redirect_to index_path   
			when 2
				@denuncia = Denuncia.where('estado_id= 3').count
				@apelacion = Apelar.where('estado_id= 2' ).count
				@user = User.where('tipo_id= 1').count
				@ideas = Idea.where('estado_id= 1').count
			when 3
				@denuncia = Denuncia.where('estado_id= 3').count
				@apelacion = Apelar.where('estado_id= 2' ).count
				@user = User.where('tipo_id =1').count
				@ideas = Idea.where('estado_id= 1').count
				@moderadores =User.where('tipo_id =3').count
				@administradores=User.where('tipo_id =2').count
				@tipo = Tipo.count
				@grado =Grado.count
				@estado=Estado.count
			else
				
		end
	else
		redirect_to registrar_path
	end
  end
end
