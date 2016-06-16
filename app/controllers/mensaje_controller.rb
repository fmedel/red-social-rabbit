class MensajeController < ApplicationController
  before_action  :mensaje_filtro
def index
    if  user_signed_in?
      @mensaje=Mensaje.where("idea_id=?",params["idea"])
      @mensaje2 = Mensaje.new
    else 
      redirect_to registrar_path
    end  
end 

def new
    if  user_signed_in?
      @mensaje2 = Mensaje.new

    else
      redirect_to registrar_path
    end 
end

def create
    if  user_signed_in?
      @user_id=Idea.find(params["idea"])
      @datos=params[:mensaje][:mensaje]
      if @current_user.id==@user_id.id
      	@visto_duenio=true
      	@visto_destinatario=false
      else
      	@visto_duenio=false
      	@visto_destinatario=true
      end
      @mensaje2 = Mensaje.new(user_id: @user_id.id , idea_id: params["idea"] , mensaje: @datos ,visto_duenio: @visto_duenio, visto_destinatario: @visto_destinatario )
      respond_to do |format|
      if @mensaje2.save
        format.html { redirect_to mensaje_path(params["idea"]), notice: 'el mensaje fue enviado correctamente' } 
      else
        format.html { render :new }
      end
    end
    else
      redirect_to registrar_path
    end 
end

private
   def mensaje_filtro
      if  user_signed_in?
      	@aquirido =Aquirido.where("idea_id=?",params["idea"])
      	@aquirido.each do |aquirido|
      		if ((aquirido.user_id==@current_user.id )or (aquirido.idea.user_id==@current_user.id))
      			
	      	else
	      		redirect_to inicio_path, alert: 'Acceso denegado'
	      	end
      	end
      else
         redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
    end 
end


