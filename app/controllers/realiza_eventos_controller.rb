#encoding: utf-8
class RealizaEventosController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

  def new
    @realiza_evento = RealizaEvento.new
  end

  def show
    @realiza_evento = RealizaEvento.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'RealizaEvento') ? current_user.tramites.where(tramitable_type: 'RealizaEvento') : []
  end

  def create
    @realiza_evento = RealizaEvento.new(realiza_evento_params)
    @realiza_evento.saltear_validaciones_de_presencia = true
    if @realiza_evento.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @realiza_evento
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to realiza_evento_path(@realiza_evento)
      end
    else
      render 'new'
    end
  end

  def edit
    @realiza_evento = RealizaEvento.find(params[:id])
  end

  def update
    @realiza_evento = RealizaEvento.find(params[:id])
    @realiza_evento.saltear_validaciones_de_presencia = true
    if @realiza_evento.update_attributes(realiza_evento_params)
      flash[:success] = "Formulario actualizado"
      redirect_to realiza_evento_path(@realiza_evento)
    else
      render 'edit'
    end
  end

  def destroy
    if RealizaEvento.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to realiza_evento_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  private
    def realiza_evento_params
      params.require(:realiza_evento).permit(:nombre, :apellido, :num_cuit, :detalle)
    end
end
