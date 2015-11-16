class IntegrantesParticipaProyectoSubsidioController < ApplicationController
  def destroy
	@func_sala = FuncionamientoSalaV2.find(params[:funcionamiento_sala_v2_id])
    @reg_a_eliminar = IntegranteParticipaProyectoSubsidio.find(params[:id])   
    @func_sala.integrantes_participa_proyecto_subsidio
    if @reg_a_eliminar.destroy
       flash[:notice] = 'Registro eliminado exitosamente.'
    else
       flash[:notice] = 'El registro no pudo ser eliminado. Ha ocurrido un error.'        
    end            
    respond_to do |format|   
  		format.js { }
	end 
  end
end
