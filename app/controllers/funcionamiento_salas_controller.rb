class FuncionamientoSalasController < ApplicationController
  before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update, :enviar]

  def new
    @func_sala = FuncionamientoSala.new
    cargar_datos_func_sala
  end

  def show
    @func_sala = FuncionamientoSala.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'FuncionamientoSala') ? current_user.tramites.where(tramitable_type: 'FuncionamientoSala') : []
  end

  def create
    @func_sala = FuncionamientoSala.new(func_sala_params)
    @func_sala.saltear_validaciones_de_presencia = true
    if @func_sala.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @func_sala
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to funcionamiento_sala_path(@func_sala)
      end
    else
      cargar_datos_func_sala
      render 'new'
    end
  end

  def edit
    @func_sala = FuncionamientoSala.find(params[:id])
  end

  def update
    @func_sala = FuncionamientoSala.find(params[:id])
    @func_sala.saltear_validaciones_de_presencia = true
    if @func_sala.update_attributes(func_sala_params)
      flash[:success] = "Solicitud actualizada"
      redirect_to funcionamiento_sala_path(@func_sala)
    else
      render 'edit'
    end
  end

  def destroy
    if FuncionamientoSala.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to funcionamiento_salas_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  def enviar
    @func_sala = FuncionamientoSala.find(params[:id])
    @func_sala.estado = FuncionamientoSala::ESTADOS[:enviado]
    @func_sala.save!
    flash[:success] = "Solicitud enviada"
    redirect_to funcionamiento_salas_path
  end

  private
    def func_sala_params
      params.require(:func_sala).permit(:nombre_grupo, :nombre, :apellido, :num_cuit,
       :domicilio, :provincia, :telefono, :email, :localidad, :monto_letra, :monto_numero, :codigo_postal, :anio_inicio)
    end

    def cargar_datos_func_sala
      ActiveRecord::Base.establish_connection(:inteatro_db_prueba).connection
      query = "select * from REGISDIG where cuil = 20299050883"
      result = ActiveRecord::Base.connection.select_all(query)
      resultado = result.to_hash[0]
      query_prov = "select * from PROVIN where codigo = #{resultado["PROVINCIA"]}"
      result_prov = ActiveRecord::Base.connection.select_all(query_prov)
      resultado_prov = result_prov.to_hash[0]
      query_loc = "select * from LOCALIDADES where CODLOC = #{resultado["LOCALIDAD"]}"
      result_loc = ActiveRecord::Base.connection.select_all(query_loc)
      resultado_loc = result_loc.to_hash[0]
      @nombre_responsable = resultado["NOMBRE"].squish
      @apellido_responsable = resultado["APELLIDO"]
      @num_cuit_responsable = resultado["CUIL"].to_i.to_s
      @domicilio_responsable = resultado["DOMIPART"]
      @localidad_responsable = resultado_loc["NOMLOC"]
      @provincia_responsable = resultado_prov["descrip"].squish
      @codigo_postal_responsable = resultado["COPOST"]
      @email_responsable = resultado["EMAIL"].squish
      @telefono_responsable = resultado["TELEPART"]
      ActiveRecord::Base.establish_connection(:development).connection
    end

end