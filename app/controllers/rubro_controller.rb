class RubroController < ApplicationController
def new
    if  user_signed_in?
      @Rubro = Rubro.new
    else
       redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
end
	def create
    if  user_signed_in?
      @persona= @current_user.id
      @Rubro = Rubro.new(user_id: @persona,trubro_id: params[:rubro][:trubro_id])
      if @Rubro.save
          redirect_to tipo_perfil_path( tipo: "rubros"), notice: 'El rubro fue añadido correctamente'
          #format.json { render :show, status: :created, location: @idea }
      else
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  def destroy
    if  user_signed_in?
      @rubro=Rubro.find(params["id"])
      respond_to do |format|
        @rubro.destroy
        format.html { redirect_to tipo_perfil_path( tipo: "rubros"), notice: 'El rubro fue eliminada' }
        #format.json { head :no_content }
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end
end
