class TipoRubroController < ApplicationController
before_action  :tipo_filtro
def index
    if  user_signed_in?
      @tipo_rubro= Trubro.all
    else 
      redirect_to registrar_path
    end  
end 

 def edit
    if  user_signed_in?
       @tipo= Trubro.find(params[:id])
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

   def update
    @tipo= Trubro.find(params[:id])
     if  user_signed_in?
      respond_to do |format|
        if @tipo.update(tipo_params)
          format.html { redirect_to tipo_rubro_path, notice: 'el tipo rubros fue actualizado .' }
        end
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  def show
    if  user_signed_in?
           redirect_to tipo_path
    else 
      redirect_to registrar_path
    end   
  end

  def new
    if  user_signed_in?
      @tipo = Trubro.new
    else
      redirect_to registrar_path
    end 
  end

  def create
    if  user_signed_in?
      @tipo = Trubro.new(tipo_params)
      respond_to do |format|
      if @tipo.save
        format.html { redirect_to tipo_rubro_path, notice: 'el tipo rubros fue guardado correctamente' } 
      else
        format.html { render :new }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

def destroy
    if  user_signed_in?
      @tipo=Trubro.find(params['id'])
      @user= Rubro.where("trubro_id =?", @tipo)
      if @user.empty?
        respond_to do |format|
          @tipo.destroy
          format.html { redirect_to inicio_path, notice: 'el tipo rubro fue eliminado' }
          #format.json { head :no_content }
        end
      else
        @user.each do |user|
          user.update(trubro_id: 1)
        end
          @tipo.destroy
          redirect_to inicio_path,  notice: 'el tipo rubro fue eliminado'
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
end

  private
   def tipo_filtro
      if  user_signed_in?
        if @current_user.tipo_id == 3
        else
          redirect_to inicio_path , alert: 'acceso denegado'
        end 
      else
         redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_params
      params.require(:trubro).permit(:descripcion)
    end
end
