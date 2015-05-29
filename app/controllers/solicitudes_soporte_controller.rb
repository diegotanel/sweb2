class SolicitudesSoporteController < ApplicationController
  before_action :signed_in_user, only: [:index]

	def index
    @q = Tramite.search(params[:q])
    @tramites = @q.result.includes(:tramites, :asist_tecs, :becas_artis, :becas_estudios, :becas_gestion, :pros_inves, :realiza_eventos, :pub_periodicas, :pub_eventuales)
  end
end
