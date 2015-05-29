#encoding: utf-8
class PubPeriodicasController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

  def new
    @pub_periodica = PubPeriodica.new
  end

  def show
    @pub_periodica = PubPeriodica.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'PubPeriodica') ? current_user.tramites.where(tramitable_type: 'PubPeriodica') : []
  end

  def create
    @pub_periodica = PubPeriodica.new(pub_periodica_params)
    @pub_periodica.saltear_validaciones_de_presencia = true
    if @pub_periodica.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @pub_periodica
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to pub_eventual_path(@pub_periodica)
      end
    else
      render 'new'
    end
  end

  def edit
    @pub_periodica = PubPeriodica.find(params[:id])
  end

  def update
    @pub_periodica = PubPeriodica.find(params[:id])
    @pub_periodica.saltear_validaciones_de_presencia = true
    if @pub_periodica.update_attributes(pub_periodica_params)
      flash[:success] = "Formulario actualizado"
      redirect_to pub_periodica_path(@pub_periodica)
    else
      render 'edit'
    end
  end

  def destroy
    if PubPeriodica.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to pub_periodica_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  private
    def pub_periodica_params
      params.require(:pub_periodica).permit(:nombre, :apellido, :num_cuit, :detalle)
    end
end
