class RegistrosPlanDeGastoDeFuncionamientoDeSalaController < ApplicationController
	
	def destroy
		@func_sala = FuncionamientoSalaV2.find(params[:funcionamiento_sala_v2_id])
	    @registro = RegistroPlanDeGastoDeFuncionamientoDeSala.find(params[:id])   
	    @func_sala.registros_plan_de_gasto_de_funcionamiento_de_sala
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
