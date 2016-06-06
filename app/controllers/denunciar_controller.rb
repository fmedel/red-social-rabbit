class DenunciarController < ApplicationController
   before_action :denuncia_filtro, only: [:index, :show, :dar_de_baja, :rechasar]
  def index
   if  user_signed_in?
      @denuncia = Denuncia.where(estado_id: '3')
    else 
       redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
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
        @denuncia =Denuncia.find(params['denuncia'])
        if @denuncia.update(estado_id: '4')
          redirect_to inicio_path , notice: 'La eliminacion de la idea fue echa'
        end      
      end
    end
 end

 def rechasar
    if  user_signed_in?
      @idea = Idea.find(params['idea'])
      if @idea.update(estado_id: '1')
        @denuncia =Denuncia.find(params['denuncia'])
        if @denuncia.update(estado_id: '6')
          redirect_to inicio_path , notice: 'La denuncia fue rechasada '
        end      
      end
    end
 end 

  def new
    if  user_signed_in?
      @persona= @current_user.id
      @id_idea = params['idea']
      @denuncia = Denuncia.new
    else
       redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
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
        @idea = Idea.find(@id_idea)
        if @idea.update(estado_id: '3')
          format.html { redirect_to inicio_path , notice: 'La denuncia  fue echa '}
        #format.json { render :show, status: :created, location: @idea }
        end
      else
        format.html { render :new }
        #format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
    else
       redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
    end 
  end

  private
    def denuncia_filtro
      if  user_signed_in?
        if @current_user.tipo_id == 2 
        else
          redirect_to inicio_path , alert: 'aceso denegado'
        end 
      else
         redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
      end 
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def denuncia_params
      params.require(:denuncia).permit(:user_id, :idea_id, :estado_id,:razon)
    end
end
