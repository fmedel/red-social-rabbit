class ApelarController < ApplicationController
 before_action :apelar_filtro, only: [:index, :show, :apelar_idea, :rechasar]
 def index
   if  user_signed_in?
      @apelar = Apelar.where(estado_id: '2')
    else 
       redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
    end 
  end 
  
  def show
    if  user_signed_in?
    @apelar=Apelar.find(params['denunciar'])
    end 
  end 

 def rechasar_apelacion
    if  user_signed_in?
      @idea = Idea.find(params['denunciar'])
      if @idea.update(estado_id: '4') 
          @denuncia=Denuncia.find( params['id_denuncia'])
        if @denuncia.update(estado_id: '4')
          @apelar=Apelar.find( params['id_apelar'])
          if @apelar.update(estado_id: '4')
            redirect_to inicio_path , notice: 'La apelacion de la idea fue rechasada'
          end
        end
      end
    end
 end
 
 def apelar_idea
    if  user_signed_in?
      @idea = Idea.find(params['denunciar'])
      if @idea.update(estado_id: '1') 
          @denuncia=Denuncia.find( params['id_denuncia'])
        if @denuncia.update(estado_id: '1')
          @apelar=Apelar.find( params['id_apelar'])
          if @apelar.update(estado_id: '1')
            redirect_to inicio_path , notice: 'La apelacion fue aceptada '
          end
        end
      end
    end
 end
  
  def new
    if  user_signed_in?
      @id_idea = params['denunciar']
      @apelar = Apelar.new
    else
       redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
    end 
  end

  def create
    if  user_signed_in?
      @id_denunciar = params['denunciar']
      @razon=params['apelar']['razon']
      @estado= '2'
      @apelar = Apelar.new(denuncia_id: @id_denunciar , razon: @razon , estado_id: @estado)
      respond_to do |format|
      if @apelar.save
        @denuncia = Denuncia.find(@id_denunciar) 
        if @denuncia.update(estado_id: @estado)
           @idea = Idea.find(@denuncia.idea_id)
            if @idea.update(estado_id: @estado)
            format.html { redirect_to inicio_path ,  notice: 'La apelacion fue echa'}
          end
        end
        #format.json { render :show, status: :created, location: @idea }
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
   def apelar_filtro
      if  user_signed_in?
        if @current_user.tipo_id == 2 or @current_user.tipo_id == 3
        else
          redirect_to inicio_path , alert: 'aceso denegado'
        end 
      else
         redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
      end 
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def apelar_params
      params.require(:apelar).permit(:denunciar_id, :estado_id,:razon)
    end
end
