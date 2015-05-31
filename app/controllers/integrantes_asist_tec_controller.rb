class IntegrantesAsistTecController < ApplicationController

	def new
		@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrante = IntegranteAsistTec.new
  end

  def show
  	@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrante = IntegranteAsistTec.find(params[:id])
  end

  def index
  	@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrantes_asist = []
    @integrantes = @asist_tec.integrantes_asist_tec
    @integrantes_asist = [@integrantes]
  end

  def create
  	@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrante = IntegranteAsistTec.new(integrante_asist_tec_params)
    if @asist_tec.integrantes_asist_tec << @integrante
      flash[:success] = "Se ha creado un integrante correctamente"
      redirect_to asist_tec_integrantes_asist_tec_path
    else
      render 'new'
    end
  end

  def edit
  	@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrante = IntegranteAsistTec.find(params[:id])
  end

  def update
  	@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrante = IntegranteAsistTec.find(params[:id])
    if @integrante.update(integrante_asist_tec_params)
      flash[:success] = "Se ha actualizado un integrante correctamente"
      redirect_to asist_tec_integrantes_asist_tec_path
    else
      render 'edit'
    end
  end

  def destroy
    @asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @asist_tec.integrantes_asist_tec.destroy(params[:id])
    if @asist_tec.save
      flash[:success] = "Se ha eliminado una integrante correctamente"
      redirect_to asist_tec_integrantes_asist_tec_path
    else
      flash.now[:failure] = "El integrante no pudo ser eliminado"
      render 'index'
    end
  end

  private

  def integrante_asist_tec_params
    params.require(:integrante_asist_tec).permit(:nombre, :apellido, :dni, :fecha_nacimiento, :domicilio, :email, :telefono, :rol)
  end

end
