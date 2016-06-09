 
class UsersEditarController < ApplicationController
  #before_filter :authenticate_user! 
  def  tipo
    if (params["tipo"]=="empresa"|| params["tipo"]=="encargado" || params["tipo"]=="rubros"|| params["tipo"]=="clave") 
      if  user_signed_in?
        @user = User.find(current_user.id)
        @grados= Grado.all
      else 
           redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
      end 
    else
      redirect_to registrar_path, alert: 'aceso denegado'
    end 
  end

  def index
    if  user_signed_in?
      @user = User.find(params["perfil"])
      @grados= Grado.all
    else 
        redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
    end 
  end

  def show
    if  user_signed_in?
       @grados= Grado.all
      @user = User.find(current_user.id)
    end 
  end

  def edit
    if  user_signed_in?
       @grados= Grado.all
       @user = User.find(current_user.id)
    else
        redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
    end 
  end

   def update
       if  user_signed_in?
         @user = User.find(current_user.id)
        respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to inicio_path } 
        else
          format.html { render :edit }
        end
        end
        else
            redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
        end 
  end

  def sing_up
    redirect_to registrar_path, alert: 'aceso denegado'
  end 

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre_empresa, :rut_empresa, :email_persona, :apellidos_persona, :nombres_persona, :rut_persona, :grado_id , :email, :password, :password_confirmation)
    end	
end
