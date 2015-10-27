class FuncionamientoSalasV2Controller < ApplicationController
  #before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update, :enviar]

  def new
    @func_sala = FuncionamientoSalaV2.new
    @func_sala.form_func = params[:form_func] if params.has_key?(:form_func)
    @user = User.new
    #cargar_datos_func_sala
  end

  def desvincular_user
    @salas = FuncionamientoSalaV2.find(params[:id])
    @user = User.find(params[:id])
  end

  def show
    @func_sala = FuncionamientoSalaV2.find(params[:id])
  end

  def index
    @tramites = current_user.tramites.where(tramitable_type: 'FuncionamientoSalaV2') ? current_user.tramites.where(tramitable_type: 'FuncionamientoSalaV2') : []
  end

  def create      
    @func_sala = FuncionamientoSalaV2.new(params[:funcionamiento_sala])
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

  # def create

  #   params[:funcionamiento_sala][:fecha_inicio] = DateTime.now
  #   params[:funcionamiento_sala][:nombre] = "gonzalo"
  #   params[:funcionamiento_sala][:apellido] = "santander"
  #   params[:funcionamiento_sala][:num_cuit] = "20288034363"
  #   params[:funcionamiento_sala][:domicilio] = "carlos calvo 2345"
  #   params[:funcionamiento_sala][:localidad] = "ciudadela"
  #   params[:funcionamiento_sala][:codigo_postal] = "1702"
  #   params[:funcionamiento_sala][:provincia] = "buenos aires"
  #   params[:funcionamiento_sala][:email] = "gsantacruz@gmail.com"
  #   params[:funcionamiento_sala][:telefono] = "46535689"

  #   @func_sala = FuncionamientoSalaV2.new(func_sala_params)     
    
    
  #   @func_sala.saltear_validaciones_de_presencia = true

  #   if @func_sala.save
  #     @tramite = current_user.tramites.create!()
  #     @tramite.tramitable = @func_sala
  #     if @tramite.save
  #         flash[:success] = "Solicitud correctamente creada"
  #         redirect_to funcionamiento_sala_path(@func_sala)
  #     else
  #         cargar_datos_func_sala          
  #         #render :partial => "/funcionamiento_sala/_form_funcionamiento_sala"
  #         format.html { render :new }
  #     end
  #   else
  #     cargar_datos_func_sala  
  #     render 'new'      
  #   end
  # end

  def edit
    @func_sala = FuncionamientoSalaV2.find(params[:id])
  end

  def update
    @func_sala = FuncionamientoSalaV2.find(params[:id])
    @func_sala.saltear_validaciones_de_presencia = true
    if @func_sala.update_attributes(func_sala_params)
      flash[:success] = "Solicitud actualizada"
      redirect_to funcionamiento_sala_path(@func_sala)
    else
      render 'edit'
    end
  end

  def destroy
    if FuncionamientoSalaV2.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to funcionamiento_salas_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

  def enviar
    @func_sala = FuncionamientoSalaV2.find(params[:id])
    @func_sala.estado = FuncionamientoSalaV2::ESTADOS[:enviado]
    @func_sala.save!
    flash[:success] = "Solicitud enviada"
    redirect_to funcionamiento_salas_path
  end

  # def obtener_usuario_by_email                       
  #     @user_encontrado = User.where("email = ?", params[:email])       
  #     @usuario_existe = params[:usuario_existe]

  #     @funcionamiento_sala = FuncionamientoSalaV2.new
  #     @user = User.new

  #     if @usuario_existe == "false" && @user_encontrado.count > 0
  #       @user = User.find(@user_encontrado[0]['id'])        
  #     else                
  #       @mensaje_error = "No existe el usuario"
  #     end

  #     @funcionamiento_sala.users << @user

  #     respond_to do | format |                                  
  #       format.js { }
  #     end
  # end

  private
    def func_sala_params
      params.require(:funcionamiento_sala).permit(:nombre_sala, :fecha_inicio, :domicilio_sala, :localidad_sala,
      :codigo_postal_sala, :provincia_sala, :descripcion_proyecto, :descripcion_estrategias, :detalle_plan_gastos, 
      :nombre, :apellido, :num_cuit, :domicilio, :codigo_postal, :domicilio, :localidad, :provincia, :email, :telefono,
      :monto_letra, :monto_numero, :user_ids => []) 

#      params.require(:funcionamiento_sala).permit! 
      #params.require(:hotel).permit(:name, room_categories_attributes: [ :id, :name ])
    end

    def cargar_datos_func_sala

      begin
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

        query_sala = "select * from REGISTRO where DENOMINACION = 'LA SALITA DE MARTIN'" 
        result_sala = ActiveRecord::Base.connection.select_all(query_sala)
        resultado_sala = result_sala.to_hash[0]

        @nombre_responsable = resultado["NOMBRE"].squish
        @apellido_responsable = resultado["APELLIDO"]
        @num_cuit_responsable = resultado["CUIL"].to_i.to_s
        @domicilio_responsable = resultado["DOMIPART"]
        @localidad_responsable = resultado_loc["NOMLOC"]
        @provincia_responsable = resultado_prov["descrip"].squish
        @codigo_postal_responsable = resultado["COPOST"]
        @email_responsable = resultado["EMAIL"].squish
        @telefono_responsable = resultado["TELEPART"]
        @denominacion_sala = resultado_sala["DENOMINACION"].squish
        @fecha_de_incio = resultado_sala["INICIO"]
        @domicilio_sala = resultado_sala["DOMICILIO"].squish
        @codigo_postal_sala = resultado_sala["COPOST"]

        query_prov = "select * from PROVIN where codigo = #{resultado_sala["provincia"]}"
        result_prov = ActiveRecord::Base.connection.select_all(query_prov)
        resultado_prov = result_prov.to_hash[0]
        query_loc = "select * from LOCALIDADES where CODLOC = #{resultado_sala["LOCALIDAD"]}"
        result_loc = ActiveRecord::Base.connection.select_all(query_loc)
        resultado_loc = result_loc.to_hash[0]
        @provincia_sala = resultado_prov["descrip"]
        @localidad_sala = resultado_loc["NOMLOC"]

        query_integrantes = "select * from Integrante where codigoRegistro = 6005"
        result_integrantes = ActiveRecord::Base.connection.select_all(query_integrantes)
        resultado_integrantes = result.to_hash[0]
      rescue

      ensure
        ActiveRecord::Base.establish_connection(:development).connection
      end

    end

end