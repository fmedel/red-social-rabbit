 
class UsersEditarController < ApplicationController
  before_filter :authenticate_user! 

  def index
    if  user_signed_in?
      @user = User.all
      @grados= Grado.all
    else 
      redirect_to registrar_path
    end 
  end

  def show
    if  user_signed_in?

    else
    end 
  end

  def edit
    if  user_signed_in?
    else
      redirect_to registrar_path
    end 
  end

   def update
     if  user_signed_in?
      respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to inicio_path }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:user).permit(:nombreEmpresa, :rutEmpresa, :emailPersona, :apellidosPersona, :nombresPersona, :rutPersona, :grado_id , :email, :password, :password_confirmation)
    end	
end
