class IdeasController < ApplicationController
  before_filter :authenticate_user! , only: [ :new ,:create ]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  # GET /ideas
  # GET /ideas.json
  def index
    if  user_signed_in?
      @ideas = Idea.where("user_id != ? and estado_id = 1 ",@current_user)
      respond_to do | format |
        format.html #index.html.erb
        format.json {render json: @ideas}
      end
    else 
      redirect_to registrar_path
    end 
  end
  def mi_ideas
    if  user_signed_in?
      @ideas = Idea.where("user_id = ? ",@current_user)
    else 
      redirect_to registrar_path
    end
  end 
  # GET /ideas/1
  # GET /ideas/1.json
  def show
    if  user_signed_in?
     # @estado= Estado.all
    else
    end 
  end

  # GET /ideas/new
  def new
    if  user_signed_in?
      @idea = Idea.new
    else
      redirect_to registrar_path
    end 
  end

  # GET /ideas/1/edit
  def edit
    if  user_signed_in?
    else
      redirect_to registrar_path
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
        format.html { redirect_to ver_idea_path(@idea)}
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
   def update
     if  user_signed_in?
      respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to ver_idea_path(@idea), notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to registrar_path
    end 
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    if  user_signed_in?
      respond_to do |format|
        format.html { redirect_to inicio_url, notice: 'Idea was successfully destroyed. X.X' }
        format.json { head :no_content }
      end
    else
      redirect_to registrar_path
    end 
    @idea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:titulo, :contenido, :visita, :estado_id, :user_id)
    end
end
