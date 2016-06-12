class PostularController < ApplicationController
  def index
    if  user_signed_in?
      
    else 
      redirect_to registrar_path , notice: "Primero debe estar registrado "
    end 
  end
 
  def new
    if  user_signed_in?
      @persona= @current_user.id
      @id_idea = params['idea']
      @postular = Postular.new
    else
      redirect_to registrar_path
    end 
  end

  def create
    if  user_signed_in?
      @persona= @current_user.id
      @id_idea = params['idea']
      @idea =Idea.find(@id_idea)
      @visita= (@idea.visita).to_i
      @visita=@visita+1
      @oferta=params['postular']['oferta']
      @postular = Postular.new(user_id: @persona, idea_id: @id_idea , oferta: @oferta)
      respond_to do |format|
      if @postular.save
        @idea.update(visita: @visita)
        format.html { redirect_to inicio_path, notice: "la postulacion fue hecha "}
      else
        format.html { render :new }
      end
    end
    else
      redirect_to registrar_path , alert: "Primero debe estar registrado"
    end 
  end
  def aceptar_postulacion
    if  user_signed_in?
      @id_idea = params['idea']
      @id_user = params['user']
      @aceptar = Aquirido.new(user_id: @id_user, idea_id: @id_idea) 
      if @aceptar.save
        @idea =Idea.find(@id_idea)
        @idea.update(estado_id: 6)
        redirect_to inicio_path, notice: "la acceptacion de la postulacion fue hecha "
      else
        edirect_to inicio_path , alert: "Errpr al registrar la acetacion de la postulacion"
      end
    else
        redirect_to registrar_path , alert: "Primero debe estar registrado"
    end 
  end 
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def postular_params
      params.require(:postular).permit(:user_id, :idea_id, :oferta)
    end
    def  filtros_postlar
      #filtrar  por id != al id de la idea 
      #tiene que ser tipo == 1
      #tiene que estar registrado 
      #tiene que estar activa la idea
      #si ya esta postulado sacarlo de ahy  
    end
end
