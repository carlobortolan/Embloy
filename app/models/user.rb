class User < ApplicationRecord
  has_secure_password

  validates :email, presence: { "error": "ERR_BLANK", "description": "Attribute can't be blank" }, uniqueness: { "error": "ERR_TAKEN", "description": "Attribute is already taken" }, format: { with: /\A[^@\s]+@[^@\s]+\z/, "error": "ERR_INVALID", "description": "Attribute is malformed or unknown" }

  validates :first_name, presence: { "error": "ERR_BLANK", "description": "Attribute can't be blank" }, uniqueness: false

  validates :last_name, presence: { "error": "ERR_BLANK", "description": "Attribute can't be blank" }, uniqueness: false
  validates :password, presence: { "error": "ERR_BLANK", "description": "Attribute can't be blank" }, uniqueness: false, length: { minimum: 8, maximum: 72 }

  has_many :jobs, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :notifications, as: :recipient, dependent: :destroy
=begin
  class Blocked < StandardError
  end

  class Inactive < StandardError
  end

  class MrNobody < StandardError
  end
=end
  validates :longitude, presence: false
  validates :latitude, presence: false
  validates :country_code, presence: false
  validates :postal_code, presence: false
  validates :city, presence: false
  validates :address, presence: false
  validates :user_type, presence: false
  validates :image_url, presence: false

  def full_name
    "#{first_name} #{last_name}"
  end

end