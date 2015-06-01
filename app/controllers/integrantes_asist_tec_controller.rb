class IntegrantesAsistTecController < ApplicationController

	def new
		@asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    @integrante = IntegranteAsistTec.new
    cargar_datos_integrante(@buscado)
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
    	cargar_datos_integrante
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

  def buscador
    @asist_tec = AsistTec.find_by_id(params[:asist_tec_id])
    # @buscado = nil
    #if @asist_tec
    #   @persona = buscar_persona(params[:numero_cuil_cuit])
    # end
    # if @buscado.nil?
    #   flash[:error] = "No se encontro a ninguna persona con ese cuil o cuit"
    #   render 'buscador'
    # else
    #   flash[:success] = "Se encontro a un integrante con ese cuil/cuit"
    #   redirect_to new_asist_tec_integrante_asist_tec_path(@asist_tec, @buscado)
    # end
  end

  def buscar_persona
  	@buscado = integrante(params[:numero_cuil_cuit])
  	if @buscado.nil?
      flash[:error] = "No se encontro a ninguna persona con ese cuil o cuit"
      render 'buscador'
    else
      flash[:success] = "Se encontro a un integrante con ese cuil/cuit"
      redirect_to new_asist_tec_integrante_asist_tec_path(@asist_tec, @buscado)
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

  def cargar_datos_integrante(buscado)
      ActiveRecord::Base.establish_connection(:inteatro_db_prueba).connection
      @nombre_integrante = buscado["NOMBRE"].squish
      @apellido_integrante = buscado["APELLIDO"]
      @num_cuit_integrante = buscado["CUIL"].to_i.to_s
      @fecha_nacimiento_integrante = buscado["FECHNAC"]
      @domicilio_integrante = buscado["DOMIPART"]
      @email_integrante = buscado["EMAIL"].squish
      @telefono_integrante = buscado["TELEPART"]
      ActiveRecord::Base.establish_connection(:development).connection
    end

  def integrante(num_cuit)
   	ActiveRecord::Base.establish_connection(:inteatro_db_prueba).connection
    query = "select * from REGISDIG where cuil = #{num_cuit}"
    result = ActiveRecord::Base.connection.select_all(query)
    resultado = result.to_hash[0]
    ActiveRecord::Base.establish_connection(:development).connection
    return resultado
  end

end
