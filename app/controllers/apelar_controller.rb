class ApelarController < ApplicationController
 def index
   if  user_signed_in?
      @apelar = Apelar.where(estado_id: '2')
    else 
      redirect_to registrar_path
    end 
  end 
  
  def show
    if  user_signed_in?
    @apelar=Apelar.find(params['denunciar'])
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
            redirect_to inicio_path 
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
      redirect_to registrar_path
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
            format.html { redirect_to inicio_path}
          end
        end
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
    def apelar_params
      params.require(:apelar).permit(:denunciar_id, :estado_id,:razon)
    end
end
