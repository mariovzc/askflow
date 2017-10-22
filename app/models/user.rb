class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, uniqueness: true, format: /@/
  validates :password, presence: true, on: :create
  validates :password, length: { in: 6..20 }, allow_nil: true
  validates :password, confirmation: true
end
