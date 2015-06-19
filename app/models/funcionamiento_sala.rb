class FuncionamientoSala < ActiveRecord::Base
	before_save :validacion_digitoverificador_de_cuit_cuil!

  attr_accessor :saltear_validaciones_de_presencia

  has_one :tramite, as: :tramitable, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	ESTADOS = {:enviado => 1, :borrador => 2 }
	before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :nombre_sala, presence: true, unless: :saltear_validaciones_de_presencia
  validates :nombre_sala, length: {maximum: 70}
  validates :domicilio_sala, presence: true, unless: :saltear_validaciones_de_presencia
  validates :domicilio_sala, length: {maximum: 70}
  validates :localidad_sala, presence: true, unless: :saltear_validaciones_de_presencia
  validates :localidad_sala, length: {maximum: 70}
  validates :codigo_postal_sala, presence: true, unless: :saltear_validaciones_de_presencia
  validates :codigo_postal_sala, numericality: { only_integer: true }
  validates :provincia_sala, presence: true, unless: :saltear_validaciones_de_presencia
  validates :provincia_sala, length: {maximum: 70}
  validates :nombre, presence: true, unless: :saltear_validaciones_de_presencia
  validates :nombre, length: {maximum: 70}
  validates :apellido, presence: true, unless: :saltear_validaciones_de_presencia
  validates :apellido, length: {maximum: 70}
  validates :fecha_inicio, presence: true, unless: :saltear_validaciones_de_presencia
  validates :num_cuit, presence: true, unless: :saltear_validaciones_de_presencia
  validates :num_cuit, length: {maximum: 11, minimum: 11}, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }
	validates :estado, :presence => true, :inclusion => { :in => self::ESTADOS.values }
	validates :domicilio, presence: true, unless: :saltear_validaciones_de_presencia
	validates :localidad, presence: true, unless: :saltear_validaciones_de_presencia
	validates :codigo_postal, presence: true, unless: :saltear_validaciones_de_presencia
  validates :codigo_postal, numericality: { only_integer: true }
  validates :provincia, presence: true, unless: :saltear_validaciones_de_presencia
  validates :email, presence: true, unless: :saltear_validaciones_de_presencia
  validates :email, format: {with: VALID_EMAIL_REGEX}
  validates :telefono, presence: true, unless: :saltear_validaciones_de_presencia
  validates :telefono, numericality: { only_integer: true }
  validates :monto_letra, presence: true, unless: :saltear_validaciones_de_presencia
  validates :monto_numero, presence: true, unless: :saltear_validaciones_de_presencia
  validates :monto_numero, numericality: { only_integer: true }

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
