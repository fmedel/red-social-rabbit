class EstadoController < ApplicationController
 before_action :estado_filtro
def index
    if  user_signed_in?
      @estado= Estado.all
    else 
      redirect_to registrar_path
    end  
  end 

 def edit
    if  user_signed_in?
       @estado= Estado.find(params[:id])
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end
   def update
    @estado= Estado.find(params[:id])
     if  user_signed_in?
      respond_to do |format|
        if @estado.update(estado_params)
          format.html { redirect_to estado_path, notice: 'El estado fue actualizado' }
        end
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end
  def show
    if  user_signed_in?
           redirect_to estado_path
    else 
      redirect_to registrar_path
    end   
  end
  def new
    if  user_signed_in?
      @estado = Estado.new
    else
      redirect_to registrar_path
    end 
  end

  def create
    if  user_signed_in?
      @estado = Estado.new(estado_params)
      respond_to do |format|
      if @estado.save
        format.html { redirect_to estado_path, notice: 'El estado fue guardado correctamente ' } 
      else
        format.html { render :new }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

  private
    def estado_filtro
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
    def estado_params
      params.require(:estado).permit(:descripcion)
    end

end
