class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true

  has_many :contacts, dependent: :destroy
end
