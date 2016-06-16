class IdeasController < ApplicationController
  ##before_filter :authenticate_user! , only: [ :new ,:create ]
  before_action :set_idea, only: [:show_duenio, :edit, :update, :destroy]
  
  Ruta_directorio_archivos = "public/archivos/"; 

  def index
    if  user_signed_in?
      @ideas = Idea.where("user_id != ? and estado_id = 1 ",@current_user)
      respond_to do | format |
        format.html #index.html.erb
        format.json {render json: @ideas}
      end
    else 
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end
  end


  def mi_ideas
    if  user_signed_in?
      @archivos=Array.new()
            #@archivos = Dir.entries(Ruta_directorio_archivos);
            Dir.foreach(Ruta_directorio_archivos) {|x|
            y= (x).to_s.split('E2R9U3HN9W')
            c= y[-1]
            z=c.split('WFEOEKBi')
            if !z[0].nil?
              if z[0 ]==(@current_user.id).to_s
                @archivos<< x
              end
            end
            }
      case params['tipo']
        when 'activa'
            @ideas = Idea.where("user_id = ? and estado_id = 1 ",@current_user)
        when 'revision'
           @Postular = Postular.select('"postulars".*,"ideas".id as "id_ideas","ideas".titulo,"ideas".estado_id').joins("FULL OUTER JOIN ideas  ON  ideas.id= postulars.idea_id").where("ideas.user_id = ? and ideas.estado_id = 1 ",@current_user)        
           @titulo_idea
         when 'denunciada'
            @ideas = Idea.select('"denuncia".*,"ideas".id as "id ideas","ideas".titulo , "ideas".contenido, "ideas".visita, "ideas".created_at as "created_at_idea", "ideas".updated_at as "updated_at ideas", "ideas".user_id').joins("FULL OUTER JOIN denuncia  ON  ideas.id= denuncia.idea_id").where("ideas.user_id = ? and ideas.estado_id = 3 ",@current_user)
        when 'eliminada'
            @ideas = Idea.where("user_id = ? and estado_id = 4 ",@current_user)
        when 'apelacion'
            @ideas = Idea.where("user_id = ? and estado_id = 2 ",@current_user)
        when 'mi_idea_lista'
            @ideas =Idea.where("user_id = ? and estado_id = 6 ", @current_user)
        else
          redirect_to registrar_path
      end
    else 
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end
  end 
  # GET /ideas/1
  # GET /ideas/1.json
def dar_de_baja
    if  user_signed_in?
      @idea = Idea.find(params['idea'])
      if @idea.update(estado_id: '4')
          redirect_to inicio_path , notice: 'La eliminacion de la idea fue realizada'
      end
    end
 end

  def show
    if  user_signed_in?
     @idea = Idea.find(params[:id])
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  # GET /ideas/new
  def new
    if  user_signed_in?
      @idea = Idea.new
    else
     redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  # GET /ideas/1/edit
  def edit
    if  user_signed_in?
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  # POST /ideas
  # POST /ideas.json
  def create
    if  user_signed_in?
      @persona= @current_user.id
      params[:idea][:user_id]  =@persona
      params[:idea][:estado_id] = 1
      params[:idea][:visita] =0
      @idea = Idea.new(idea_params)
      respond_to do |format|
        if @idea.save
          format.html { redirect_to editar_idea_path(@idea), notice: 'La idea fue creada correctamente , ahora puedes agregar archivo'}
          #format.json { render :show, status: :created, location: @idea }
        else
          format.html { render :new , alert: 'Ocurrio un error al momento de crear la idea'}
          #format.json { render json: @idea.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
   def update
      if  user_signed_in?
        respond_to do |format|
          if @idea.update(idea_params)
            format.html { redirect_to ver_idea_path(@idea), notice: 'la idea fue actualizada .' }
            format.json { render :show, status: :ok, location: @idea }
          else
            format.html { render :edit }
            format.json { render json: @idea.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    if  user_signed_in?
      respond_to do |format|
        @idea.destroy
        format.html { redirect_to inicio_url, notice: 'La idea fue eliminada' }
        #format.json { head :no_content }
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      if  user_signed_in?
      @idea = Idea.find(params[:id])
      if !@idea.blank?
        if @idea.user_id != @current_user.id
          redirect_to inicio_path, alert: 'acceso denegado para este user'
        end 
        else 
          redirect_to inicio_path, alert: 'pagina no encontrada'
        end 
      else
       redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:titulo, :contenido, :visita, :estado_id, :user_id)
    end
end
