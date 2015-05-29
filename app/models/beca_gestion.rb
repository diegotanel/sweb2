class BecaGestion < ActiveRecord::Base
	before_save :validacion_digitoverificador_de_cuit_cuil!

  attr_accessor :saltear_validaciones_de_presencia

	has_one :tramite, as: :tramitable, dependent: :destroy
	validates :nombre, presence: true, unless: :saltear_validaciones_de_presencia
  validates :nombre, length: {maximum: 70}
  validates :apellido, presence: true, unless: :saltear_validaciones_de_presencia
  validates :apellido, length: {maximum: 70}
  validates :detalle, presence: true, unless: :saltear_validaciones_de_presencia
  validates :detalle, length: {maximum: 500}
  validates :num_cuit, presence: true, unless: :saltear_validaciones_de_presencia
  validates :num_cuit, length: {maximum: 11, minimum: 11}, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }

  default_scope -> { order('created_at DESC') }
	ESTADOS = {:enviado => 1, :borrador => 2 }
	validates :estado, :presence => true, :inclusion => { :in => self::ESTADOS.values }

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
			self.estado ||= BecaGestion::ESTADOS[:borrador]
		end
end