class WelcomeController < ApplicationController
  before_action :welcome_filtro, only: [:new, :create, :datos]
  def index
  	if  user_signed_in?
  		case @current_user.tipo_id 
			when 1 
			       redirect_to index_path   
			when 2
				@denuncia = Denuncia.where("estado_id= 3 and created_at  < ( now() -interval '7 day' )").count
				@apelacion = Apelar.where('estado_id= 2' ).count
				@user = User.where('tipo_id= 1').count
				@ideas = Idea.where('estado_id= 1').count
			when 3
				@denuncia = Denuncia.where('estado_id= 3').count
				@apelacion = Apelar.where('estado_id= 2' ).count
				@user = User.where('tipo_id =1').count
				@ideas = Idea.where('estado_id= 1').count
				@moderador =User.where('tipo_id =2').count
				@administrador=User.where('tipo_id =3').count
				@tipo = Tipo.count
				@grado =Grado.count
				@estado=Estado.count
        @tipo_rubros=Trubro.count
			else
				
		end
	else
		redirect_to registrar_path
	end
  end

   def new
    if  user_signed_in?
      @user = User.new
     @tipo= params['tipo']
    else
      redirect_to registrar_path
    end 
  end

  def create
    if  user_signed_in?
     if params['tipo'] == "moderadores"
      	@user = User.new(tipo_id: 2 ,nombre_empresa: params['user']['rut_persona']  ,rut_empresa: params['user']['rut_persona'] ,email_persona:  params['user']['email'] ,apellidos_persona:  params['user']['apellidos_persona'],nombres_persona:params['user']['nombres_persona'] ,rut_persona: params['user']['rut_persona'],grado_id: 1,email: params['user']['email'] ,password:params['user']['password'])
	    if @user.save
	        redirect_to inicio_path, notice: 'user guardado ccorrectamente ' 
	    else
	        render :new 
	    end
     else
     	@user = User.new(tipo_id: 3 ,nombre_empresa: params['user']['rut_persona'] ,rut_empresa: params['user']['rut_persona'] ,email_persona:  params['user']['email'] ,apellidos_persona:  params['user']['apellidos_persona'],nombres_persona:params['user']['nombres_persona'] ,rut_persona: params['user']['rut_persona'],grado_id: 1,email: params['user']['email'] ,password:params['user']['password'])
      if @user.save
        redirect_to inicio_path, notice: 'user guardado ccorrectamente ' 
      else
        render :new 
      end
     end 
    else
      redirect_to registrar_path
    end 
  end

  def datos
    if  user_signed_in?
      case params['ver_tipos'] 
        when  'usuarios'
            @dato= User.where("tipo_id =1")
        when  'moderadores'
            @dato= User.where("tipo_id =2")
        when  'administradores'
            @dato= User.where("tipo_id =3")
        else
          redirect_to inicio_path, alert: 'acceso denegado'
      end   
    else
      redirect_to registrar_path , alert: 'Primero debe estar registrado'
    end 
  end
  private 
  def welcome_filtro
    if  user_signed_in?
      if @current_user.tipo_id == 3 
        else
          redirect_to inicio_path , alert: 'acceso denegado'
        end 
      else
         redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
  end 
end
