class IntegranteAsistTec < ActiveRecord::Base

	belongs_to :asist_tec

	before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :asist_tec, presence: true
	validates :nombre, presence: true
	validates :apellido, presence: true
	validates :dni, presence: true, numericality: { only_integer: true }
	validates :fecha_nacimiento, presence: true
	validates :domicilio, presence: true
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
	validates :telefono, presence: true, numericality: { only_integer: true }
end
