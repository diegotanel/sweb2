#encoding: utf-8
class BecasGestionController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

  def new
    @beca_gestion = BecaGestion.new
  end

  def show
    @beca_gestion = BecaGestion.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'BecaGestion') ? current_user.tramites.where(tramitable_type: 'BecaGestion') : []
  end

  def create
    @beca_gestion = BecaGestion.new(beca_gestion_params)
    @beca_gestion.saltear_validaciones_de_presencia = true
    if @beca_gestion.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @beca_gestion
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to beca_estudios_path(@beca_gestion)
      end
    else
      render 'new'
    end
  end

  def edit
    @beca_gestion = BecaGestion.find(params[:id])
  end

  def update
    @beca_gestion = BecaGestion.find(params[:id])
    @beca_gestion.saltear_validaciones_de_presencia = true
    if @beca_gestion.update_attributes(beca_gestion_params)
      flash[:success] = "Formulario actualizado"
      redirect_to beca_gestion_path(@beca_gestion)
    else
      render 'edit'
    end
  end

  def destroy
    if BecaGestion.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to beca_gestion_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  private
    def beca_gestion_params
      params.require(:beca_gestion).permit(:nombre, :apellido, :num_cuit, :detalle)
    end
end

