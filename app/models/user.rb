class User < ApplicationRecord
  has_secure_password
  has_many :sites, dependent: :destroy

  enum :role, { admin: 0, editor: 1 }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
end
