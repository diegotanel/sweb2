class InstitucionesQueDieronApoyoController < ApplicationController
 def destroy
		@func_sala = FuncionamientoSalaV2.find(params[:funcionamiento_sala_v2_id])
	    @registro = InstitucionQueDieronApoyoController.find(params[:id])   
	    @func_sala.instituciones_que_dieron_apoyo_controller
	    if @registro.destroy
	       flash[:notice] = 'Registro eliminado exitosamente.'
	    else
	       flash[:notice] = 'El registro no pudo ser eliminado. Ha ocurrido un error.'        
	    end            

	    respond_to do |format|   
      		format.js { }
    	end 
	end
end
