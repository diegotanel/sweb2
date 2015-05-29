#encoding: utf-8
class ProsInvesController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

  def new
    @pro_inves = ProInves.new
  end

  def show
    @pro_inves = ProInves.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'ProInves') ? current_user.tramites.where(tramitable_type: 'ProInves') : []
  end

  def create
    @pro_inves = ProInves.new(pro_inves_params)
    @pro_inves.saltear_validaciones_de_presencia = true
    if @pro_inves.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @pro_inves
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to pro_inves_path(@pro_inves)
      end
    else
      render 'new'
    end
  end

  def edit
    @pro_inves = ProInves.find(params[:id])
  end

  def update
    @pro_inves = ProInves.find(params[:id])
    @pro_inves.saltear_validaciones_de_presencia = true
    if @pro_inves.update_attributes(pro_inves_params)
      flash[:success] = "Formulario actualizado"
      redirect_to pro_inves_path(@pro_inves)
    else
      render 'edit'
    end
  end

  def destroy
    if ProInves.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to pro_inves_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  private
    def pro_inves_params
      params.require(:pro_inves).permit(:nombre, :apellido, :num_cuit, :detalle)
    end
end
