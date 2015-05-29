#encoding: utf-8
class BecasEstudiosController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

  def new
    @beca_estudios = BecaEstudios.new
  end

  def show
    @beca_estudios = BecaEstudios.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'BecaEstudios') ? current_user.tramites.where(tramitable_type: 'BecaEstudios') : []
  end

  def create
    @beca_estudios = BecaEstudios.new(beca_estudios_params)
    @beca_estudios.saltear_validaciones_de_presencia = true
    if @beca_estudios.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @beca_estudios


      current_user.tramites_create

      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to beca_estudios_path(@beca_estudios)
      end
    else
      render 'new'
    end
  end

  def edit
    @beca_estudios = BecaEstudios.find(params[:id])
  end

  def update
    @beca_estudios = BecaEstudios.find(params[:id])
    @beca_estudios.saltear_validaciones_de_presencia = true
    if @beca_estudios.update_attributes(beca_estudios_params)
      flash[:success] = "Formulario actualizado"
      redirect_to beca_artis_path(@beca_estudios)
    else
      render 'edit'
    end
  end

  def destroy
    if BecaEstudios.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to beca_estudios_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  private
    def beca_estudios_params
      params.require(:beca_estudios).permit(:nombre, :apellido, :num_cuit, :detalle)
    end
end