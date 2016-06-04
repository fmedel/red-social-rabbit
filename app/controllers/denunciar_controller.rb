class DenunciarController < ApplicationController
  def index
   if  user_signed_in?
      @denuncia = Denuncia.all
    else 
      redirect_to registrar_path
    end 
  end
  
  def show
    if  user_signed_in?
    @denuncia=Denuncia.find(params['idea'])
     # @estado= Estado.all
    end 
  end 
 
 def dar_de_baja
    if  user_signed_in?
      @idea = Idea.find(params['idea'])
      if @idea.update(estado_id: '4')
        redirect_to inicio_path 
      end
    end
 end
  
  def new
    if  user_signed_in?
      @persona= @current_user.id
      @id_idea = params['idea']
      @denuncia = Denuncia.new
    else
      redirect_to registrar_path
    end 
  end

  def create
    if  user_signed_in?
      @persona= @current_user.id
      @id_idea = params['idea']
      @razon=params['denuncia']['razon']
      @estado= '3'
      @denuncia = Denuncia.new(user_id: @persona, idea_id: @id_idea , razon: @razon , estado_id: @estado)
      respond_to do |format|
      if @denuncia.save
        format.html { redirect_to inicio_path}
        #format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        #format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def postular_params
      params.require(:denuncia).permit(:user_id, :idea_id, :estado_id,:razon)
    end
end
