class FuncionamientoSalaV2 < ActiveRecord::Base
	#before_save :validacion_digitoverificador_de_cuit_cuil!

  attr_accessor :saltear_validaciones_de_presencia

  has_one :tramite, as: :tramitable, dependent: :destroy
  has_many :registros_plan_de_gasto_de_funcionamiento_de_sala
  has_many :integrantes_participa_proyecto_subsidio
  has_many :instituciones_que_dieron_apoyo


	default_scope -> { order('created_at DESC') }
	ESTADOS = {:enviado => 1, :borrador => 2 }
	#before_save { self.email = email.downcase }
 	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i


 validates :nombre_sala, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :nombre_sala, length: {maximum: 70}
 #  validates :fecha_inicio_sala, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :domicilio_sala, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :domicilio_sala, length: {maximum: 70}
 #  validates :localidad_sala, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :localidad_sala, length: {maximum: 70}
 #  validates :codigo_postal_sala, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :codigo_postal_sala, numericality: { only_integer: true }
 #  validates :provincia_sala, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :provincia_sala, length: {maximum: 70}
 #  validates :nombre_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :nombre_responsable, length: {maximum: 70}
 #  validates :apellido_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :apellido_responsable, length: {maximum: 70}
 #  validates :num_cuit_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :num_cuit_responsable, length: {maximum: 11, minimum: 11}, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }
  # validates :domicilio_responsable, presence: true, unless: :saltear_validaciones_de_presencia
  # validates :localidad_responsable, presence: true, unless: :saltear_validaciones_de_presencia
  # validates :codigo_postal_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :codigo_postal_responsable, numericality: { only_integer: true }
 #  validates :provincia_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :email_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :email_responsable, format: {with: VALID_EMAIL_REGEX}
 #  validates :telefono_responsable, presence: true, unless: :saltear_validaciones_de_presencia
 #  validates :telefono_responsable, numericality: { only_integer: true }

  validates :fecha_inicio_periodo_de_subsidio, :presence => true, unless: :saltear_validaciones_de_presencia
  #validates :solicitud_de_subsidio_por_primera_vez, :presence => true
  validates :estado, :presence => true, :inclusion => { :in => self::ESTADOS.values }, unless: :saltear_validaciones_de_presencia
  validates :monto_letra, presence: true, unless: :saltear_validaciones_de_presencia
  validates :monto_numero, presence: true, unless: :saltear_validaciones_de_presencia
  validates :monto_numero, numericality: { only_integer: true }, unless: :saltear_validaciones_de_presencia

	def validacion_digitoverificador_de_cuit_cuil!
	  @validador = ValidadorCuitCuil.new
	  if num_cuit.presence
	    unless @validador.validardigitoverificador(self.num_cuit)
	      errors[:num_cuit] << "debe estar formado correctamente"
	      return false
	    else
	      true
	    end
	  end
	end

	private
		after_initialize do
			self.estado ||= AsistTec::ESTADOS[:borrador]
		end

end

class TrueClass
  def yesno
    "Si"
  end
end

class FalseClass
  def yesno
    "No"
  end
end
