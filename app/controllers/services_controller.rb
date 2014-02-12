class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json

  # comentado por enquanto before_filter :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @services = @user.services
    authorize! :manage, @services
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])
    @user = User.find(@service.user_id)
    authorize! :manage, @service
  end

  # GET /services/new
  def new
    @user = User.find(params[:user_id])
    @service = @user.services.buid
    authorize! :manage, @service
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @user = User.find(params[:user_id])
      @service = @user.services.create(serv_params)
      @service.user_id = current_user.id
      authorize! :manage, @service

      if @service.save
        redirect_to @service, notice: 'Servico criado com sucesso!' 
      else
        render action: 'new' 
      end
    end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    authorize! :manage, @service
      if @service.update(service_params)
        redirect_to @service, notice: 'Servico atualizado com sucesso!'
      else
        render action: 'edit'
      end
    end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end

  private
    def serv_params
      params.require(:service).permit(:name, :email)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:type, :periodicity, :description)
    end
end
