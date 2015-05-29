class ConsultasEstadoController < ApplicationController
	before_action :signed_in_user, only: [:index]

  def index
    @p = Tramite.where(user_id: current_user).search(params[:p])
    @tramites = @p.result.includes(:tramites, :asist_tecs, :becas_artis, :becas_estudios, :becas_gestion, :pros_inves, :realiza_eventos, :pub_periodicas, :pub_eventuales)
  end

end
