class StaticPagesController < ApplicationController
	
  def home
  	@func_sala_v2_borradores = FuncionamientoSalaV2.where(estado: 2)
  	@func_sala_v2_enviados = FuncionamientoSalaV2.where(estado: 1)
  end
end
