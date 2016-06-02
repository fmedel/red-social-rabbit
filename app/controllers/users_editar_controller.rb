 
class UsersEditarController < ApplicationController
  before_filter :authenticate_user! 
  def tipo
    if  user_signed_in?
      @user = User.find(current_user.id)
      @grados= Grado.all
    else 
      redirect_to registrar_path
    end 
  end

  #def index
    #if  user_signed_in?
      #@user = User.find(current_user.id)
      #@grados= Grado.all
   # else 
      #redirect_to registrar_path
    #end 
  #end

  def show
    if  user_signed_in?
       @grados= Grado.all
      @user = User.find(current_user.id)
    else
    end 
  end

  def edit
    if  user_signed_in?
       @grados= Grado.all
       @user = User.find(current_user.id)
    else
      redirect_to registrar_path
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
      redirect_to registrar_path
    end 
  end

  private
      def set_user
      @idea = User.find(current_user.id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre_empresa, :rut_empresa, :email_persona, :apellidos_persona, :nombres_persona, :rut_persona, :grado_id , :email, :password, :password_confirmation)
    end	
end
