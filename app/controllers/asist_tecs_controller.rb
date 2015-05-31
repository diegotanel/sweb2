#encoding: utf-8
class AsistTecsController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update, :enviar]

  def new
    @asist_tec = AsistTec.new
    ActiveRecord::Base.establish_connection(:inteatro_db_prueba).connection
    query = "select * from REGISDIG where cuil = 20299050883"
    result = ActiveRecord::Base.connection.select_all(query)
    resultado = result.to_hash[0]
    @nombre_responsable = resultado["NOMBRE"]
    @apellido_responsable = resultado["APELLIDO"]
    @num_cuit_responsable = resultado["CUIL"]
    @domicilio_responsable = resultado["DOMIPART"]
    @localidad_responsable = resultado["LOCALIDAD"]
    @provincia_responsable = resultado["PROVINCIA"]
    @codigo_postal_responsable = resultado["COPOST"]
    @email_responsable = resultado["EMAIL"]
    @telefono_responsable = resultado["TELEPART"]
    ActiveRecord::Base.establish_connection(:development).connection
  end

  def show
    @asist_tec = AsistTec.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'AsistTec') ? current_user.tramites.where(tramitable_type: 'AsistTec') : []
  end

  def create
    @asist_tec = AsistTec.new(asist_tec_params)
    @asist_tec.saltear_validaciones_de_presencia = true
    if @asist_tec.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @asist_tec
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to asist_tec_integrantes_asist_tec_path(@asist_tec)
      end
    else
      render 'new'
    end
  end

  def edit
    @asist_tec = AsistTec.find(params[:id])
  end

  def update
    @asist_tec = AsistTec.find(params[:id])
    @asist_tec.saltear_validaciones_de_presencia = true
    if @asist_tec.update_attributes(asist_tec_params)
      flash[:success] = "Solicitud actualizada"
      redirect_to asist_tec_integrantes_asist_tec_path(@asist_tec)
    else
      render 'edit'
    end
  end

  def destroy
    if AsistTec.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to asist_tecs_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  def enviar
    @asist_tec = AsistTec.find(params[:id])
    @asist_tec.estado = AsistTec::ESTADOS[:enviado]
    @asist_tec.save!
    flash[:success] = "Solicitud enviada"
    redirect_to 'index'
  end

  private
    def asist_tec_params
      params.require(:asist_tec).permit(:nombre_grupo, :nombre, :apellido, :num_cuit,
       :domicilio, :provincia, :num_registro, :telefono, :email, :localidad, :monto_letra, :monto_numero, :codigo_postal, :anio_inicio)
    end
end