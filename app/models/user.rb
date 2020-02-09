class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :messages
  has_many :icons

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  
  validates :nickname,              presence: true, length: {maximum: 20}
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128},    format: { with: PASSWORD_VALIDATION }
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}

  # params.delete(:current_password)

  # if params[:password].blank? && params[:password_confirmation].blank?
  #   params.delete(:password)
  #   params.delete(:password_confirmation)
  # end

  # result = update_attributes(params, *options)
  # clean_up_passwords
  # result

end
