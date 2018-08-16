class User < ApplicationRecord
  belongs_to :household
  has_many :expenses
  has_many :payments

  has_secure_password
end
