class GradoController < ApplicationController
 before_action :grado_filtro
def index
    if  user_signed_in?
      @grado= Grado.all
    else 
      redirect_to registrar_path
    end  
  end 

 def edit
    if  user_signed_in?
       @grado= Grado.find(params[:id])
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end
   def update
    @grado= Grado.find(params[:id])
     if  user_signed_in?
      respond_to do |format|
        if @grado.update(grado_params)
          format.html { redirect_to grado_path, notice: 'El grado fue actualizado' }
        end
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end
  def show
    if  user_signed_in?
           redirect_to grado_path
    else 
      redirect_to registrar_path
    end   
  end
  def new
    if  user_signed_in?
      @grado = Grado.new
    else
      redirect_to registrar_path
    end 
  end

  def create
    if  user_signed_in?
      @grado = Grado.new(grado_params)
      respond_to do |format|
      if @grado.save
        format.html { redirect_to grado_path, notice: 'El grado fue guardado correctamente ' } 
      else
        format.html { render :new }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

  private
   def grado_filtro
      if  user_signed_in?
        if @current_user.tipo_id == 3
        else
          redirect_to inicio_path , alert: 'Acceso denegado'
        end 
      else
         redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def grado_params
      params.require(:grado).permit(:descripcion)
    end
end
