#encoding: utf-8
class PubEventualesController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

  def new
    @pub_eventual = PubEventual.new
  end

  def show
    @pub_eventual = PubEventual.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'PubEventual') ? current_user.tramites.where(tramitable_type: 'PubEventual') : []
  end

  def create
    @pub_eventual = PubEventual.new(pub_eventual_params)
    @pub_eventual.saltear_validaciones_de_presencia = true
    if @pub_eventual.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @pub_eventual
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to pub_eventual_path(@pub_eventual)
      end
    else
      render 'new'
    end
  end

  def edit
    @pub_eventual = PubEventual.find(params[:id])
  end

  def update
    @pub_eventual = PubEventual.find(params[:id])
    @pub_eventual.saltear_validaciones_de_presencia = true
    if @pub_eventual.update_attributes(pub_eventual_params)
      flash[:success] = "Formulario actualizado"
      redirect_to pub_eventual_path(@pub_eventual)
    else
      render 'edit'
    end
  end

  def destroy
    if PubEventual.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to pub_eventual_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  private
    def pub_eventual_params
      params.require(:pub_eventual).permit(:nombre, :apellido, :num_cuit, :detalle)
    end
end
