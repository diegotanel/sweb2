# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
	inflect.irregular 'asist_tec', 'asist_tecs'
	inflect.irregular 'pub_eventual', 'pub_eventuales'
	inflect.irregular 'pub_periodica', 'pub_periodicas'
	inflect.irregular 'realiza_evento', 'realiza_eventos'
	inflect.irregular 'pro_inves', 'pros_inves'
	inflect.irregular 'beca_artis', 'becas_artis'
	inflect.irregular 'beca_gestion', 'becas_gestion'
	inflect.irregular 'beca_estudios', 'becas_estudios'
	inflect.irregular 'error', 'errores'
	inflect.irregular 'solicitud_soporte', 'solicitudes_soporte'
	inflect.irregular 'solicitud', 'solicitudes'
	inflect.irregular 'tramite', 'tramites'
	inflect.irregular 'consulta_estado', 'consultas_estado'
	inflect.irregular 'integrante_asist_tec', 'integrantes_asist_tec'
	inflect.irregular 'funcionamiento_sala', 'funcionamiento_salas'
	inflect.irregular 'funcionamiento_sala_v2', 'funcionamiento_salas_v2'
	inflect.irregular 'user', 'users'
	inflect.irregular 'registro_plan_de_gasto_de_funcionamiento_de_sala', 'registros_plan_de_gasto_de_funcionamiento_de_sala'
	inflect.irregular 'integrante_participa_proyecto_subsidio', 'integrantes_participa_proyecto_subsidio'
	inflect.irregular 'institucion_que_dieron_apoyo', 'instituciones_que_dieron_apoyo'
end