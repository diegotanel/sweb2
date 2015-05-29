class PendientesDaController < ApplicationController
  def index
    @h = Tramite.search(params[:h])
    @tramites = @h.result.includes(:tramites, :asist_tecs, :becas_artis, :becas_estudios, :becas_gestion, :pros_inves, :realiza_eventos, :pub_periodicas, :pub_eventuales)
  end
end
