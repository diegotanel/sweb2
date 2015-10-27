#encoding: utf-8
class User < ActiveRecord::Base
	attr_accessor :password_confirmation

  has_many :tramites, dependent: :destroy
  has_and_belongs_to_many :funcionamiento_salas

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :password_and_password_confirmation_equal
  validates :name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 100}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}
  #validate :password_and_password_confirmation_equal

  def password_and_password_confirmation_equal
    if self.password != self.password_confirmation
      errors.add(:password_confirmation, "tiene que ser igual que Contraseña")
    end
  end

  def authenticate(password)
    password == self.password
  end

  # def admin?
  #   ["fomento@inteatro.gov.ar", "coordinacion@inteatro.gov.ar", "dtanel@gmail.com"].include?(self.email)
  # end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
