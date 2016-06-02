class PostularController < ApplicationController
  def index
    if  user_signed_in?
      
    else 
      redirect_to registrar_path
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
      @oferta=params['postular']['oferta']
      @postular = Postular.new(user_id: @persona, idea_id: @id_idea , oferta: @oferta)
      respond_to do |format|
      if @postular.save
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
      params.require(:postular).permit(:user_id, :idea_id, :oferta)
    end
end
