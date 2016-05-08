class UsuariosController < ApplicationController
	#get /usuario 
	def index
		#lista de todo los ususarios 
		@usuarios = Usuario.all
	end
	#get  /usuario/:id
	def show 
		#buscar por id
		@usuario = Usuario.find(params[:id])
	end 
	# GET /usuarios/new 
	def new 
		@ok=true
		@usuario=Usuario.new
	end 
	 #post /articles 
	 def create 
	 	pasword=params[:usuario][:pasword].to_s
	 	pasword2=params[:usuario][:pasword2].to_s
	 	@usuario =Usuario.new(nombreEmpresa: params[:usuario][:nombreEmpresa],emailEmpresa: params[:usuario][:emailEmpresa] ,rutEmpresa: params[:usuario][:rutEmpresa],nombresPersona: params[:usuario][:nombresPersona],apellidosPersona: params[:usuario][:apellidosPersona],rutPersona:params[:usuario][:rutPersona],emailPersona: params[:usuario][:emailPersona],pasword: params[:usuario][:pasword],pasword_confirmation: params[:usuario][:pasword_confirmation],termino_de_uso: params[:usuario][:termino_de_uso],grado_id: "1")
	 	if @usuario.save
	 		redirect_to @usuario
	 	else
	 		render :new
	 	end
	 end 
end
