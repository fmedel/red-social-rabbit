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
        redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
      end 
  end
     
    def update
      @estado= Estado.find(params[:id])
      if  user_signed_in?
        respond_to do |format|
          if @estado.update(estado_params)
            format.html { redirect_to estado_path, notice: 'la estado fue actualizada .' }
          end
        end
      else
        redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
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
          format.html { redirect_to estado_path, notice: 'estado  guardado ccorrectamente ' } 
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
      @tipo=Estado.find(params['id'])
      @idea= Idea.where("estado_id =?", @tipo)
      @denuncia = Denuncia.where("estado_id= ?", @tipo)
      @apelar = Apelar.where("estado_id= ?", @tipo)
      if (@idea.empty? and @denuncia.empty? and @apelar.empty?)
          respond_to do |format|
            @tipo.destroy
            format.html { redirect_to inicio_path, notice: 'el grado fue eliminada' }
            #format.json { head :no_content }
          end
      else
          if !@idea.empty?
            @idea.each do |user|
              user.update(estado_id: 1)
            end
          end
          if !@denuncia.empty?
            @denuncia.each do |user|
              user.update(estado_id: 1)
            end
          end
          if !a@pelar.empty?
          @apelar.each do |user|
            user.update(estado_id: 1)
            end
          end
            @tipo.destroy
            redirect_to inicio_path,  notice: 'el estado fue eliminada'
      end
    else
        redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
    end 
  end
    
    private
      def estado_filtro
        if  user_signed_in?
          if @current_user.tipo_id == 3
          else
            redirect_to inicio_path , alert: 'aceso denegado'
          end 
        else
           redirect_to registrar_path, alert: 'Tiene que estar registrado primero'
        end 
      end 
      # Never trust parameters from the scary internet, only allow the white list through.
      def estado_params
        params.require(:estado).permit(:descripcion)
      end
end
